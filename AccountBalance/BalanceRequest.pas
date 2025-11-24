unit BalanceRequest;

interface

function GetBalance(URL, Token: String): String;

implementation

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  SWHTTPClient;

function GetBalance(URL, Token: String): String;
var
  HTTPClient: TSWHTTPClient;
  ErrorResponse: TJSONObject;
begin

  HTTPClient := TSWHTTPClient.Create;
  try
    try
      HTTPClient.HTTP.Request.Accept := 'application/json';
      HTTPClient.HTTP.Request.ContentType := 'application/json';
      HTTPClient.HTTP.Request.CustomHeaders.FoldLines := false;
      HTTPClient.HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + Token);
      URL := URL + '/management/v2/api/users/balance';
      Result := HTTPClient.Get(URL);
    except
      on E: Exception do
      begin
        ErrorResponse := TJSONObject.Create;
        try
          ErrorResponse.AddPair('status', 'error');
          ErrorResponse.AddPair('message', 'Error en la petición HTTP');
          ErrorResponse.AddPair('messageDetail', E.Message);
          Result := ErrorResponse.ToString;
        finally
          ErrorResponse.Free;
        end;
      end;
    end;
  finally
    HTTPClient.Free;
  end;
end;


end.
