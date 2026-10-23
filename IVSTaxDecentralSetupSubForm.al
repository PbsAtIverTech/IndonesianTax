page 50157 IVSTaxDecentralSetupSubForm
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = IVSTaxDecentralizationSetup;
    Caption = 'Decentralization tax setup';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Branch; Rec.Branch)
                {

                }
                field(Company; Rec.Company)
                {

                }
                field(Site; Rec.Site)
                {

                }
                field(NPWPNumber; Rec.NPWPNumber)
                {

                }
                field(NPWPName; Rec.NPWPName)
                {

                }
                field(NPWPAddress; Rec.NPWPAddress)
                {

                }
                field(NumSeqCreditNote; Rec.NumSeqCreditNote)
                {

                }
                field(NumSeqTaxInvoice; Rec.NumSeqTaxInvoice)
                {

                }
                field(PKP; Rec.PKP)
                {

                }
                field(SignatureCity; Rec.SignatureCity)
                {

                }
                field(SignatureId; Rec.SignatureId)
                {

                }
            }
        }
    }
}