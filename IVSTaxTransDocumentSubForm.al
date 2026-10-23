page 50161 IVSTaxTransDocumentSubForm
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = IVSTaxTransactionDocument;
    Caption = 'Transaction Document';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Transaction Document"; Rec."Transaction Document")
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
                field("Transaction Detail"; Rec."Transaction Detail")
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