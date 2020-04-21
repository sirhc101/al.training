page 50201 "Reward Card"
{
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
                }

                field(Description; Description)
                {
                    ApplicationArea = All;
                }
            }
            group(Options)
            {
                Caption = 'Options';

                field("Discount Percentage"; "Discount Percentage")
                {
                    ApplicationArea = All;
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

                RunObject = page "Customer Card";
                RunPageLink = "Customer Reward ID" = field("Reward ID");
                RunPageMode = View;
            }
        }
    }
}