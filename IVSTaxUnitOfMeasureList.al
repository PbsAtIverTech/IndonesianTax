page 50154 IVSTaxUnitOfMeasureList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = IVSTaxUnitOfMeasureForm;
    SourceTable = IVSTaxUnitOfMeasure;
    Caption = 'Tax unit of measure';
    DataCaptionFields = Description;
    Editable = false;
    QueryCategory = 'Unit of measure';
    RefreshOnActivate = true;
    // SourceTableView = where("Document Type" = const(Order));
    // AdditionalSearchTerms = 'Sales Commitments, Sales Order Overview, Sale Orders, Order Log, Sale List, Client Orders';

    AboutTitle = 'Parameter UOM pada tax indonesia (coretax)';
    AboutText = 'Parameter untuk memetakan UOM ERP dengan Coretax';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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
}