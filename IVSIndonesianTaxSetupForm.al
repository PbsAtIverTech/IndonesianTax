page 50164 IVSIndonesianTaxSetupForm
{
    Caption = 'Indonesian Tax Setup';
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group("Transaction Type")
            {
                part(TransactionTypePart; IVSTaxTransactionTypeSubForm)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = true;
                    Enabled = true;
                    UpdatePropagation = Both;
                }
            }
            group("Document Type")
            {
                part(DocumentTypePart; IVSTaxDocumentTypeSubForm)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = true;
                    Enabled = true;
                    UpdatePropagation = Both;
                }
            }
            group("Transaction Detail")
            {
                part(TransactionDetailPart; IVSTaxTransactionDetailSubForm)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = true;
                    Enabled = true;
                    UpdatePropagation = Both;
                }
            }
            group("Transaction Document")
            {
                part(TransactionDocumentPart; IVSTaxTransDocumentSubForm)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = true;
                    Enabled = true;
                    UpdatePropagation = Both;
                }
            }
            group("Transaction Type Code")
            {
                part(TransactionTypeCodePart; IVSTaxTransTypeCodeSubForm)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = true;
                    Enabled = true;
                    UpdatePropagation = Both;
                }
            }
            group("Creditable")
            {
                part(CreditableCodePart; IVSTaxCreditableSubForm)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = true;
                    Enabled = true;
                    UpdatePropagation = Both;
                }
            }
            group("Number Sequence")
            {
                part(NumberSequencePart; IVSTaxFiscalNumSeqSubForm)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = true;
                    Enabled = true;
                    UpdatePropagation = Both;
                }
            }
            group("Coretax")
            {
                part(CoretaxPart; IVSCoretaxParameterSubForm)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = true;
                    Enabled = true;
                    UpdatePropagation = Both;
                }
            }

        }
    }

    var
        myInt: Integer;
}