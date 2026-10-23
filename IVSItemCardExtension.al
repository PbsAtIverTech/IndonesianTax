pageextension 50151 IVSItemCardExtension extends "Item Card"
{
    layout
    {
        addlast(InventoryGrp)
        {
            field("Kode Barang/Jasa"; Rec."Kode Barang/Jasa")
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}