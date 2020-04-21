table 50200 "Reward"
{
    Caption = 'Reward';
    DataClassification = CustomerContent;
    LookupPageId = "Reward List";
    DrillDownPageId = 50200;

    fields
    {
        field(1; "Reward ID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Reward ID';
        }
        field(5; "Description"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(10; "Discount Percentage"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Discount Percentage';
        }
    }

    keys
    {
        key(PK; "Reward ID")
        {
            Clustered = true;
        }
    }
}