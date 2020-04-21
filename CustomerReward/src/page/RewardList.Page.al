page 50200 "Reward List"
{
    Caption = 'Reward List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Reward;

    layout
    {
        area(Content)
        {
            repeater(RewardList)
            {
                field("Reward ID"; "Reward ID")
                {
                    ApplicationArea = All;
                }

                field(Description; Description)
                {
                    ApplicationArea = All;
                }

                field("Discount Percentage"; "Discount Percentage")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        { }
    }
}