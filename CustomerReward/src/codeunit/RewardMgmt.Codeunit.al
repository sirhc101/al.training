codeunit 50200 "Reward Mgmt."
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        cust: Record Customer;
        rewardLevel: Dictionary of [Text, Integer];
    begin
        Clear(rewardLevel);
        rewardLevel.Add('Bronze', 5);
        rewardLevel.Add('Silber', 10);
        rewardLevel.Add('Gold', 15);

        CreateRewardLevel(rewardLevel);

        // InsertReward('BRONZE', 'Bronze', 5);
        // InsertReward('SILBER', 'Silber', 10);
        // InsertReward('GOLD', 'Glod', 15);

        cust.Reset();
        cust.SetFilter("Customer Reward ID", '%1', '');
        if (cust.Find('-')) then
            repeat
                cust.CalcFields("Sales (LCY)");
                case true of
                    ((cust."Sales (LCY)" >= 1000) and (cust."Sales (LCY)" <= 5000)):
                        cust.Validate("Customer Reward ID", 'SILBER');
                    (cust."Sales (LCY)" > 5000):
                        cust.Validate("Customer Reward ID", 'GOLD');
                    else
                        cust.Validate("Customer Reward ID", 'BRONZE');
                end;
                cust.Modify(true);
            until cust.Next() = 0;
    end;

    local procedure CreateRewardLevel(rewardLevel: Dictionary of [Text, Integer])
    var
        rewardKey: Text;
        rewardDisc: Integer;
    begin
        foreach rewardKey in rewardLevel.Keys() do
            if (rewardLevel.Get(rewardKey, rewardDisc)) then
                InsertReward(rewardKey.ToUpper(), rewardKey, rewardDisc);
    end;

    local procedure InsertReward(id: Text; description: Text; discPerc: Decimal)
    var
        idAsCode: Code[20];
    begin
        idAsCode := CopyStr(id.ToUpper(), 1, 20); // transfom to Code[20]
        InsertReward(idAsCode, CopyStr(description, 1, 50), discPerc);
    end;

    local procedure InsertReward(id: Code[20]; description: Text[50]; discPerc: Decimal)
    var
        reward: Record Reward;
    begin
        // if already exist, just skip
        if (reward.Get(id)) then
            exit;

        reward.Reset();
        reward.Init();
        reward.Validate("Reward ID", id);
        reward.Validate(Description, description);
        reward.Validate("Discount Percentage", discPerc);
        reward.Insert(true);
    end;
}