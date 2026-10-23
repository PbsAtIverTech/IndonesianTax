table 50152 IVSTaxUnitOfMeasure
{
    Caption = 'Unit of measure';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Kode; Code[20])
        {
            Caption = 'Unit of measurement code';
            DataClassification = ToBeClassified;
        }

        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; Kode)
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