page 50200 "Reward List"
{
    Caption = 'Reward List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Reward;
    CardPageId = "Reward Card";

    layout
    {
        area(Content)
        {
            repeater(RewardList)
            {
                field("Reward ID"; "Reward ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the unique ID of the Reward Level.';
                }

                field(Description; Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the description of the Reward Level.';
                }

                field("Discount Percentage"; "Discount Percentage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the discount in percent to be applied if the Reward Level is assigned to a customer.';
                }
            }
        }
        area(Factboxes)
        { }
    }
}