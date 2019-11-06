pageextension 50001 "Sales Order Inv. Signal" extends "Sales Order Subform"
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
        if ((Type = Type::Item) and ("No." <> '')) then begin
            inventorySignalMgmt.CalcInventorySignal(Rec, tempBlob);
            tempBlob.CreateInStream(streamIn);
            "Inventory Signal".CreateOutStream(streamOut);
            CopyStream(streamOut, streamIn);
        end;

    end;
}