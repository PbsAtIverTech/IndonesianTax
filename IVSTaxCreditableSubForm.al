page 50162 IVSTaxCreditableSubForm
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = IVSTaxCreditable;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Creditable; Rec.Creditable)
                {

                }
                field(Description; Rec.Description)
                {

                }
                field("Default Value"; Rec."Default Value")
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