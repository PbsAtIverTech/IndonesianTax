codeunit 50151 IVSSalesPostCodeUnitExtension
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnInsertInvoiceHeaderOnAfterSalesInvHeaderTransferFields, '', false, false)]
    local procedure OnAfterSalesInvHeaderTransferFields(var SalesHeader: Record "Sales Header"; var SalesInvoiceHeader: Record "Sales Invoice Header")
    var
        customer: Record Customer;
        CompanyInfo: Record "Company Information";
    begin
        CompanyInfo.get();
        if (CompanyInfo."Indonesian Tax Activation" = true) then begin
            // customer.setRange("No.", SalesHeader."Sell-to Customer No.");
            // if customer.get() then begin
            SalesInvoiceHeader."NPWP Number" := SalesHeader."NPWP Number";
            SalesInvoiceHeader."NPWP Name" := SalesHeader."NPWP Name";
            salesInvoiceHeader."NPWP Address" := SalesHeader."NPWP Address";
            SalesInvoiceHeader."Tax Transaction Type" := SalesHeader."Transaction Type";
            SalesInvoiceHeader."Transaction Document" := SalesHeader."Transaction Document";
            SalesInvoiceHeader."Transaction Detail" := SalesHeader."Transaction Detail";
            SalesInvoiceHeader."Transaction Type Code" := SalesHeader."Transaction Type Code";
            SalesInvoiceHeader."Taxable Entrepeneur Number" := SalesHeader."Taxable Entrepeneur Number";
            SalesInvoiceHeader."Registration Date" := SalesHeader."Registration Date";
            SalesInvoiceHeader."Calculate Withholding Tax" := SalesHeader."Calculate Withholding Tax";
            SalesInvoiceHeader."Withholding Tax Group" := SalesHeader."Withholding Tax Group";
            SalesInvoiceHeader."Withholding Tax Recog. Event" := SalesHeader."Withholding Tax Recog. Event";
            // end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforeSalesInvLineInsert, '', false, false)]
    local procedure OnBeforeSalesInvLineInsert(var SalesInvLine: Record "Sales Invoice Line"; SalesInvHeader: Record "Sales Invoice Header"; SalesLine: Record "Sales Line"; CommitIsSuppressed: Boolean; var IsHandled: Boolean; PostingSalesLine: Record "Sales Line"; SalesShipmentHeader: Record "Sales Shipment Header"; SalesHeader: Record "Sales Header"; var ReturnReceiptHeader: Record "Return Receipt Header")
    var
        CompanyInfo: Record "Company Information";
    begin
        if (CompanyInfo."Indonesian Tax Activation" = true) then begin
            SalesInvLine."IDT Opt" := SalesLine."IDT Opt";
            SalesInvLine."IDT Code" := SalesLine."IDT Code";
            SalesInvLine."IDT Unit" := SalesLine."IDT Unit";
        end;
    end;

    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;
}