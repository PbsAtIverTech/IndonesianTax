tableextension 50155 IVSSalesInvoiceLineExtension extends "Sales Invoice Line"
{
    fields
    {
        field(50150; "IDT Opt"; Text[2])
        {
            DataClassification = ToBeClassified;
        }
        field(50151; "IDT Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50152; "IDT Unit"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50153; "Other Tax Base"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50154; "VAT Setup Rate "; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50155; "STLG"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50156; "STLG Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

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

    trigger OnInsert()
    begin
        Message('insert into SalesInvoiceLine');
    end;

    procedure GetTaxBarangJasaCode(): Text
    var
        Item: Record Item;
        Barangjasa: Record IVSTaxKodeBarangJasa;
        CompanyInfo: Record "Company Information";
    begin

        if Item.Get(Rec."No.") then begin
            BarangJasa.SetRange("Kode Barang/jasa", Item."Kode Barang/Jasa");

            if Barangjasa.Find('-') then
                exit(Barangjasa."Kode Barang/jasa");

        end else begin
            CompanyInfo.get();
            if Item.Type = "Item Type"::Inventory then
                exit(CompanyInfo."Default Kode Item")
            else
                exit(CompanyInfo."Default Kode Service");
        end;
    end;

    procedure GetTaxUOM(): Text
    var
        Item: Record Item;
        UOM: Record "Unit of Measure";
        TaxUOM: Record IVSTaxUnitOfMeasure;
        CompanyInfo: Record "Company Information";
    begin
        Item.get(Rec."No.");
        if Rec."Unit of Measure Code" <> '' then
            if UOM.get(Rec."Unit of Measure Code") then
                exit(UOM.IVSTaxUOMCode);

        CompanyInfo.get();
        if Item.Type = "Item Type"::Inventory then
            exit(CompanyInfo."Default Kode UOM Item");

        if Item.Type = "Item Type"::Service then
            exit(CompanyInfo."Default Kode UOM Service");
    end;

    procedure GetLCYAmount(Amount: Decimal; PostingDate: Date): Decimal
    var
        CurrExchRate: Record "Currency Exchange Rate";
        ConvertedAmount: Decimal;

    begin
        if Amount = 0 then
            exit(0);

        if PostingDate = 0D then
            PostingDate := WorkDate();

        // Direct conversion from Foreign Currency to Local Currency (LCY)
        ConvertedAmount := CurrExchRate.ExchangeAmtFCYToLCY(PostingDate, Rec.GetCurrencyCode(), Amount,
                            CurrExchRate.ExchangeRate(PostingDate, Rec.GetCurrencyCode()));

        exit(ConvertedAmount);
    end;

    procedure GetItemCharge(): Query IVSTaxSalesItemChargeQuery
    var
        ChargeAmount: Decimal;
        ItemChargeAssgntSales: Query IVSTaxSalesItemChargeQuery;
    begin
        ChargeAmount := 0;

        ItemChargeAssgntSales.SetRange("Document_No_", Rec."Document No."); // Replace with your Sales Invoice/Order No.
        ItemChargeAssgntSales.SetRange("Line_No_", Rec."Line No.");   // Line No. of the Charge (Item) line


        // while ItemChargeAssgntSales.Read() do begin
        //     ChargeAmount += GetLCYAmount(ItemChargeAssgntSales.Amount, WorkDate);
        // end;

        exit(ItemChargeAssgntSales);

    end;

    procedure GetOtherTaxBase(Ratio: Decimal): Decimal
    var
        OtherTaxAmount: Decimal;
        itemChargeQuery: Query IVSTaxSalesItemChargeQuery;
        Customer: Record Customer;
    begin
        Customer.get(GetInvoiceHeader()."Sell-to Customer No.");
        OtherTaxAmount := 0;
        itemChargeQuery := GetItemCharge();
        itemChargeQuery.Open();
        if (GetInvoiceHeader()."Transaction Detail" = '1')
                or (Customer."Transaction Detail" = '1') then begin
            while itemChargeQuery.Read() do begin
                OtherTaxAmount := Rec.Amount + itemChargeQuery.Amount;
            end;
        end else begin
            while itemChargeQuery.Read() do begin
                OtherTaxAmount := (Rec.Amount + itemChargeQuery.Amount) * Ratio;
            end;
        end;

        exit(OtherTaxAmount);
    end;

    procedure GetTax(): Decimal
    var
        VATAmount: Decimal;
    begin
        VATAmount := (Rec."Amount Including VAT" - Rec.Amount) + GetItemChargeTax();
        exit(VATAmount);
    end;

    procedure GetItemChargeAmount(): Decimal
    var
        ChargeAmount: Decimal;
        itemChargeQuery: Query IVSTaxSalesItemChargeQuery;
    begin
        itemChargeQuery := GetItemCharge();
        itemChargeQuery.Open();
        while itemChargeQuery.Read() do begin
            ChargeAmount := itemChargeQuery.Amount;
        end;
        exit(ChargeAmount);
    end;

    procedure GetItemChargeTax(): Decimal
    var
        VATAmount: Decimal;
        itemChargeQuery: Query IVSTaxSalesItemChargeQuery;
    begin
        itemChargeQuery := GetItemCharge();
        itemChargeQuery.Open();
        while itemChargeQuery.Read() do begin
            VATAmount := itemChargeQuery.Amount_Including_VAT - itemChargeQuery.Amount;
        end;
        exit(VATAmount);
    end;
}