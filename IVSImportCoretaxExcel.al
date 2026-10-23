codeunit 50157 IVSImportExcelCoretax
{
    Permissions = tabledata "Sales Invoice Header" = rm;
    trigger OnRun()
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        InStream: InStream;
        FileName: Text;
        SheetName: Text;
        RowNo: Integer;
        MaxRowNo: Integer;
    begin
        // 1. Prompt user to upload the Excel file
        if UploadIntoStream('Select Excel File', '', 'Excel Files (*.xlsx)|*.xlsx', FileName, InStream) then begin

            // 2. Select the first sheet automatically from the stream
            SheetName := TempExcelBuffer.SelectSheetsNameStream(InStream);

            // 3. Open the book and read the data into the temporary buffer
            TempExcelBuffer.OpenBookStream(InStream, SheetName);
            TempExcelBuffer.ReadSheet();

            // 4. Find the total number of rows
            if TempExcelBuffer.FindLast() then
                MaxRowNo := TempExcelBuffer."Row No.";

            // 5. Loop through rows (Starting at row 2 to skip headers)
            for RowNo := 2 to MaxRowNo do begin
                ProcessExcelRow(TempExcelBuffer, RowNo);
            end;

            Message('Import completed successfully.');
        end;
    end;

    local procedure ProcessExcelRow(var TempExcelBuffer: Record "Excel Buffer" temporary; RowNo: Integer)
    var
        SalesInvHeader: Record "Sales Invoice Header";
        InvNo: Code[20];
        NoFaktur: Code[20];
    begin
        // Fetch values by targeting specific Column Numbers
        if TempExcelBuffer.Get(RowNo, 16) then InvNo := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 20);
        if TempExcelBuffer.Get(RowNo, 5) then NoFaktur := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 100);

        // Insert or modify your Business Central table data here
        if (InvNo <> '') and (NoFaktur <> '') and (SalesInvHeader.Get(InvNo)) then begin

            SalesInvHeader."Nomor Faktur Pajak" := NoFaktur;
            SalesInvHeader.Modify();
        end;
    end;
}