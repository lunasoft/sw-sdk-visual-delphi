unit SWSDK;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  StrUtils,
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
  Datasnap.DSClientRest, Vcl.ComCtrls;

function AuthenticationService(URL, User, Password : String): String;
function AccountBalance(URL, Token : String): String;
function StampService(URL, Token, XML, Version: String; b64: Boolean): String;
function StampServiceJSON(URL, Token, json, Version: String; b64: Boolean): String;
function CancelationByXML(URL, Token, XML: String): String;
function CancelationByCSD(URL, Token, b64Cer, b64Key, RFCEmisor, Password, UUID: String): String;
function CancelationByPFX(URL, Token, b64Pfx, RFCEmisor, Password, UUID: String): String;
function CancelationByUUID(URL, Token, RFCEmisor, UUID: String): String;
function ValidateXML(URL, Token, XML: String): String;
function IssueService(URL, Token, XML, Version: String; b64: Boolean): String;
function IssueServiceJSON(URL, Token, json, Version: String): String;
function SearchByLRFC(URL, Token, LRFC: String): String;
function SearchLCOByCertificate(URL, Token, NoCert: String): String;

function cambiarCaracteresReservadosXML (texto : string) : string;
function base64encode(const Text : ansiString): String;
function getStringValue(valor : string): string;

implementation

function AuthenticationService(URL, User, Password : String): String;
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
        HTTP.Request.CustomHeaders.FoldLines := False;
        HTTP.Request.CustomHeaders.Add('user:'+User);
        HTTP.Request.CustomHeaders.Add('password:'+Password);

      try
          Result := HTTP.Post(URL+'/security/authenticate', RequestBody);
       except
        on E: EIdHTTPProtocolException  do
            Result := E.ErrorMessage
       end;
        finally
          RequestBody.Free;
        end;
        finally
      end;
    finally
      HTTP.Free;
    end;
    ReportMemoryLeaksOnShutdown := False;
end;

function AccountBalance(URL, Token : String): String;
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
        HTTP.Request.CustomHeaders.FoldLines := False;
        HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + Token);

      try
          Result := HTTP.Get(URL + '/account/balance/');
       except
        on E: EIdHTTPProtocolException  do
            Result := E.ErrorMessage
       end;
        finally
          RequestBody.Free;
        end;
        finally
      end;
    finally
      HTTP.Free;
    end;
    ReportMemoryLeaksOnShutdown := False;
end;

function StampService(URL, Token, XML, Version: String; b64: Boolean): String;
var
  HTTP: TIdHTTP;
  RequestBody: TStream;
  JSonValues : TJSONObject;
  ResponseBody, boundary, body, sp, base64: string;
  Params: TIdMultipartFormDataStream;
  Stream: TStringStream;
  StrList : TStreamWriter;
begin

   if b64 then
    begin
      base64 := 'b64';
    end
    else
     base64 := '';

HTTP := TIdHTTP.Create;
  try
    try
       Stream := TStringStream.Create('');
       StrList := TStreamWriter.Create('xml.xml',
       false, TEncoding.UTF8);
       StrList.WriteLine(XML);
       StrList.Free();
    finally
    end;
  try
   Params := TIdMultipartFormDataStream.Create;
   try
    Params.AddFile('XML', 'xml.xml','multipart/form-data');

     URL := URL+'/cfdi33/stamp/'+Version+'/'+base64;
     HTTP.Request.CustomHeaders.FoldLines := False;
     HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + Token);
    try
        HTTP.Post(URL, Params, Stream);
        Result := Stream.DataString;
     except
      on E: EIdHTTPProtocolException  do
          Result := E.ErrorMessage
     end;
      finally
        Params.Free;
      end;
      finally
    end;
  finally
    HTTP.Free;
  end;
  ReportMemoryLeaksOnShutdown := False;
end;

function StampServiceJSON(URL, Token, Json, Version: String; b64: Boolean): String;
var
  HTTP: TIdHTTP;
  RequestBody: TStream;
  JSonValues : TJSONObject;
  ResponseBody, base64: string;
begin
   if b64 then
    begin
      base64 := 'b64';
    end
    else
     base64 := '';
try
     HTTP := TIdHTTP.Create;
finally
end;

