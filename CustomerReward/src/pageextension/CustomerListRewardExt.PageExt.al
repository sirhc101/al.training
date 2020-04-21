pageextension 50201 "Customer List Reward Ext." extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field("Customer Reward ID"; "Customer Reward ID")
            {
                ApplicationArea = All;
            }

            field("Customer Reward Description"; "Customer Reward Description")
            {
                ApplicationArea = All;
            }
        }
    }
}