page 50165 IVSTaxTransTypeCodeSubForm
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = IVSTaxTransactionTypeCode;
    Caption = 'Transaction Type Code';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Transaction Type Code"; Rec."Transaction Type Code")
                {

                }
                field(Description; Rec.Description)
                {

                }
                field("Transaction Detail"; Rec."Transaction Detail")
                {

                }
            }
        }
    }

    var
        myInt: Integer;
}