table 50162 IVSCoreTaxParameter
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Mapping Field"; enum IVSTaxNumberType)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Column Number"; Integer)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK; "Mapping Field")
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