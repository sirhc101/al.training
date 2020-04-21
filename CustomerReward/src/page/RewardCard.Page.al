page 50201 "Reward Card"
{
    Caption = 'Reward Card';
    PageType = Card;
    UsageCategory = None;
    SourceTable = Reward;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Reward ID"; "Reward ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Sets the unique ID of the Reward Level.';
                }

                field(Description; Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Sets the description of the Reward Level.';
                }
            }
            group(Options)
            {
                Caption = 'Options';

                field("Discount Percentage"; "Discount Percentage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Sets the discount in percent to be applied if the Reward Level is assigned to a customer.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ShowCustomers)
            {
                ApplicationArea = All;
                Caption = 'Show Customers';
                Image = Customer;

                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                RunObject = page "Customer List";
                RunPageLink = "Customer Reward ID" = field("Reward ID");
                RunPageMode = View;
            }
        }
    }
}