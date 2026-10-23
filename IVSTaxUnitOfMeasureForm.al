page 50155 IVSTaxUnitOfMeasureForm
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = IVSTaxUnitOfMeasure;
    Caption = 'Tambah unit of measure code';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Kode; Rec.Kode)
                {
                    Caption = 'Kode';
                }

                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}