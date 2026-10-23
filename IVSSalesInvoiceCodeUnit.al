codeunit 50156 IVSSalesInvoiceCodeUnit
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterSelltoCustomerNoOnAfterValidate, '', false, false)]
    local procedure OnAfterSelltoCustomerNoOnAfterValidate(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header")
    var
        Customer: Record Customer;
    begin
        Customer.Get(SalesHeader."Sell-to Customer No.");
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
}