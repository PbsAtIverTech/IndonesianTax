table 50150 IVSTaxKodeBarangJasa
{
    DataClassification = ToBeClassified;
    Caption = 'Kode Barang Jasa';

    fields
    {
        field(1; "Kode Barang/jasa"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;

        }

        field(3; "Barang/Jasa"; Enum IVSBarangJasa)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Kode Barang/Jasa", "Barang/Jasa")
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
        salesHeader: Record "Sales Header";

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