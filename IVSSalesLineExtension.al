tableextension 50160 IVSSalesLineExtension extends "Sales Line"
{
    fields
    {
        field(50150; "IDT Opt"; Text[1])
        {
            DataClassification = ToBeClassified;
        }

        field(50151; "IDT Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(50152; "IDT Unit"; Code[20])
        {
            DataClassification = ToBeClassified;
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