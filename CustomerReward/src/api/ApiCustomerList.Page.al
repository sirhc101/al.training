page 50202 "API Customer List"
{
    PageType = API;
    Caption = 'apiCustomerList';
    APIPublisher = 'publisher';
    APIGroup = 'group';
    APIVersion = 'beta';
    EntityName = 'customer';
    EntitySetName = 'customers';
    SourceTable = Customer;
    DelayedInsert = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(customers)
            {
                field(no; "No.")
                { }
                field(address; Address)
                { }
                field(address2; "Address 2")
                { }
                field(postCode; "Post Code")
                { }
                field(city; City)
                { }
                field(customerRewardID; "Customer Reward ID")
                { }
                field(salesLCY; "Sales (LCY)")
                { }
                field(balanceLCY; "Balance (LCY)")
                { }
            }
        }
    }
}