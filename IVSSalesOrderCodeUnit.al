codeunit 50152 IVSSalesOrderCodeUnit
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterCheckSellToCust, '', false, false)]
    local procedure OnAfterCheckSellToCust(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header"; Customer: Record Customer; CurrentFieldNo: Integer)

    begin
        SalesHeader.NITKU := Customer.NITKU;
        SalesHeader."NPWP Number" := Customer."NPWP Number";
        SalesHeader."NPWP Name" := Customer."NPWP Name";
        SalesHeader."NPWP Address" := Customer."NPWP Address";
        SalesHeader."Tax Transaction Type" := Customer."Transaction Type";
        SalesHeader."Transaction Detail" := Customer."Transaction Detail";
        SalesHeader."Transaction Type Code" := Customer."Transaction Type Code";
        SalesHeader."Taxable Entrepeneur Number" := Customer."Taxable Entrepeneur Number";
        SalesHeader."Registration Date" := Customer."Registration Date";
        SalesHeader."Calculate Withholding Tax" := Customer."Calculate Withholding Tax";
        SalesHeader."Withholding Tax Group" := Customer."Withholding Tax Group";
        SalesHeader."Withholding Tax Recog. Event" := Customer."Withholding Tax Recog. Event";
    end;


    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterAssignItemValues, '', false, false)]

    local procedure OnAfterAssignItemValues(var SalesLine: Record "Sales Line"; Item: Record Item; SalesHeader: Record "Sales Header"; var xSalesLine: Record "Sales Line"; CurrentFieldNo: Integer)
    var
        CompanyInfo: Record "Company Information";
        UOM: Record "Unit of Measure";
        TaxUOM: Record IVSTaxUnitOfMeasure;
    begin
        CompanyInfo.get();
        SalesLine."IDT Opt" := Item.Type = "Item Type"::Inventory ? 'A' : 'B';

        if SalesLine.Type = "Sales Line Type"::Item then begin
            SalesLine."IDT Code" := Item."Kode Barang/Jasa" <> '' ?
                                    Item."Kode Barang/Jasa" :
                                        Item.Type = "Item Type"::Inventory ?
                                            CompanyInfo."Default Kode Item" : CompanyInfo."Default Kode Service";

            if SalesLine."Unit of Measure Code" <> '' then
                if UOM.get(SalesLine."Unit of Measure Code") then
                    SalesLine."IDT Unit" := UOM.IVSTaxUOMCode;

            if SalesLine."IDT Unit" = '' then begin
                if Item.Type = "Item Type"::Inventory then
                    SalesLine."IDT Unit" := CompanyInfo."Default Kode UOM Item";

                if Item.Type = "Item Type"::Service then
                    SalesLine."IDT Unit" := CompanyInfo."Default Kode UOM Service";
            end;
        end
        else if SalesLine.Type = "Sales Line Type"::"G/L Account" then begin
            SalesLine."IDT Code" := CompanyInfo."Default Kode Item";
            SalesLine."IDT Unit" := CompanyInfo."Default Kode UOM Item";
        end;


    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterAssignGLAccountValues, '', false, false)]
    local procedure OnAfterAssignGLAccountValues(var SalesLine: Record "Sales Line"; GLAccount: Record "G/L Account"; SalesHeader: Record "Sales Header"; var TempSalesLine: Record "Sales Line" temporary)
    var
        CompanyInfo: Record "Company Information";
    begin
        CompanyInfo.get();
        SalesLine."IDT Opt" := 'A';
        SalesLine."IDT Code" := CompanyInfo."Default Kode Item";
        SalesLine."IDT Unit" := CompanyInfo."Default Kode UOM Item";
    end;
}