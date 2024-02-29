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

function RequestJson(url, token, body, path: String): String;
function RequestUrl(url, token, rfCEmisor, uuid, pathReq: String): String;  overload;
function RequestUrl(url, token, rfCEmisor, uuid, motivo, folioSustitucion, pathReq: String): String; overload;
function RequestUrlGet(url, token, rfCEmisor, pathReq: String): String;
function CsdBody(uuid, password, rfCEmisor, motivo, folioSustitucion, b64Cer, b64Key: String): String; overload;
function CsdBody(uuid, password, rfCEmisor, b64Cer, b64Key: String): String;  overload; overload;
function PfxBody(uuid, password, rfCEmisor, motivo, folioSustitucion, b64Pfx: String): string;
function PfxBodyRelations(uuid, password, rfCEmisor, b64Pfx: String): string; overload;
function CsdsBody(uuid, accion, password, rfCEmisor, b64Cer,
  b64Key: String): String;
function PfxsBody(uuid, accion, password, rfCEmisor, b64Pfx: String): string;
function RemoveCrLf(const S: string): string;

implementation

function RequestJson(url, token, body, path: String): String;
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
        HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + token);
        url := url + path;
        ResponseBody := HTTP.Post(url, RequestBody);
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

function RequestUrl(url, token, rfCEmisor, uuid, pathReq: String): String;
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
        HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + token);
        url := url + pathReq + rfCEmisor + '/' + uuid + '/';
        ResponseBody := HTTP.Post(url, RequestBody);
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

function RequestUrl(url, token, rfCEmisor, uuid, motivo, folioSustitucion, pathReq: String): String; overload; overload;
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
        HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + token);
        url := url + pathReq + rfCEmisor + '/' + uuid + '/' + motivo + '/' + folioSustitucion;
        ResponseBody := HTTP.Post(url, RequestBody);
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

function RequestUrlGet(url, token, rfCEmisor, pathReq: String): String;
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
        HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + token);
        url := url + pathReq + rfCEmisor;
        ResponseBody := HTTP.Get(url);
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

function CsdBody(uuid, password, rfCEmisor, motivo, folioSustitucion, b64Cer, b64Key: String): String;
begin
  b64Cer := RemoveCrLf(b64Cer);
  b64Key := RemoveCrLf(b64Key);
  Result := '{"uuid":"' + uuid + '", ' +
            '"password":"' + password + '", ' +
            '"rfc":"' + rfCEmisor + '", ' +
            '"motivo":"' + motivo + '", ' +
            '"foliosustitucion":"' + folioSustitucion + '", ' +
            '"b64Cer":"' + b64Cer + '", ' +
            '"b64Key":"' + b64Key + '"}';
end;

function CsdBody(uuid, password, rfCEmisor, b64Cer, b64Key: String): String;  overload;
begin

  Result := '{"uuid":"' + uuid + '", ' + '"password": "' + password + '", ' +
    '"rfc": "' + rfCEmisor + '", ' + '"b64Cer": "' + b64Cer + '", ' +
    '"b64Key": "' + b64Key + '"}'
end;

function PfxBody(uuid, password, rfCEmisor, motivo, folioSustitucion, b64Pfx: String): string;
begin
  Result := '{"uuid":"' + uuid + '", "password": "' + password + '", "rfc": "' +
  rfCEmisor + '", "motivo":"' + motivo + '", "foliosustitucion":"' +
  folioSustitucion + '", "b64Pfx": "' + b64Pfx + '"}';
end;

function PfxBodyRelations(uuid, password, rfCEmisor, b64Pfx: String): string; overload;
begin
  Result := '{"uuid":"' + uuid + '", "password": "' + password + '", "rfc": "' +
    rfCEmisor + '", "b64Pfx": "' + b64Pfx + '"}'
end;

function CsdsBody(uUID, accion, password, rfCEmisor, b64Cer, b64Key: String): String;
begin

  Result := '{ "uuids": [ {"uuid":"' + uuid + '", "action":"' + accion +
    '"} ], "password": "' + password + '", "rfc": "' + rfCEmisor +
    '","b64Cer": "' + b64Cer + '","b64Key": "' + b64Key + '"}';
end;

function PfxsBody(uUID, accion, password, rfCEmisor, b64Pfx: String): string;
begin
  Result := '{ "uuids": [ {"uuid":"' + uuid + '", "action":"' + accion +
    '"} ], "password": "' + password + '", "rfc": "' + rfCEmisor +
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
