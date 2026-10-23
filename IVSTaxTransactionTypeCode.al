table 50159 IVSTaxTransactionTypeCode
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Transaction Type Code"; Text[3])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Description; Text[255])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Transaction Detail"; Text[3])
        {
            DataClassification = ToBeClassified;
            TableRelation = IVSTaxTransactionDetail."Transaction Detail";
        }
    }

    keys
    {
        key(PK; "Transaction Detail", "Transaction Type Code")
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