pageextension 50153 IVSCustomerCardExtension extends "Customer Card"
{

    layout
    {
        addafter(Invoicing)
        {
            group("Indonesian Tax")
            {
                field("NITKU"; Rec.NITKU)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("NPWP Name"; Rec."NPWP Name")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("NPWP Number"; Rec."NPWP Number")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("NPWP Address"; Rec."NPWP Address")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Taxable Entrepeneur Number"; Rec."Taxable Entrepeneur Number")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Calculate Withholding Tax"; Rec."Calculate Withholding Tax")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Transaction Detail"; Rec."Transaction Detail")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Transaction Document"; Rec."Transaction Document")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Transaction Type Code"; Rec."Transaction Type Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Withholding Tax Group"; Rec."Withholding Tax Group")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Withholding Tax Recog. Event"; Rec."Withholding Tax Recog. Event")
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