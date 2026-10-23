table 50153 IVSTaxCompanySetup
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Branch; Text[3])
        {
            Caption = 'Branch';
            DataClassification = ToBeClassified;
        }
        field(2; CorrectionJournalDesc; Text[60])
        {
            Caption = 'Correction journal description';
            DataClassification = ToBeClassified;
        }
        field(3; CorrectionJournalName; Text[10])
        {
            Caption = 'Correction journal name';
            DataClassification = ToBeClassified;
        }
        field(4; Company; Text[10])
        {
            Caption = 'Company';
            DataClassification = ToBeClassified;
        }
        field(5; ExchRateType; Text[20])
        {
            Caption = 'Exchange rate type';
            DataClassification = ToBeClassified;
        }
        field(6; NITKU; Text[3])
        {
            Caption = 'NITKU';
            DataClassification = ToBeClassified;
        }
        field(7; NPWPAddress; Text[255])
        {
            Caption = 'Tax-payer identification address';
            DataClassification = ToBeClassified;

        }
        field(8; NPWPName; Text[60])
        {
            Caption = 'Tax-payer identification name';
            DataClassification = ToBeClassified;
        }
        field(9; NPWPNumber; Text[25])
        {
            Caption = 'Tax-payer identification number';
            DataClassification = ToBeClassified;

        }
        field(10; NumSeqTaxInvoice; Text[10])
        {
            Caption = 'Sequence tax invoice';
            DataClassification = ToBeClassified;
        }
        field(11; PKP; Text[25])
        {
            Caption = 'Taxable entrepreneur number';
            DataClassification = ToBeClassified;

        }
        field(12; SignatureCity; Text[60])
        {
            Caption = 'Signature city';
            DataClassification = ToBeClassified;
        }
        field(13; SignatureId; Text[3])
        {
            Caption = 'Signature';
            DataClassification = ToBeClassified;
        }
        field(14; WHTCorrectionJournalDesc; Text[60])
        {
            Caption = 'Correction journal description';
            DataClassification = ToBeClassified;
        }
        field(15; WHTCorrectionJournalName; Text[10])
        {
            Caption = 'Correction journal name';
            DataClassification = ToBeClassified;
        }
        field(16; KodeBarangJasa; Text[10])
        {
            Caption = 'Kode barang jasa';
            DataClassification = ToBeClassified;
        }
        field(17; KodeUOM; Text[10])
        {
            Caption = 'Kode unit of measure';
            DataClassification = ToBeClassified;
        }
        field(18; Correction; Boolean)
        {
            Caption = 'Correction';
            DataClassification = ToBeClassified;
        }

        field(19; CorrectionAutoPostJour; Boolean)
        {
            Caption = 'Auto post journal correction';
            DataClassification = ToBeClassified;
        }
        field(20; Activation; Boolean)
        {
            Caption = 'Indonesian tax activation';
            DataClassification = ToBeClassified;
        }
        field(21; DecentralizeActivation; Boolean)
        {
            Caption = 'Decentralization activation';
            DataClassification = ToBeClassified;

        }
        field(22; MergingActivation; Boolean)
        {
            Caption = 'Merged tax invoice activation';
            DataClassification = ToBeClassified;

        }
        field(23; WHTCorrection; Boolean)
        {
            Caption = 'Correction';
            DataClassification = ToBeClassified;
        }
        field(24; WHTCorrectAutoPostJour; Boolean)
        {
            Caption = 'Auto post journal correction';
            DataClassification = ToBeClassified;
        }

        field(25; RegistrationDate; Date)
        {
            Caption = 'Registration date';
            DataClassification = ToBeClassified;
        }

        // following field to be adjusted 
        field(26; ProductType; Text[10])
        {
            Caption = 'Product type';
            DataClassification = ToBeClassified;
        }
    }

    /*
    keys
    {
        key(Key1; MyField)
        {
            Clustered = true;
        }
    }
    */

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}