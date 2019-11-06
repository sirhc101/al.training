tableextension 50002 "Item Jnl. Line Inv. Signal" extends "Item Journal Line"
{
    fields
    {
        // NOTICE - Media field could not be used, because it will not be shown in Repeater controls. Media and image fields only display in tile view.
        field(50001; "Inventory Signal"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Inventory Signal';
            Subtype = Bitmap;
        }
    }
}