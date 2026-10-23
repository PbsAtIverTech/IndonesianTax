page 50151 IVSTaxFiscalNumSeqSubForm
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = IVSTaxFiscalNumberSequence;
    Editable = true;
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    Caption = 'Fiscal Number Sequence';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Fiscal Calendar Year"; Rec."Fiscal Calendar Year")
                {

                }
                field("Number Sequence Code"; Rec."Number Sequence Code")
                {

                }
            }
        }
    }
}