unit AuthenticationRequest;

interface

uses
  System.Classes;

function AuthRequest(URL, User, Password: String): String;

implementation

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.JSON,
  SWHTTPClient,
  IdHTTP;

function AuthRequest(URL, User, Password: String): String;
var
  HTTPClient: TSWHTTPClient;
  RequestBody: TStream;
  JSONBody: TJSONObject;
begin
  HTTPClient := TSWHTTPClient.Create;
  try
    try
      JSONBody := TJSONObject.Create;
      try
        JSONBody.AddPair('user', User);
        JSONBody.AddPair('password', Password);
        
        RequestBody := TStringStream.Create(JSONBody.ToString, TEncoding.UTF8);
        try
          HTTPClient.HTTP.Request.Accept := 'application/json';
          HTTPClient.HTTP.Request.ContentType := 'application/json';
          HTTPClient.HTTP.Request.CustomHeaders.FoldLines := False;
          Result := HTTPClient.Post(URL + '/v2/security/authenticate', RequestBody);
        finally
          RequestBody.Free;
        end;
      finally
        JSONBody.Free;
      end;
    except
      on E: EIdHTTPProtocolException do
        Result := E.ErrorMessage;
      on E: Exception do
        Result := E.Message;
    end;
  finally
    HTTPClient.Free;
  end;
end;

end.
