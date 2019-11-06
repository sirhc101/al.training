codeunit 50000 "Salesperson My Customer"
{
    Access = Public;

    /// <summary>
    /// This method will add the Customer to the My Customer table for corresponding Salesperson.
    /// </summary>
    /// <param name="salespersonCode">
    /// Code variable containing the Salesperson Code identifier.
    /// </param>
    /// <param name="cust">
    /// Record variable containing the customer to remove from the My Customer table.
    /// </param>
    procedure AddMyCustomerToSalesperson(salespersonCode: Code[20]; cust: Record Customer)
    begin
        UpdateMyCustomerList(salespersonCode, cust, 0);
    end;

    /// <summary>
    /// This method will remove the Customer from the My Customer table for corresponding Salesperson.
    /// </summary>
    /// <param name="salespersonCode">
    /// Code variable containing the Salesperson Code identifier.
    /// </param>
    /// <param name="cust">
    /// Record variable containing the customer to remove from the My Customer table.
    /// </param>
    procedure RemoveMyCustomerToSalesperson(salespersonCode: Code[20]; cust: Record Customer)
    begin
        UpdateMyCustomerList(salespersonCode, cust, 1);
    end;

    /// <summary>
    /// This subscriber is handling the change of Salesperson Code field in Customer table.
    /// </summary>
    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterValidateEvent', 'Salesperson Code', false, false)]
    local procedure OnAfterUpdateSalesPersonCodeUpdateMyCustomer(var Rec: Record Customer; var xRec: Record Customer)
    begin
        if (Rec."Salesperson Code" = xRec."Salesperson Code") then
            exit;

        AddMyCustomerToSalesperson(Rec."Salesperson Code", Rec);
        RemoveMyCustomerToSalesperson(xRec."Salesperson Code", Rec);
    end;

    /// <summary>
    /// This method is adding or removing a Customer from the My Customer table.
    /// </summary>
    local procedure UpdateMyCustomerList(salespersonCode: Code[20]; cust: Record Customer; action: Enum UpdateMyCustomerListAction)
    var
        userSetup: Record "User Setup";
        myCustomer: Record "My Customer";
    begin
        userSetup.SetRange("Salespers./Purch. Code", salespersonCode);
        if (userSetup.FindSet(false)) then
            repeat
                case action of
                    action::Add:
                        if (not myCustomer.Get(userSetup."User ID", cust."No.")) then begin
                            myCustomer.Init();
                            myCustomer.Validate("User ID", userSetup."User ID");
                            myCustomer.Validate("Customer No.", cust."No.");
                            myCustomer.Insert(true);
                        end;
                    action::Remove:
                        if (myCustomer.Get(userSetup."User ID", cust."No.")) then
                            myCustomer.Delete(true);
                end;
            until userSetup.Next() = 0;
    end;
}