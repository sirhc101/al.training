pageextension 50202 "BM RoleCenter Ext." extends "Business Manager Role Center"
{
    actions
    {
        addbefore("Cash Management")
        {
            group(AwesomeActions)
            {
                Caption = 'My Awesome Actions';
                action(AwesomeAction)
                {
                    Caption = 'Awesome Action';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    RunObject = page "Customer List";
                }
                action(AnotherAwesomeAction)
                {
                    Caption = 'Another Awesome Action';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    RunObject = page "Vendor List";
                }
                action(MostAwesomeAction)
                {
                    Caption = 'Most Awesome Action';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    RunObject = page "Item List";
                }
            }
        }
        addlast(processing)
        {
            group(NotThatAwesomeActions)
            {
                Caption = 'My Not That Awesome Actions';
                action(NotThatAwesomeAction)
                {
                    Caption = 'Not That Awesome Action';
                    ApplicationArea = All;
                    RunObject = page "G/L Account List";
                }
                action(AnotherNotThatAwesomeAction)
                {
                    Caption = 'Another Not That Awesome Action';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    RunObject = page "Bank Account List";
                }
            }
        }
    }
}