enum 50153 IVSTaxType
{
    Extensible = true;
    Caption = 'Tax Type';

    value(0; None)
    {
        Caption = 'None';
    }

    value(1; PPN)
    {
        Caption = 'PPn';
    }
    value(2; PPH)
    {
        Caption = 'PPh';
    }
    value(3; PPNBM)
    {
        Caption = 'PPnBM';
    }
}