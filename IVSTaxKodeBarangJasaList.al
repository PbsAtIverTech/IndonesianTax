page 50150 IVSTaxKodeBarangJasaList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = IVSTaxKodeBarangJasa;
    Caption = 'Kode Barang Jasa';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Kode Barang/jasa"; Rec."Kode Barang/jasa")
                {

                }
                field(Description; Rec.Description)
                {

                }
                field("Barang/jasa"; Rec."Barang/jasa")
                {

                }
            }
        }
        area(Factboxes)
        {

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
}