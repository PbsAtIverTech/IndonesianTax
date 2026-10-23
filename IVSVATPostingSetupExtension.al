tableextension 50158 IVSVATPostingSetupExtension extends "VAT Posting Setup"
{
    fields
    {
        field(50150; "Tax Type"; Enum IVSTaxType)
        {
            DataClassification = ToBeClassified;
            Caption = 'Tax Type';
        }
        field(50151; "Tax In/Out"; Enum IVSTaxInOut)
        {
            DataClassification = ToBeClassified;
            Caption = 'Tax In/Out';
        }
        field(50152; "Estimate Revenue"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50153; "New Tariff"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50154; "Tax Rate PPn Lain"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50155; "Tax Ratio PPn Lain"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}