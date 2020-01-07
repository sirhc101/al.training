tableextension 50200 "Customer Reward" extends "Sales Line"
{
    fields
    {
        field(50200; "Customer Reward ID"; Code[20])
        {
            Caption = 'Customer Reward ID';
            DataClassification = CustomerContent;
            TableRelation = Reward."Reward ID";
        }

        field(50201; "Customer Reward Description"; Text[50])
        {
            Caption = 'Customer Reward Description';
            FieldClass = FlowField;
            CalcFormula = lookup (Reward.Description where("Reward ID" = field("Customer Reward ID")));
            Editable = false;
        }
    }
}