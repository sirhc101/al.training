page 50001 "Inventory Signal List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Inventory Signal";

    layout
    {
        area(Content)
        {
            repeater(Repeater1)
            {
                field(Signal; Signal)
                {
                    ApplicationArea = All;
                }
                field("Minimum Value"; "Minimum Value")
                {
                    ApplicationArea = All;
                }
                field(Image; Image)
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
            action(UploadNewImage)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Import;

                trigger OnAction();
                begin
                    UploadNewImage();
                end;
            }
        }
    }
}