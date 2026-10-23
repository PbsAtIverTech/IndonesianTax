table 50154 IVSTaxDecentralizationSetup
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Branch; Text[3])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Company; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Site; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4; NPWPNumber; Text[25])
        {
            DataClassification = ToBeClassified;
        }
        field(5; NPWPName; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(6; NPWPAddress; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(7; NumSeqCreditNote; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(8; NumSeqTaxInvoice; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(9; PKP; Text[25])
        {
            DataClassification = ToBeClassified;
        }
        field(10; SignatureCity; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(11; SignatureId; Text[3])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; Company, Site, Branch)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}