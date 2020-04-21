pageextension 50200 "Customer Reward Ext." extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Customer Reward ID"; "Customer Reward ID")
            {
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    CurrPage.Update(true);
                end;
            }

            field("Customer Reward Description"; "Customer Reward Description")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addfirst(processing)
        {
            action(ShowDistanceAndTravelDuration)
            {
                Image = Web;
                Caption = 'Show Distance and Duration';
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    MapsIntegration: Codeunit "Google Maps Api";
                begin
                    MapsIntegration.GetDistanceAndDuration(Rec);
                end;
            }
        }
    }
}