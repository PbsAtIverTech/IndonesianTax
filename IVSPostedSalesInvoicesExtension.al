pageextension 50154 IVSPostedSalesInvsExtension extends "Posted Sales Invoices"
{
    layout
    {
    }

    actions
    {
        addlast(processing)
        {
            action(Coretax)
            {
                ApplicationArea = All;
                Caption = 'Coretax XML';
                Image = PrintAttachment;
                ToolTip = 'Create a XML file for Coretax.';

                trigger OnAction()
                var
                    SalesInvHeader: Record "Sales Invoice Header";
                begin
                    SalesInvHeader := Rec;
                    CurrPage.SetSelectionFilter(SalesInvHeader);
                    SalesInvHeader.GenerateCoretaxXML();
                end;
            }

            action("Coretax Excel")
            {
                ApplicationArea = All;
                Caption = 'Import Coretax Excel';
                Image = PrintAttachment;
                ToolTip = 'Get tax value from coretax.';
                RunObject = codeunit IVSImportExcelCoretax;
            }
        }

        addlast(Category_Category7)
        {
            actionref(Coretax_Ref; Coretax)
            {
            }

            actionref(Coretax_excel_Ref; "Coretax Excel")
            {
            }
        }
    }
}