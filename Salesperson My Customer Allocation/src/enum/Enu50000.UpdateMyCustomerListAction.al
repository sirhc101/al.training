/// <summary>
/// This enumeration is used to define specific actions in the UpdateMyCustomerList method. 
/// </summary>
enum 50000 UpdateMyCustomerListAction
{
    value(0; Add)
    {
        Caption = 'Add', Locked = true;
    }
    value(1; Remove)
    {
        Caption = 'Remove', Locked = true;
    }
}