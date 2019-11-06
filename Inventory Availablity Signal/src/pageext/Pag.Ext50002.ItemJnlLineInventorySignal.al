pageextension 50002 "Item Jnl. Line Inv. Signal" extends "Item Journal"
{
    layout
    {
        addafter(Quantity)
        {
            field("Inventory Signal"; "Inventory Signal")
            {
                ApplicationArea = All;
            }
        }
    }


    trigger OnAfterGetRecord()
    var
        inventorySignalMgmt: Codeunit "Inventory Signal Mgmt.";
        tempBlob: Codeunit "Temp Blob";
        streamIn: InStream;
        streamOut: OutStream;
    begin
        if ("Item No." <> '') then begin
            inventorySignalMgmt.CalcInventorySignal(Rec, tempBlob);
            tempBlob.CreateInStream(streamIn);
            "Inventory Signal".CreateOutStream(streamOut);
            CopyStream(streamOut, streamIn);
        end;

    end;
}