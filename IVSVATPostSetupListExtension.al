pageextension 50156 IVSVATPostSetupListExtension extends "VAT Posting Setup"
{
    layout
    {
        addlast(Control1)
        {
            field("Tax Type"; Rec."Tax Type")
            {
                ApplicationArea = Basic, Suite;
            }
            field("Tax In/Out"; Rec."Tax In/Out")
            {
                ApplicationArea = Basic, Suite;
            }
            field("Tax Rate PPn Lain"; Rec."Tax Rate PPn Lain")
            {
                ApplicationArea = Basic, Suite;
            }
            field("Tax Ratio PPn Lain"; Rec."Tax Ratio PPn Lain")
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}