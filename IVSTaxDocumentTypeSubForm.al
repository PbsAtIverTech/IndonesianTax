page 50159 IVSTaxDocumentTypeSubForm
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = IVSTaxDocumentType;
    Caption = 'Document Type';

    layout
    {
        area(Content)
        {
            repeater(Overview)
            {
                field("Document Type"; Rec."Document Type")
                {

                }
                field(Description; Rec.Description)
                {

                }
                field("Tax Type"; Rec."Tax Type")
                {

                }
                field("Transaction Type"; Rec."Transaction Type")
                {

                }
                field(Default; Rec.Default)
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}