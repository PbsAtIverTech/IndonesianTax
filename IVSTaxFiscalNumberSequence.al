table 50161 IVSTaxFiscalNumberSequence
{
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Fiscal Calendar Year"; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Accounting Period".Name where("New Fiscal Year" = CONST(True));
            ValidateTableRelation = false;

        }
        field(2; "Number Sequence Code"; Text[25])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;

        }
    }

    keys
    {
        key(PK; "Fiscal Calendar Year")
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
        AccountPeriod: Record "Accounting Period";

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