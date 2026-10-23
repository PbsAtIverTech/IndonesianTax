tableextension 50153 IVSVAtAmountLineExtension extends "VAT Amount Line"
{
    fields
    {
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

    trigger OnAfterInsert()
    begin
        message('vat amount line insert');
    end;

    local procedure MyProcedure()
    var
        myInt: Integer;
    begin
        "VAT Amount" := 0;
    end;

}