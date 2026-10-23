pageextension 50155 IVSVATPostSetupCardExtension extends "VAT Posting Setup Card"
{
    layout
    {
        addlast(content)
        {
            group("Indonesian Tax")
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
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}