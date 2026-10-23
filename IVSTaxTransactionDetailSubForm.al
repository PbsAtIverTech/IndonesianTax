page 50160 IVSTaxTransactionDetailSubForm
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = IVSTaxTransactionDetail;
    Caption = 'Transaction Detail';

    layout
    {
        area(Content)
        {
            repeater(Overview)
            {
                field("Transaction Detail"; Rec."Transaction Detail")
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