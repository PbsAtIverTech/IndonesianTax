tableextension 50151 IVSItemExtension extends Item
{
    fields
    {
        field(50150; "Kode Barang/Jasa"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = IVSTaxKodeBarangJasa."Kode Barang/jasa";
            ValidateTableRelation = false;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}