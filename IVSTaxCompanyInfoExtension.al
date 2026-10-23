tableextension 50152 IVSTaxCompanyInfoExtension extends "Company Information"
{
    fields
    {
        field(50150; "Indonesian Tax Activation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(50151; NITKU; Text[16])
        {
            DataClassification = ToBeClassified;
        }
        field(50152; "Taxable Entrepeneur Number"; Text[3])
        {
            DataClassification = ToBeClassified;
        }
        field(50153; "Taxpayer Number"; Text[25])
        {
            DataClassification = ToBeClassified;
        }
        field(50154; "Taxpayer Name"; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(50155; "Taxpayer Address"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(50156; "Default Kode Item"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = IVSTaxKodeBarangJasa."Kode Barang/jasa" where("Barang/Jasa" = CONST(IVSBarangJasa::Barang));
        }

        field(50157; "Default Kode UOM Item"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = IVSTaxUnitOfMeasure.Kode;
        }
        field(50158; "Default Kode Service"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = IVSTaxKodeBarangJasa."Kode Barang/jasa" where("Barang/Jasa" = CONST(IVSBarangJasa::Jasa));
        }
        field(50159; "Default Kode UOM Service"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = IVSTaxUnitOfMeasure.Kode;
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