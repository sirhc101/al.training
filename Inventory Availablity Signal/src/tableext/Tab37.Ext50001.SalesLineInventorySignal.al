tableextension 50001 "Sales Line Inv. Signal" extends "Sales Line"
{
    fields
    {
        field(50001; "Inventory Signal"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Inventory Signal';
            Subtype = Bitmap;
        }
    }
}