try
   try
       RequestBody := TStringStream.Create(Json);
     try
        HTTP.Request.Accept := 'application/json';
        HTTP.Request.ContentType := 'application/json';
        HTTP.Request.CustomHeaders.FoldLines := False;
        HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + Token);

        URL := URL+'/v3/cfdi33/issue/json/'+Version+'/'+base64;
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

function CancelationByXML(URL, Token, XML: String): String;
var
  HTTP: TIdHTTP;
  RequestBody: TStream;
  JSonValues : TJSONObject;
  ResponseBody, boundary, body, sp, base64: string;
  Params: TIdMultipartFormDataStream;
  Stream: TStringStream;
  StrList : TStreamWriter;
begin

HTTP := TIdHTTP.Create;
  try
    try
       Stream := TStringStream.Create('');
       StrList := TStreamWriter.Create('xml.xml', false, TEncoding.ASCII);
       StrList.WriteLine(XML);
       StrList.Free();
    finally
    end;
  try
   Params := TIdMultipartFormDataStream.Create;
   try
    Params.AddFile('XML', 'xml.xml','multipart/form-data');

     URL := URL+'/cfdi33/cancel/xml';
     HTTP.Request.CustomHeaders.FoldLines := False;
     HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + Token);
    try
        HTTP.Post(URL, Params, Stream);
        Result := Stream.DataString;
     except
      on E: EIdHTTPProtocolException  do
          Result := E.ErrorMessage
     end;
      finally
        Params.Free;
      end;
      finally
    end;
  finally
    HTTP.Free;
  end;
  ReportMemoryLeaksOnShutdown := False;
end;

function CancelationByCSD(URL, Token, b64Cer, b64Key, RFCEmisor, Password, UUID: String): String;
var
  HTTP: TIdHTTP;
  RequestBody: TStream;
  ResponseBody: string;
begin
HTTP := TIdHTTP.Create;
  try
    try

     RequestBody := TStringStream.Create('{"uuid":"'+UUID+'", ' +
                                          '"password": "' +Password+'", ' +
                                          '"rfc": "' + RFCEmisor + '", ' +
                                          '"b64Cer": "' + b64Cer + '", ' +
                                          '"b64Key": "' + b64Key + '"}');
      try
        HTTP.Request.Accept := 'application/json';
        HTTP.Request.ContentType := 'application/json';
        HTTP.Request.CustomHeaders.FoldLines := False;
        HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + Token);

        URL := URL+'/cfdi33/cancel/csd';
        ResponseBody := HTTP.Post(URL,RequestBody);
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
  ReportMemoryLeaksOnShutdown := False;

end;

function CancelationByPFX(URL, Token, b64Pfx, RFCEmisor, Password, UUID: String): String;
var
  HTTP: TIdHTTP;
  RequestBody: TStream;
  ResponseBody, base64: string;
begin
HTTP := TIdHTTP.Create;
  try
    try

     RequestBody := TStringStream.Create('{"uuid":"'+UUID+'", "password": "'+Password+'", "rfc": "'+RFCEmisor+'", "b64Pfx": "'+b64Pfx+'"}');
      try
        HTTP.Request.Accept := 'application/json';
        HTTP.Request.ContentType := 'application/json';
        HTTP.Request.CustomHeaders.FoldLines := False;
        HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + Token);

        URL := URL+'/cfdi33/cancel/pfx';


        HTTP.Post(URL,RequestBody);
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

function CancelationByUUID(URL, Token, RFCEmisor, UUID: String): String;
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
        HTTP.Request.CustomHeaders.FoldLines := False;
        HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + Token);

        URL := URL + '/cfdi33/cancel/' + RFCEmisor + '/' + UUID + '/';

        ResponseBody := HTTP.Post(URL,RequestBody);
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
  ReportMemoryLeaksOnShutdown := False;

end;

function ValidateXML(URL, Token, XML: String): String;
var
  HTTP: TIdHTTP;
  RequestBody: TStream;
  JSonValues : TJSONObject;
  ResponseBody, boundary, body, sp: string;
  Params: TIdMultipartFormDataStream;
  Stream: TStringStream;
  StrList : TStreamWriter;
begin

