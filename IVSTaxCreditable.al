table 50160 IVSTaxCreditable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Creditable; Text[3])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Description; Text[255])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Default Value"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK; Creditable)
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