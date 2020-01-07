codeunit 50201 "Google Maps Api"
{
    trigger OnRun()
    begin

    end;

    procedure GetDistanceAndDuration(destinationCust: Record Customer)
    var
        companyInfo: Record "Company Information";
        url: Text;
        responseMsg: Text;
        distance: Decimal;
        duration: Decimal;
        durationAsType: Duration;
    begin
        companyInfo.Get();

        url := StrSubstNo('%1?key=%2&origins=%3&destinations=%4',
            GetUrl(),
            GetApiKey(),
            GetConcatAddress(companyInfo),
            GetConcatAddress(destinationCust));

        CallApi(url, responseMsg);

        ParseJsonAndMessageOutput(responseMsg, distance, duration);

        distance := Round((distance / 1000), 1); // in km
        durationAsType := (duration * 1000); // calc from ms to duration data type.
        duration := Round((duration / 60), 1); // in min

        Message(FinalMsg,
            StrSubstNo('%1, %2 %3', companyInfo.Address, companyInfo."Post Code", companyInfo.City),
            StrSubstNo('%1, %2 %3', destinationCust.Address, destinationCust."Post Code", destinationCust.City),
            distance,
            duration);

        Message(FinalCoolMsg, durationAsType);
    end;

    local procedure ParseJsonAndMessageOutput(jsonAsString: Text; var distance: Decimal; var duration: Decimal)
    var
        object: JsonObject;
        token: JsonToken;
        isHandled: Boolean;
    begin
        OnBeforeParseJsonAndMessageOutput(jsonAsString, distance, duration, isHandled);
        if (isHandled) then
            exit;

        object.ReadFrom(jsonAsString);
        object.SelectToken('rows[0].elements[0].distance.value', token);
        distance := token.AsValue().AsDecimal();
        object.SelectToken('rows[0].elements[0].duration.value', token);
        duration := token.AsValue().AsDecimal();

        OnAfterParseJsonAndMessageOutput(jsonAsString, distance, duration);
    end;

    local procedure GetConcatAddress(companyInfo: Record "Company Information"): Text
    begin
        exit(GetConcatAddress(companyInfo.Address, companyInfo."Post Code", companyInfo.City));
    end;

    local procedure GetConcatAddress(customer: Record "Customer"): Text
    begin
        exit(GetConcatAddress(customer.Address, customer."Post Code", customer.City));
    end;

    local procedure GetConcatAddress(address: Text; postCode: Code[20]; city: Text): Text
    var
        string: Text;
    begin
        string := StrSubstNo('%1+%2+%3',
            address, postCode, city);

        exit(ConvertStr(string, '/?& ', '    '));
    end;

    local procedure CallApi(url: Text; var responseMsg: Text)
    var
        client: HttpClient;
        response: HttpResponseMessage;
    begin
        client.Get(url, response);
        if (not response.IsSuccessStatusCode()) then
            Error('%1', response.ReasonPhrase());

        response.Content().ReadAs(responseMsg);
    end;

    local procedure GetApiKey(): Text
    begin
        exit('AIzaSyBj1vWH6N_phVAP1AdCZEI5ikOI5YdY2SA');
    end;

    local procedure GetUrl(): Text
    begin
        exit('https://maps.googleapis.com/maps/api/distancematrix/json');
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeParseJsonAndMessageOutput(jsonAsString: Text; var distance: Decimal; var duration: Decimal; var isHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterParseJsonAndMessageOutput(jsonAsString: Text; var distance: Decimal; var duration: Decimal)
    begin
    end;

    var
        FinalMsg: Label 'Origin: %1\Destination: %2\ \Distance: %3 km\Duration: %4 min.';
        FinalCoolMsg: Label 'That are %1.';
}