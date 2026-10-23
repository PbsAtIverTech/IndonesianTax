tableextension 50157 IVSReportSelectionsExtension extends "Report Selections"
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
        // Add changes to field groups her
    }

    var
        myInt: Integer;

    trigger OnAfterInsert()
    begin
        message('insert report selection');
    end;
}