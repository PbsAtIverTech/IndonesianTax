tableextension 50150 IVSBaseUnitOfMEasureExtension extends "Unit of Measure"
{
    fields
    {
        field(50150; IVSTaxUOMCode; Code[20])
        {
            Caption = 'Unit of measurement code';
            TableRelation = IVSTaxUnitOfMeasure.Kode;
        }
        // Add changes to table fields here
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