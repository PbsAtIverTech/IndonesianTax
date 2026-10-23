query 50150 IVSTaxSalesItemChargeQuery
{
    QueryType = Normal;

    elements
    {
        dataitem(SalesInvLineCharge; "Sales Invoice Line")
        {
            column(Amount; Amount)
            {
                Method = Sum;
            }

            column(Amount_Including_VAT; "Amount Including VAT")
            {
                Method = Sum;
            }
            dataitem(Value_Entry_Charge; "Value Entry")
            {
                DataItemLink = "Document No." = SalesInvLineCharge."Document No.",
                                "Document Line No." = SalesInvLineCharge."Line No.";
                DataItemTableFilter = "Item Charge No." = filter(<> ''),
                                        Adjustment = const(false);
                dataitem(Value_Entry; "Value Entry")
                {
                    DataItemLink = "Item Ledger Entry No." = Value_Entry_Charge."Item Ledger Entry No.";
                    SqlJoinType = InnerJoin;
                    DataItemTableFilter = Adjustment = const(false);
                    dataitem(SalesInvLine; "Sales Invoice Line")
                    {
                        DataItemLink = "Document No." = Value_Entry."Document No.",
                                        "Line No." = Value_Entry."Document Line No.";
                        SqlJoinType = InnerJoin;
                        filter(Document_No_; "Document No.")
                        {

                        }
                        filter(Line_No_; "Line No.")
                        {

                        }
                        dataitem(VATPostingSetup; "VAT Posting Setup")
                        {
                            DataItemLink = "VAT Bus. Posting Group" = SalesInvLine."VAT Bus. Posting Group",
                                            "VAT Prod. Posting Group" = SalesInvLine."VAT Prod. Posting Group";

                            SqlJoinType = InnerJoin;
                            DataItemTableFilter = "Tax Type" = CONST(PPN);
                        }
                    }
                }
            }

        }
    }
    trigger OnBeforeOpen()
    begin

    end;

    var
        itemcharges: Record "Item Charge";
}