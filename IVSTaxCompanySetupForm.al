page 50156 IVSTaxCompanySetupForm
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = IVSTaxCompanySetup;
    Caption = 'Tax Company Setup';

    layout
    {
        area(Content)
        {
            group("Tax registration")
            {
                field(Activation; Rec.Activation)
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
                field(PKP; Rec.PKP)
                {

                }
                field(RegistrationDate; Rec.RegistrationDate)
                {

                }
                field(Branch; Rec.Branch)
                {

                }

                group("NUMBER SEQUENCE")
                {
                    field(NumSeqTaxInvoice; Rec.NumSeqTaxInvoice)
                    {

                    }
                }
            }

            group(Decentralization)
            {
                field(DecentralizeActivation; Rec.DecentralizeActivation)
                {

                }
            }
            group(Setup)
            {
                group("EXCHANGE RATE TYPE AND CURRENCY")
                {
                    field(ExchRateType; Rec.ExchRateType)
                    {

                    }
                }
                group("VAT CORRECTION")
                {
                    field(CorrectionJournalName; Rec.CorrectionJournalName)
                    {

                    }
                    field(CorrectionJournalDesc; Rec.CorrectionJournalDesc)
                    {

                    }
                    field(CorrectionAutoPostJour; Rec.CorrectionAutoPostJour)
                    {

                    }
                }
                group("WITHHOLDING TAX CORRECTION")
                {
                    field(WHTCorrection; Rec.WHTCorrection)
                    {

                    }
                    field(WHTCorrectionJournalName; Rec.WHTCorrectionJournalName)
                    {

                    }
                    field(WHTCorrectionJournalDesc; Rec.WHTCorrectionJournalDesc)
                    {

                    }
                    field(WHTCorrectAutoPostJour; Rec.WHTCorrectAutoPostJour)
                    {

                    }
                }
                group(CORETAX)
                {
                    field(ProductType; Rec.ProductType)
                    {

                    }
                    field(KodeBarangJasa; Rec.KodeBarangJasa)
                    {

                    }
                    field(KodeUOM; Rec.KodeUOM)
                    {

                    }
                }
            }
            group("Merged tax invoice")
            {
                field(MergingActivation; Rec.MergingActivation)
                {

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