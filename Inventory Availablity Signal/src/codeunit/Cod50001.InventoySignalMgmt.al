codeunit 50001 "Inventory Signal Mgmt."
{
    Access = Public;

    /// <summary>
    /// This method is calculating the inventory signal for given Sales Line.
    /// </summary>
    procedure CalcInventorySignal(salesLine: Record "Sales Line"; var tempBlob: Codeunit "Temp Blob")
    var
        item: Record Item;
    begin
        if ((salesLine.Type <> salesLine.Type::Item) or (salesLine."No." = '')) then
            exit;

        item.Get(salesLine."No.");
        item.CalcFields(Inventory);

        CalcInventorySignal((item.Inventory - salesLine."Quantity (Base)"), tempBlob);
    end;

    /// <summary>
    /// This method is calculating the inventory signal.
    /// </summary>
    local procedure CalcInventorySignal(value: Decimal; var tempBlob: Codeunit "Temp Blob")
    var
        signal: Record "Inventory Signal";
        stream: OutStream;
    begin
        signal.Reset();
        if (signal.IsEmpty()) then
            exit;

        signal.SetCurrentKey("Minimum Value");
        signal.SetFilter(Signal, '<>%1', signal.Signal::Gray); // is only used if nothing else works.
        signal.SetFilter("Minimum Value", '<=%1', value);
        if (not signal.FindLast()) then
            signal.Get(signal.Signal::Red);

        tempBlob.CreateOutStream(stream);
        signal.Image.ExportStream(stream);

        if (not tempBlob.HasValue()) then
            Error(SetupInventorySignalsBeforeUsingFunctionErr);
    end;

    var
        SetupInventorySignalsBeforeUsingFunctionErr: Label 'Please setup Inventory Signals before using this function.';
}