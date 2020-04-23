report 50201 "Update Reward Level Cust."
{
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Update Reward Level - Customer';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            trigger OnAfterGetRecord()
            var
                rewardMgmt: Codeunit "Reward Mgmt.";
            begin
                "Customer Reward ID" := rewardMgmt.GetRewardId(Customer);
                Modify(true);
            end;
        }
    }
}