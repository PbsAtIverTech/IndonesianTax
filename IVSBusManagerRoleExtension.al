pageextension 50157 IVSBusManagerRoleExtension extends "Business Manager Role Center"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast(Action40)
        {
            action("Indonesian Tax Setup")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Indonesian Tax Setup';
                RunObject = Page IVSIndonesianTaxSetupForm;
                ToolTip = 'View or edit detailed information for Indonesian Tax.';
            }

        }
    }

    var
        myInt: Integer;
}