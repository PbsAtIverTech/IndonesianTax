pageextension 50152 IVSTaxCompanyInfoCardExtension extends "Company Information"
{
    layout
    {
        addafter(Communication)
        {
            group("Indonesian Tax")
            {
                field("Indonesian Tax Activation"; Rec."Indonesian Tax Activation")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(NITKU; Rec.NITKU)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Taxable Entrepeneur Number"; Rec."Taxable Entrepeneur Number")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Taxpayer Number"; Rec."Taxpayer Number")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Taxpayer Name"; Rec."Taxpayer Name")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Taxpayer Address"; Rec."Taxpayer Address")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Default Kode Item"; Rec."Default Kode Item")
                {
                    ApplicationArea = Basic, Suite;
                }

                field("Default Kode UOM Item"; Rec."Default Kode UOM Item")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Default Kode Service"; Rec."Default Kode Service")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Default Kode UOM Service"; Rec."Default Kode UOM Service")
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