HTTP := TIdHTTP.Create;

    try
       Stream := TStringStream.Create('');
       StrList := TStreamWriter.Create('xml.xml',
       false, TEncoding.UTF8);
       StrList.WriteLine(XML);
       StrList.Free();
    finally
    end;
  try
   Params := TIdMultipartFormDataStream.Create;
   try
    Params.AddFile('XML', 'xml.xml','multipart/form-data');
    try
     URL := URL+'/validate/cfdi33/';
     HTTP.Request.CustomHeaders.FoldLines := False;
     HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + Token);
    try
        HTTP.Post(URL, Params, Stream);
        Result := Stream.DataString;
     except
      on E: EIdHTTPProtocolException  do
          Result := E.ErrorMessage
     end;
      finally
        Params.Free;
      end;
      finally
    end;
  finally
    HTTP.Free;
  end;
  ReportMemoryLeaksOnShutdown := False;
end;

function IssueService(URL, Token, XML, Version: String; b64: Boolean): String;
var
  HTTP: TIdHTTP;
  RequestBody: TStream;
  JSonValues : TJSONObject;
  ResponseBody, boundary, body, sp, base64: string;
  Params: TIdMultipartFormDataStream;
  Stream: TStringStream;
  StrList : TStreamWriter;
begin

   if b64 then
    begin
      base64 := 'b64';
    end
    else
     base64 := '';

HTTP := TIdHTTP.Create;
  try
    try
       Stream := TStringStream.Create('');
       StrList := TStreamWriter.Create('xml.xml',
       false, TEncoding.UTF8);
       StrList.WriteLine(XML);
       StrList.Free();
    finally
    end;
  try
   Params := TIdMultipartFormDataStream.Create;
   try
    Params.AddFile('XML', 'xml.xml','multipart/form-data');

     URL := URL+'/cfdi33/issue/'+Version+'/'+base64;
     HTTP.Request.CustomHeaders.FoldLines := False;
     HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + Token);

     try
        HTTP.Post(URL, Params, Stream);
        Result := Stream.DataString;
     except
      on E: EIdHTTPProtocolException  do
          Result := E.ErrorMessage
     end;
      finally
        Params.Free;
      end;
      finally
    end;
  finally
    HTTP.Free;
  end;
  ReportMemoryLeaksOnShutdown := False;
end;

function IssueServiceJSON(URL, Token, json, Version: String): String;
 var
  HTTP: TIdHTTP;
  RequestBody: TStream;
  ResponseBody: string;
begin
try
     HTTP := TIdHTTP.Create;
finally

end;

try
   try
       RequestBody := TStringStream.Create(json, TEncoding.UTF8);
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

function SearchByLRFC(URL, Token, LRFC: String): String;
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
        HTTP.Request.CustomHeaders.FoldLines := False;
        HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + Token);

    try
        Result := HTTP.Get(URL+'/lrfc/'+AnsiUpperCase(LRFC)+'/');
     except
      on E: EIdHTTPProtocolException  do
        if (HTTP.ResponseCode = 400) then
          Result := E.ErrorMessage
        else
          Result := E.Message;
     end;
      finally
      end;
      finally
    end;
  finally
    HTTP.Free;
  end;
  ReportMemoryLeaksOnShutdown := False;
end;

function SearchLCOByCertificate(URL, Token, NoCert: String): String;
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
        HTTP.Request.CustomHeaders.FoldLines := False;
        HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + Token);

      try
        Result := HTTP.Get(URL+'/lco/'+NoCert);
     except
      on E: EIdHTTPProtocolException  do
        if (HTTP.ResponseCode = 400) then
          Result := E.ErrorMessage
        else
          Result := E.Message;
     end;
      finally
      end;
      finally
    end;
  finally
    HTTP.Free;
  end;
  ReportMemoryLeaksOnShutdown := False;
end;



//// Auxiliares

function cambiarCaracteresReservadosXML (texto : string) : string;
var
  cadAux : string;
begin
  cadAux := texto;
  cadAux := AnsiReplaceStr(cadAux, '&', '\&');
  cadAux := AnsiReplaceStr(cadAux, '"', '\"');
  Result := cadAux;
end;

function base64encode(const Text : ansiString): String;
var
  Encoder : TIdEncoderMime;
begin
  Encoder := TIdEncoderMime.Create(nil);
  try
    Result := Encoder.EncodeString(Text);
  finally
    FreeAndNil(Encoder);
  end
end;

function getStringValue(valor : string): string;
begin
  Result:=  stringreplace(valor,'"','',
                                  [rfReplaceAll, rfIgnoreCase]);
end;

end.
