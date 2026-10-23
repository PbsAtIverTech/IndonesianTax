page 50163 IVSCoretaxParameterSubForm
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = IVSCoretaxParameter;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Mapping Field"; Rec."Mapping Field")
                {

                }
                field("Column Number"; Rec."Column Number")
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