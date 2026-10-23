tableextension 50156 IVSCustomerExtension extends Customer
{
    fields
    {
        field(50150; NITKU; Text[6])
        {
            DataClassification = ToBeClassified;
        }
        field(50151; "NPWP Name"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(50152; "NPWP Number"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(50153; "NPWP Address"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(50154; "Transaction Type"; Text[3])
        {
            DataClassification = ToBeClassified;
        }
        field(50155; "Transaction Detail"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50156; "Transaction Document"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50157; "Transaction Type Code"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50158; "Taxable Entrepeneur Number"; Text[25])
        {
            DataClassification = ToBeClassified;
        }
        field(50159; "Registration Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50160; "Calculate Withholding Tax"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50161; "Withholding Tax Group"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50162; "Withholding Tax Recog. Event"; Text[255])
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