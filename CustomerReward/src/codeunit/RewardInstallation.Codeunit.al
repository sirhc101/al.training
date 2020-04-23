codeunit 50203 "Reward Installation"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        cust: Record Customer;
        rewardMgmt: Codeunit "Reward Mgmt.";
        rewardLevel: Dictionary of [Text, Integer];
    begin
        Clear(rewardLevel);
        rewardLevel.Add('Bronze', 5);
        rewardLevel.Add('Silber', 10);
        rewardLevel.Add('Gold', 15);

        rewardMgmt.CreateRewardLevel(rewardLevel);

        // rewardMgmt.InsertReward('BRONZE', 'Bronze', 5);
        // rewardMgmt.InsertReward('SILBER', 'Silber', 10);
        // rewardMgmt.InsertReward('GOLD', 'Glod', 15);

        cust.Reset();
        cust.SetFilter("Customer Reward ID", '%1', '');
        if (cust.Find('-')) then
            repeat
                cust."Customer Reward ID" := rewardMgmt.GetRewardId(cust);
                cust.Modify(true);
            until cust.Next() = 0;
    end;
}