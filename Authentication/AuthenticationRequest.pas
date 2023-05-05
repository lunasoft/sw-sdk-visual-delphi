unit AuthenticationRequest;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  IdHTTP, IdGlobal,
  IdCoder,
  IdCoder3to4,
  IdCoderMIME,
  IdMultipartFormData,
  IdGlobalProtocols,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, Vcl.StdCtrls, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Types,
  REST.Json,
  Vcl.ComCtrls, Helper;

function AuthRequest(URL, User, Password: String): String;

implementation

function AuthRequest(URL, User, Password: String): String;
var
  HTTP: TIdHTTP;
  RequestBody: TStream;
begin

  HTTP := TIdHTTP.Create;
  try
    try
      RequestBody := TStringStream.Create();
      try
        HTTP.Request.Accept := 'application/json';
        HTTP.Request.ContentType := 'application/json';
        HTTP.Request.CustomHeaders.FoldLines := False;
        HTTP.Request.CustomHeaders.Add('user:' + User);
        HTTP.Request.CustomHeaders.Add('password:' + Password);

        try
          Result := HTTP.Post(URL + '/security/authenticate', RequestBody);
        finally
          RequestBody.Free;
        end;
      except
        on E: EIdHTTPProtocolException do
        begin
          Result := E.ErrorMessage;
        end;
        on E: Exception do
        begin
          Result := E.Message;
        end;
      end;
    finally
      HTTP.Free;
    end;
    ReportMemoryLeaksOnShutdown := False;
  finally
  end;
end;

end.
