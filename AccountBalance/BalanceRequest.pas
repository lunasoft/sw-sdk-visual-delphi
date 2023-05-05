unit BalanceRequest;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  StrUtils,
  System.JSON,
  System.JSON.Builders,
  System.JSON.Writers,
  System.JSON.Readers,
  System.JSON.BSON,
  IdHTTP,
  IdGlobal,
  IdCoder,
  IdCoder3to4,
  IdCoderMIME,
  IdMultipartFormData,
  IdGlobalProtocols,
  IPPeerClient,
  REST.Client,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  REST.Types;

function GetBalance(URL, Token: String): String;

implementation

function GetBalance(URL, Token: String): String;
var
  HTTP: TIdHTTP;
  RequestBody: TStream;
  ResponseBody: string;
begin
  HTTP := TIdHTTP.Create;
  try
		try
      RequestBody := TStringStream.Create();
      try
        HTTP.Request.Accept := 'application/json';
        HTTP.Request.ContentType := 'application/json';
        HTTP.Request.CustomHeaders.FoldLines := false;
				HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + Token);
				url:= url+'/account/balance';
				ResponseBody := HTTP.Get(URL);
				Result := String(ResponseBody);
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
  ReportMemoryLeaksOnShutdown := false;
end;

end.
