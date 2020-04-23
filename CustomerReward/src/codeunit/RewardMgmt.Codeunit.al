codeunit 50200 "Reward Mgmt."
{
    Access = Internal;

    procedure CreateRewardLevel(rewardLevel: Dictionary of [Text, Integer])
    var
        rewardKey: Text;
        rewardDisc: Integer;
    begin
        foreach rewardKey in rewardLevel.Keys() do
            if (rewardLevel.Get(rewardKey, rewardDisc)) then
                InsertReward(rewardKey.ToUpper(), rewardKey, rewardDisc);
    end;

    procedure InsertReward(id: Text; description: Text; discPerc: Decimal)
    var
        idAsCode: Code[20];
    begin
        idAsCode := CopyStr(id.ToUpper(), 1, 20); // transfom to Code[20]
        InsertReward(idAsCode, CopyStr(description, 1, 50), discPerc);
    end;

    procedure InsertReward(id: Code[20]; description: Text[50]; discPerc: Decimal)
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

    procedure GetRewardId(cust: Record Customer): Code[20]
    begin
        cust.CalcFields("Sales (LCY)");
        case true of
            ((cust."Sales (LCY)" >= 10000) and (cust."Sales (LCY)" <= 50000)):
                exit('SILBER');
            (cust."Sales (LCY)" > 50000):
                exit('GOLD');
            else
                exit('BRONZE');
        end;
    end;
}