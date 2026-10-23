tableextension 50154 IVSSalesInvoiceHeaderExtension extends "Sales Invoice Header"
{
    fields
    {
        // Add changes to table fields here
        field(50150; NITKU; Text[6])
        {
            DataClassification = ToBeClassified;
        }
        field(50151; "NPWP Name"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(50152; "NPWP Number"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(50153; "NPWP Address"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(50154; "Tax Transaction Type"; Text[3])
        {
            DataClassification = ToBeClassified;
        }
        field(50155; "Transaction Detail"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50156; "Transaction Document"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50157; "Transaction Type Code"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50158; "Taxable Entrepeneur Number"; Text[25])
        {
            DataClassification = ToBeClassified;
        }
        field(50159; "Registration Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50160; "Calculate Withholding Tax"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50161; "Withholding Tax Group"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50162; "Withholding Tax Recog. Event"; Text[255])
        {
            DataClassification = ToBeClassified;
        }

        field(50163; "Nomor Faktur Pajak"; Code[20])
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

    procedure testloopBySelectedList()
    var
    begin
        if Rec.FindSet() then
            repeat
                message(Rec."No.");
            until Rec.Next() = 0;
    end;

    procedure GenerateCoretaxXML(): Text
    var
        TempBlob: Codeunit "Temp Blob";
        XmlDoc: XmlDocument;
        XmlDecl: XmlDeclaration;
        InvBulkElem: XmlElement;
        InvBulkAttr: XmlAttribute;
        InvListElem: XmlElement;
        TaxInvElem: XmlElement;
        TinElem: XmlElement;
        ChildElem: XmlElement;
        GoodServiceListElem: XmlElement;
        GoodServiceElem: XmlElement;
        InvoiceHeaderElem: XmlElement;
        InvoiceLineElem: XmlElement;
        OutStr: OutStream;
        InStr: InStream;
        FileName: Text[100];
        // TaxCompanySetup: Record IVSTaxCompanySetup;
        trxCodeText: Text;
        sellerIdTkuText: Text;
        buyerIdTkuText: Text;
        CompanyInfo: Record "Company Information";
        Customer: Record Customer;
        SalesInvLine: Record "Sales Invoice Line";
        Item: Record Item;
        GLSetup: Record "General Ledger Setup";
        VATPostSetup: Record "VAT Posting Setup";
        VATLedgerEntry: Record "VAT Entry";
        TypeHelper: Codeunit "Type Helper";
    begin
        FileName := 'ExportedData.xml';

        // 1. Build the XML Document
        XmlDoc := XmlDocument.Create();
        XmlDecl := XmlDeclaration.Create('1.0', 'utf-8', 'yes');
        XmlDoc.SetDeclaration(XmlDecl);

        InvBulkElem := XmlElement.Create('TaxInvoiceBulk');
        InvBulkAttr := XmlAttribute.CreateNamespaceDeclaration('xsi', 'http://www.w3.org/2001/XMLSchema-instance');
        InvBulkElem.Add(InvBulkAttr);
        // InvBulkElem.setAttribute('xmlns:xsi', 'http://www.w3.org/2001/XMLSchema-instance');

        // TaxCompanySetup.FindFirst();
        TinElem := XmlElement.Create('TIN');//xmlElementTaxInvoiceBulk.appendChild(xmlDoc.createElement('TIN')).text(strKeep(taxCompanySetup.NPWPNumber,'0123456789'));
        TinElem.Add(XmlText.Create(CompanyInfo."Taxpayer Number"));

        InvBulkElem.Add(TinElem);

        InvListElem := XmlElement.Create('ListOfTaxInvoice');

        if (Rec.FindSet()) then begin
            repeat
                TaxInvElem := XmlElement.Create('TaxInvoice');
                InvoiceHeaderElem := XmlElement.Create('TaxInvoiceDate');
                InvoiceHeaderElem.Add(XmlText.Create(Format(Rec."Posting Date", 0, '<Year4>-<Month,2>-<Day,2>')));
                TaxInvElem.Add(InvoiceHeaderElem);
                InvoiceHeaderElem := XmlElement.Create('TaxInvoiceOpt');
                InvoiceHeaderElem.Add(XmlText.Create('Normal'));
                TaxInvElem.Add(InvoiceHeaderElem);
                trxCodeText := RepeatText('0', 2 - strLen(Rec."Transaction Detail")) + Rec."Transaction Detail";
                InvoiceHeaderElem := XmlElement.Create('TrxCode');
                InvoiceHeaderElem.Add(XmlText.Create(trxCodeText));
                TaxInvElem.Add(InvoiceHeaderElem);
                InvoiceHeaderElem := XmlElement.Create('AddInfo');
                InvoiceHeaderElem.Add(XmlText.Create(''));
                TaxInvElem.Add(InvoiceHeaderElem);
                InvoiceHeaderElem := XmlElement.Create('CustomDoc');
                InvoiceHeaderElem.Add(XmlText.Create(''));
                TaxInvElem.Add(InvoiceHeaderElem);
                InvoiceHeaderElem := XmlElement.Create('CustomDocMonthYear');
                InvoiceHeaderElem.Add(XmlText.Create(''));
                TaxInvElem.Add(InvoiceHeaderElem);
                InvoiceHeaderElem := XmlElement.Create('RefDesc');
                InvoiceHeaderElem.Add(XmlText.Create(Rec."No."));
                TaxInvElem.Add(InvoiceHeaderElem);
                InvoiceHeaderElem := XmlElement.Create('FacilityStamp');
                InvoiceHeaderElem.Add(XmlText.Create(''));
                TaxInvElem.Add(InvoiceHeaderElem);

                // if (TaxCompanySetup.NITKU <> '') then
                //     sellerIdTkuText := TaxCompanySetup.NPWPNumber + TaxCompanySetup.NITKU
                // else
                //     sellerIdTkuText := TaxCompanySetup.NPWPNumber + '000000';

                CompanyInfo.Get();
                if (CompanyInfo.NITKU <> '') then
                    sellerIdTkuText := CompanyInfo."Taxpayer Number" + CompanyInfo.NITKU
                else
                    sellerIdTkuText := CompanyInfo."Taxpayer Number" + '000000';

                InvoiceHeaderElem := XmlElement.Create('SellerIDTKU');
                InvoiceHeaderElem.Add(XmlText.Create(sellerIdTkuText));
                TaxInvElem.Add(InvoiceHeaderElem);
                InvoiceHeaderElem := XmlElement.Create('BuyerCountry');
                InvoiceHeaderElem.Add(XmlText.Create(Rec."Bill-to Country/Region Code"));
                TaxInvElem.Add(InvoiceHeaderElem);
                Customer.Get(Rec."Sell-to Customer No.");
                if (Rec."Bill-to Country/Region Code" = CompanyInfo.GetCompanyCountryRegionCode()) then begin
                    if (Customer.NITKU <> '') then
                        buyerIdTkuText := Rec."NPWP Number" + Rec.NITKU
                    else
                        buyerIdTkuText := Rec."NPWP Number" + '000000';
                    InvoiceHeaderElem := XmlElement.Create('BuyerIDTKU');
                    InvoiceHeaderElem.Add(XmlText.Create(buyerIdTkuText));
                    TaxInvElem.Add(InvoiceHeaderElem);
                    InvoiceHeaderElem := XmlElement.Create('BuyerTin');
                    InvoiceHeaderElem.Add(XmlText.Create(Rec."NPWP Number"));
                    TaxInvElem.Add(InvoiceHeaderElem);
                    InvoiceHeaderElem := XmlElement.Create('BuyerDocument');
                    InvoiceHeaderElem.Add(XmlText.Create('TIN'));
                    TaxInvElem.Add(InvoiceHeaderElem);
                    InvoiceHeaderElem := XmlElement.Create('BuyerDocumentNumber');
                    InvoiceHeaderElem.Add(XmlText.Create('-'));
                    TaxInvElem.Add(InvoiceHeaderElem);
                end else begin
                    InvoiceHeaderElem := XmlElement.Create('BuyerIDTKU');
                    InvoiceHeaderElem.Add(XmlText.Create('000000'));
                    TaxInvElem.Add(InvoiceHeaderElem);
                    InvoiceHeaderElem := XmlElement.Create('BuyerTin');
                    InvoiceHeaderElem.Add(XmlText.Create('0000000000000000'));
                    TaxInvElem.Add(InvoiceHeaderElem);
                    InvoiceHeaderElem := XmlElement.Create('BuyerDocument');
                    InvoiceHeaderElem.Add(XmlText.Create('Other ID'));
                    TaxInvElem.Add(InvoiceHeaderElem);
                    InvoiceHeaderElem := XmlElement.Create('BuyerDocumentNumber');
                    InvoiceHeaderElem.Add(XmlText.Create(Rec."NPWP Number"));
                    TaxInvElem.Add(InvoiceHeaderElem);
                end;

                InvoiceHeaderElem := XmlElement.Create('BuyerName');
                InvoiceHeaderElem.Add(XmlText.Create(Rec."NPWP Name"));
                TaxInvElem.Add(InvoiceHeaderElem);
                InvoiceHeaderElem := XmlElement.Create('BuyerAdress');
                InvoiceHeaderElem.Add(XmlText.Create(Rec."NPWP Address"));
                TaxInvElem.Add(InvoiceHeaderElem);
                InvoiceHeaderElem := XmlElement.Create('BuyerEmail');
                InvoiceHeaderElem.Add(XmlText.Create(Rec."Sell-to E-Mail"));
                TaxInvElem.Add(InvoiceHeaderElem);

                GoodServiceListElem := XmlElement.Create('ListOfGoodService');
                SalesInvLine.SetRange("Document No.", Rec."No.");
                SalesInvLine.SetFilter(Type, '<>%1', "Sales Line Type"::"Charge (Item)");

                if SalesInvLine.FindSet() then begin
                    repeat
                        GoodServiceElem := XmlElement.Create('GoodService');
                        /*
                        Item.Get(SalesInvLine."No.");

                        if Item.Type = "Item Type"::Inventory Then begin
                            InvoiceLineElem := XmlElement.Create('Opt');
                            InvoiceLineElem.Add(XmlText.Create('A'));
                            GoodServiceElem.Add(InvoiceLineElem);
                        end else begin
                            InvoiceLineElem := XmlElement.Create('Opt');
                            InvoiceLineElem.Add(XmlText.Create('B'));
                            GoodServiceElem.Add(InvoiceLineElem);
                        end;
                        */
                        InvoiceLineElem := XmlElement.Create('Opt');
                        InvoiceLineElem.Add(XmlText.Create(SalesInvLine."IDT Opt"));
                        GoodServiceElem.Add(InvoiceLineElem);
                        InvoiceLineElem := XmlElement.Create('Code');
                        InvoiceLineElem.Add(XmlText.Create(SalesInvLine."IDT Code"));// getTaxBarangJasaCode()));
                        GoodServiceElem.Add(InvoiceLineElem);
                        InvoiceLineElem := XmlElement.Create('Name');
                        InvoiceLineElem.Add(XmlText.Create(SalesInvLine.Description));
                        GoodServiceElem.Add(InvoiceLineElem);
                        InvoiceLineElem := XmlElement.Create('Unit');
                        InvoiceLineElem.Add(XmlText.Create(SalesInvLine."IDT Unit"));// getTaxUOM()));
                        GoodServiceElem.Add(InvoiceLineElem);
                        InvoiceLineElem := XmlElement.Create('Price');
                        InvoiceLineElem.Add(XmlText.Create(getHelperXMLDecimalFormat(
                            (SalesInvLine.GetLCYAmount(SalesInvLine.Amount, WorkDate()) / SalesInvLine.Quantity))));
                        GoodServiceElem.Add(InvoiceLineElem);
                        InvoiceLineElem := XmlElement.Create('Qty');
                        InvoiceLineElem.Add(XmlText.Create(getHelperXMLDecimalFormat(SalesInvLine.Quantity)));
                        GoodServiceElem.Add(InvoiceLineElem);
                        InvoiceLineElem := XmlElement.Create('TotalDiscount');
                        InvoiceLineElem.Add(XmlText.Create(getHelperXMLDecimalFormat(
                            SalesInvLine.GetLCYAmount(SalesInvLine."Line Discount Amount", WorkDate()))));
                        GoodServiceElem.Add(InvoiceLineElem);
                        InvoiceLineElem := XmlElement.Create('TaxBase');
                        InvoiceLineElem.Add(XmlText.Create(getHelperXMLDecimalFormat(
                            SalesInvLine.GetLCYAmount(SalesInvLine.Amount + SalesInvLine.GetItemChargeAmount(), WorkDate()))));
                        GoodServiceElem.Add(InvoiceLineElem);

                        VATPostSetup.SetFilter("VAT Bus. Posting Group", '=%1', SalesInvLine."VAT Bus. Posting Group");
                        VATPostSetup.SetFilter("VAT Prod. Posting Group", '=%1', SalesInvLine."VAT Prod. Posting Group");
                        if VATPostSetup.FindFirst() then begin
                            InvoiceLineElem := XmlElement.Create('OtherTaxBase');
                            InvoiceLineElem.Add(XmlText.Create(getHelperXMLDecimalFormat(
                                SalesInvLine.GetLCYAmount(SalesInvLine.GetOtherTaxBase(VATPostSetup."Tax Ratio PPn Lain"), WorkDate()))));
                            GoodServiceElem.Add(InvoiceLineElem);
                            InvoiceLineElem := XmlElement.Create('VATRate');
                            InvoiceLineElem.Add(XmlText.Create(getHelperXMLDecimalFormat(VATPostSetup."Tax Rate PPn Lain")));
                            GoodServiceElem.Add(InvoiceLineElem);
                        end else begin
                            InvoiceLineElem := XmlElement.Create('OtherTaxBase');
                            InvoiceLineElem.Add(XmlText.Create('0.00'));
                            GoodServiceElem.Add(InvoiceLineElem);
                            InvoiceLineElem := XmlElement.Create('VATRate');
                            InvoiceLineElem.Add(XmlText.Create('0.00'));
                            GoodServiceElem.Add(InvoiceLineElem);
                        end;
                        InvoiceLineElem := XmlElement.Create('VAT');
                        InvoiceLineElem.Add(XmlText.Create(getHelperXMLDecimalFormat(SalesInvLine.GetLCYAmount(
                                                        SalesInvLine.GetTax(), WorkDate()))));
                        GoodServiceElem.Add(InvoiceLineElem);
                        InvoiceLineElem := XmlElement.Create('STLGRate');
                        InvoiceLineElem.Add(XmlText.Create('0.00'));
                        GoodServiceElem.Add(InvoiceLineElem);
                        InvoiceLineElem := XmlElement.Create('STLG');
                        InvoiceLineElem.Add(XmlText.Create('0.00'));
                        GoodServiceElem.Add(InvoiceLineElem);
                        // define element value from sales invoice line
                        GoodServiceListElem.Add(GoodServiceElem);
                    until SalesInvLine.Next() = 0;
                end;
                TaxInvElem.Add(GoodServiceListElem);
                InvListElem.Add(TaxInvElem);
            until Rec.Next() = 0;
        end;

        InvBulkElem.Add(InvListElem);
        XmlDoc.Add(InvBulkElem);

        // 2. Write XML to OutStream via Temp Blob
        TempBlob.CreateOutStream(OutStr);
        XmlDoc.WriteTo(OutStr);

        // 3. Read InStream and trigger client download
        TempBlob.CreateInStream(InStr);
        DownloadFromStream(InStr, 'Export XML', '', 'XML files|*.xml', FileName);
    end;

    procedure RepeatText(InputText: Text; RepeatCount: Integer): Text
    var
        TextBuilder: TextBuilder;
        i: Integer;
    begin
        for i := 1 to RepeatCount do
            TextBuilder.Append(InputText);

        exit(TextBuilder.ToText());
    end;

    procedure getHelperXMLDecimalFormat(amount: Decimal): Text
    var
        TypeHelper: Codeunit "Type Helper";
    begin
        exit(Format(amount, 0, TypeHelper.GetXMLAmountFormatWithTwoDecimalPlaces()));
    end;
}