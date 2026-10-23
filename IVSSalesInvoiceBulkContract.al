codeunit 50155 IVSSalesInvoiceBulkContract
{
    SingleInstance = false;

    // Method to parse incoming JSON payload into local variables or a record
    procedure ImportCustomerFromJson(JsonInput: Text)
    var
        JObject: JsonObject;
        JToken: JsonToken;
        CustName: Text;
        CustEmail: Text;
    begin
        // Read the text into a JsonObject
        if not JObject.ReadFrom(JsonInput) then
            Error('Invalid JSON format.');

        // Extract values safely using SelectToken or Get
        if JObject.Get('name', JToken) then
            CustName := JToken.AsValue().AsText();

        if JObject.Get('email', JToken) then
            CustEmail := JToken.AsValue().AsText();

        // Process your business logic here
        ProcessCustomerData(CustName, CustEmail);
    end;

    // Method to generate an outgoing JSON payload
    procedure ExportBulkInvoiceToJson(InvoiceIds: List Of [Code[20]]): Text
    var
        SalesInvHeader: Record "Sales Invoice Header";
        SalesInvLine: Record "Sales Invoice Line";
        JObject: JsonObject;
        JCustObject: JsonObject;
        JLineObject: JsonObject;
        JLineArray: JsonArray;
        JArrayInv: JsonArray;
        OutText: Text;
        InvoiceId: Text[20];
    begin
        foreach InvoiceId in InvoiceIds do begin
            if not SalesInvHeader.Get(InvoiceId) then
                Error('Invoice %1 not found.', InvoiceId);

            // Build the JSON structure
            Clear(JObject);
            Clear(JCustObject);
            Clear(JLineArray);

            JObject.Add('client_reference_id', '');
            JObject.Add('transaction_detail', '');
            JObject.Add('additional_trx_detail', '');
            JObject.Add('substitution_flag', '');
            JObject.Add('substituted_faktur_id', '');
            JObject.Add('document_number', '');
            JObject.Add('document_date', '');
            JObject.Add('reference', '');
            JObject.Add('total_dpp', '');
            JObject.Add('total_ppn', '');
            JObject.Add('total_ppnbm', '');
            JObject.Add('downpayment_flag', '');
            JObject.Add('downpayment_dpp', '');
            JObject.Add('downpayment_ppn', '');
            JObject.Add('downpayment_ppnbm', '');

            JCustObject.Add('name', '');
            JCustObject.Add('nik', '');
            JCustObject.Add('npwp', '');
            JCustObject.Add('address', '');
            JCustObject.Add('email', '');
            JObject.Add('customer', JCustObject);

            SalesInvLine.SetRange("Document No.", SalesInvHeader."No.");
            if SalesInvLine.FindSet() then begin
                repeat
                    Clear(JLineObject);
                    JLineObject.Add('name', '');
                    JLineObject.Add('unit_price', '');
                    JLineObject.Add('quantity', '');
                    JLineObject.Add('discount', '');
                    JLineObject.Add('ppnbm_rate', '');
                    JLineObject.Add('dpp', '');
                    JLineObject.Add('ppn', '');
                    JLineObject.Add('ppnbm', '');
                    JLineArray.Add(JLineObject);
                until SalesInvLine.Next() = 0;
            end;

            JObject.add('items', JLineArray);

            JArrayInv.Add(JObject);
        end;

        JArrayInv.WriteTo(OutText);
        exit(OutText);
    end;

    local procedure ProcessCustomerData(Name: Text; Email: Text)
    begin
        // Insert or update logic in Business Central tables
    end;
}