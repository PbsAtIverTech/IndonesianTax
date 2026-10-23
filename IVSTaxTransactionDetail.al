table 50157 IVSTaxTransactionDetail
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Transaction Detail"; Text[3])
        {
            DataClassification = ToBeClassified;

        }

        field(2; Description; Text[255])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Tax Type"; enum IVSTaxInOut)
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Transaction Type"; Text[3])
        {
            DataClassification = ToBeClassified;
            TableRelation = IVSTaxTransactionType."Transaction Type";

        }
        field(5; Default; Boolean)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK; "Tax Type", "Transaction Type", "Transaction Detail")
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