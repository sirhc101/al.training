codeunit 50202 "Event Handler"
{
    [EventSubscriber(ObjectType::Table, Database::Reward, 'OnAfterValidateEvent', 'Discount Percentage', false, false)]
    local procedure OnAfterValidateEventDiscountPercentageCheckIsNotZero(var Rec: Record Reward; var xRec: Record Reward)
    begin
        with Rec do begin
            if ("Discount Percentage" = xRec."Discount Percentage") then
                exit;

            if ("Discount Percentage" <= 0) then
                Error(ValueMustBeLargerZeroErr, FieldCaption("Discount Percentage"), Description);
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Price Calc. Mgt.", 'OnAfterFindSalesLineLineDisc', '', false, false)]
    local procedure OnAfterFindSalesLineDiscApplyCustomerRewardDiscount(var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line")
    var
        customer: Record Customer;
        reward: Record Reward;
    begin
        if (SalesHeader."Document Type" <> SalesHeader."Document Type"::Order) then
            exit;

        if ((not customer.Get(SalesHeader."Sell-to Customer No.")) or (customer."Customer Reward ID" = '')) then
            exit;

        reward.Get(customer."Customer Reward ID");

        SalesLine."Line Discount %" += reward."Discount Percentage";
    end;


    var
        ValueMustBeLargerZeroErr: Label 'Value cannot be zero in field %1 for reward level %2.';
}