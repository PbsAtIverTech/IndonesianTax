table 50158 IVSTaxTransactionDocument
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Transaction Document"; Text[3])
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
        field(5; "Transaction Detail"; Text[3])
        {
            DataClassification = ToBeClassified;
            TableRelation = IVSTaxTransactionDetail."Transaction Detail";

        }
        field(6; Default; Boolean)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK; "Tax Type", "Transaction Type", "Transaction Detail", "Transaction Document")
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