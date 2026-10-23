table 50155 IVSTaxTransactionType
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Transaction Type"; Text[3])
        {
            Caption = 'Transaction type';
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

    }

    keys
    {
        key(PK; "Tax Type", "Transaction Type")
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