pageextension 50150 IVSBaseUOMListExtension extends "Units of Measure"
{
    layout
    {
        addlast(Control1)
        {
            field(IVSTaxUOMCode; Rec.IVSTaxUOMCode)
            {
                Caption = 'Tax unit of measure';
                ApplicationArea = All;
                ToolTip = 'Specifies a description of the unit of measure.';
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}