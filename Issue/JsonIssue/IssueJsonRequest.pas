unit IssueJsonRequest;

interface
uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.JSON,
  System.JSON.Builders,
  System.JSON.Writers,
  System.JSON.Readers,
  System.JSON.BSON,
  IdHTTP, IdGlobal,
  IdCoder,
  IdCoder3to4,
  IdCoderMIME,
  IdMultipartFormData,
  IdGlobalProtocols,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, Vcl.StdCtrls, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Types,
  Vcl.ComCtrls, StampRequest, StampResponseV1,
  StampResponseV2, StampResponseV3, StampResponseV4;
  function IssueServiceJSON(URL, Token, Json, Version: String): String;

implementation

function IssueServiceJSON(URL, Token, Json, Version: String): String;
 var
  HTTP: TIdHTTP;
  RequestBody: TStream;
begin
try
     HTTP := TIdHTTP.Create;
finally

end;

try
   try
       RequestBody := TStringStream.Create(UTF8ToWideString(Json), TEncoding.UTF8);
     try
        HTTP.Request.Accept := 'application/json';
        HTTP.Request.ContentType := 'application/jsontoxml';
        HTTP.Request.CustomHeaders.FoldLines := False;
        HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + Token);

        URL := URL+'/v3/cfdi33/issue/json/'+Version;
        Result := HTTP.Post(URL,RequestBody);
        HTTP.responseCode;
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
end;

end.
