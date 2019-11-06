table 50001 "Inventory Signal"
{
    Access = Public;
    DataClassification = CustomerContent;
    Caption = 'Inventory Signal';

    fields
    {
        field(1; Signal; Enum Signal)
        {
            Access = Public;
            DataClassification = CustomerContent;
            Caption = 'Signal';
        }
        field(2; "Minimum Value"; Decimal)
        {
            Access = Public;
            DataClassification = CustomerContent;
            Caption = 'Minimum Value';

            trigger OnValidate()
            begin
                if (Signal = Signal::Gray) then
                    TestField("Minimum Value", 0);
            end;
        }
        field(10; Image; Media)
        {
            Access = Public;
            DataClassification = CustomerContent;
            Caption = 'Image';
        }
    }

    keys
    {
        key(PK; Signal)
        {
            Clustered = true;
        }
        key(MinValue; "Minimum Value")
        { }
    }

    /// <summary>
    /// This method is providing the function to upload new signal images to the database.
    /// </summary>
    procedure UploadNewImage()
    var
        tempBlob: Codeunit "Temp Blob";
        fileMgmt: Codeunit "File Management";
        fileName: Text;
        stream: InStream;
    begin
        fileName := fileMgmt.BLOBImport(tempBlob, '');
        tempBlob.CreateInStream(stream);
        Image.ImportStream(stream, fileName);

        if (Image.HasValue()) then
            Message(ImageHasBeenUploadedMsg)
        else
            Error(ImageCouldNoBeenUploadedErr);
    end;


    var
        ImageHasBeenUploadedMsg: Label 'The image has been uploaded successfully.';
        ImageCouldNoBeenUploadedErr: Label 'Image could not been uploaded successfully.';
}