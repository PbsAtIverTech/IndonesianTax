page 50158 IVSTaxTransactionTypeSubForm
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = IVSTaxTransactionType;
    Caption = 'Transaction Type';

    layout
    {
        area(Content)
        {
            repeater(Overview)
            {
                field("Transaction Type"; Rec."Transaction Type")
                {

                }

                field(Description; Rec.Description)
                {

                }
                field("Tax Type"; Rec."Tax Type")
                {

                }
            }
        }
    }

    var
        myInt: Integer;
}