unit CancelationRequest;

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

function RequestJson(URL, Token, body, path: String): String;
function RequestUrl(URL, Token, RFCEmisor, UUID, PathReq: String): String;  overload;
function RequestUrl(URL, Token, RFCEmisor, UUID, Motivo, FolioSustitucion, PathReq: String): String; overload;
function RequestUrlGet(URL, Token, RFCEmisor, PathReq: String): String;
function csdBody(UUID, Password, RFCEmisor, Motivo, FolioSustitucion, b64Cer, b64Key: String): String; overload;
function csdBody(UUID, Password, RFCEmisor, b64Cer, b64Key: String): String;  overload; overload;
function pfxBody(UUID, Password, RFCEmisor, Motivo, FolioSustitucion, b64Pfx: String): string;
function pfxBodyRelations(UUID, Password, RFCEmisor, b64Pfx: String): string; overload;
function csdsBody(UUID, Accion, Password, RFCEmisor, b64Cer,
  b64Key: String): String;
function pfxsBody(UUID, Accion, Password, RFCEmisor, b64Pfx: String): string;
function RemoveCrLf(const S: string): string;

implementation

function RequestJson(URL, Token, body, path: String): String;
var
  HTTP: TIdHTTP;
  RequestBody: TStream;
  ResponseBody: string;
  IsUTF8: Boolean;
begin
  HTTP := TIdHTTP.Create;
  try
    try
      IsUTF8 := TEncoding.UTF8.GetString(TEncoding.UTF8.GetBytes(body)) = body;
      RequestBody := TStringStream.Create(body);
      try
        HTTP.Request.Accept := 'application/json';
        HTTP.Request.ContentType := 'application/json';
        HTTP.Request.CustomHeaders.FoldLines := false;
        HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + Token);
        URL := URL + path;
        ResponseBody := HTTP.Post(URL, RequestBody);
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

function RequestUrl(URL, Token, RFCEmisor, UUID, PathReq: String): String;
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
        URL := URL + PathReq + RFCEmisor + '/' + UUID + '/';
        ResponseBody := HTTP.Post(URL, RequestBody);
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

function RequestUrl(URL, Token, RFCEmisor, UUID, Motivo, FolioSustitucion, PathReq: String): String; overload;
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
        URL := URL + PathReq + RFCEmisor + '/' + UUID + '/' + Motivo + '/' + FolioSustitucion;
        ResponseBody := HTTP.Post(URL, RequestBody);
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

function RequestUrlGet(URL, Token, RFCEmisor, PathReq: String): String;
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
        URL := URL + PathReq + RFCEmisor;
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

function csdBody(UUID, Password, RFCEmisor, Motivo, FolioSustitucion, b64Cer, b64Key: String): String;
begin
  b64Cer := RemoveCrLf(b64Cer);
  b64Key := RemoveCrLf(b64Key);
  Result := '{"uuid":"' + UUID + '", ' +
            '"password":"' + Password + '", ' +
            '"rfc":"' + RFCEmisor + '", ' +
            '"motivo":"' + Motivo + '", ' +
            '"foliosustitucion":"' + FolioSustitucion + '", ' +
            '"b64Cer":"' + b64Cer + '", ' +
            '"b64Key":"' + b64Key + '"}';
end;

function csdBody(UUID, Password, RFCEmisor, b64Cer, b64Key: String): String;  overload;
begin

  Result := '{"uuid":"' + UUID + '", ' + '"password": "' + Password + '", ' +
    '"rfc": "' + RFCEmisor + '", ' + '"b64Cer": "' + b64Cer + '", ' +
    '"b64Key": "' + b64Key + '"}'
end;

function pfxBody(UUID, Password, RFCEmisor, Motivo, FolioSustitucion, b64Pfx: String): string;
begin
  Result := '{"uuid":"' + UUID + '", "password": "' + Password + '", "rfc": "' +
  RFCEmisor + '", "motivo":"' + Motivo + '", "foliosustitucion":"' +
  FolioSustitucion + '", "b64Pfx": "' + b64Pfx + '"}';
end;

function pfxBodyRelations(UUID, Password, RFCEmisor, b64Pfx: String): string; overload;
begin
  Result := '{"uuid":"' + UUID + '", "password": "' + Password + '", "rfc": "' +
    RFCEmisor + '", "b64Pfx": "' + b64Pfx + '"}'
end;

function csdsBody(UUID, Accion, Password, RFCEmisor, b64Cer,
  b64Key: String): String;
begin

  Result := '{ "uuids": [ {"uuid":"' + UUID + '", "action":"' + Accion +
    '"} ], "password": "' + Password + '", "rfc": "' + RFCEmisor +
    '","b64Cer": "' + b64Cer + '","b64Key": "' + b64Key + '"}';
end;

function pfxsBody(UUID, Accion, Password, RFCEmisor, b64Pfx: String): string;
begin
  Result := '{ "uuids": [ {"uuid":"' + UUID + '", "action":"' + Accion +
    '"} ], "password": "' + Password + '", "rfc": "' + RFCEmisor +
    '","b64Pfx": "' + b64Pfx + '" } ';
end;

function RemoveCrLf(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
  begin
    if not (S[I] in [#13, #10]) then
      Result := Result + S[I];
  end;
end;

end.
