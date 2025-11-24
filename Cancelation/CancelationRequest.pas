unit CancelationRequest;

interface

function RequestJson(url, token, body, path: String): String;
function RequestUrl(url, token, rfcEmisor, uuid, pathReq: String): String;  overload;
function RequestUrl(url, token, rfcEmisor, uuid, motivo, folioSustitucion, pathReq: String): String; overload;
function RequestUrlGet(url, token, rfcEmisor, pathReq: String): String;
function CsdBody(uuid, password, rfcEmisor, motivo, folioSustitucion, b64Cer, b64Key: String): String; overload;
function CsdBody(uuid, password, rfcEmisor, b64Cer, b64Key: String): String;  overload; overload;
function PfxBody(uuid, password, rfcEmisor, motivo, folioSustitucion, b64Pfx: String): string;
function PfxBodyRelations(uuid, password, rfcEmisor, b64Pfx: String): string; overload;
function CsdsBody(uuid, accion, password, rfcEmisor, b64Cer,
  b64Key: String): String;
function PfxsBody(uuid, accion, password, rfcEmisor, b64Pfx: String): string;
function RemoveCrLf(const S: string): string;

implementation

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  StrUtils,
  System.JSON,
  Data.Bind.Components,
  REST.Types,
  SWHTTPClient,
  IdHTTP;

function RequestJson(url, token, body, path: String): String;
var
  HTTPClient: TSWHTTPClient;
  RequestBody: TStream;
begin
  HTTPClient := TSWHTTPClient.Create;
  try
    try
      RequestBody := TStringStream.Create(body, TEncoding.UTF8);
      try
        HTTPClient.HTTP.Request.Accept := 'application/json';
        HTTPClient.HTTP.Request.ContentType := 'application/json';
        HTTPClient.HTTP.Request.CustomHeaders.FoldLines := false;
        HTTPClient.HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + token);
        url := url + path;
        Result := HTTPClient.Post(url, RequestBody);
      finally
        RequestBody.Free;
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

function RequestUrl(url, token, rfcEmisor, uuid, pathReq: String): String;
var
  HTTPClient: TSWHTTPClient;
  RequestBody: TStream;
begin
  HTTPClient := TSWHTTPClient.Create;
  try
    try
      RequestBody := TStringStream.Create('', TEncoding.UTF8);
      try
        HTTPClient.HTTP.Request.Accept := 'application/json';
        HTTPClient.HTTP.Request.ContentType := 'application/json';
        HTTPClient.HTTP.Request.CustomHeaders.FoldLines := false;
        HTTPClient.HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + token);
        url := url + pathReq + rfcEmisor + '/' + uuid + '/';
        Result := HTTPClient.Post(url, RequestBody);
      finally
        RequestBody.Free;
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

function RequestUrl(url, token, rfcEmisor, uuid, motivo, folioSustitucion, pathReq: String): String; overload; overload;
var
  HTTPClient: TSWHTTPClient;
  RequestBody: TStream;
begin
  HTTPClient := TSWHTTPClient.Create;
  try
    try
      RequestBody := TStringStream.Create('', TEncoding.UTF8);
      try
        HTTPClient.HTTP.Request.Accept := 'application/json';
        HTTPClient.HTTP.Request.ContentType := 'application/json';
        HTTPClient.HTTP.Request.CustomHeaders.FoldLines := false;
        HTTPClient.HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + token);
        url := url + pathReq + rfcEmisor + '/' + uuid + '/' + motivo + '/' + folioSustitucion;
        Result := HTTPClient.Post(url, RequestBody);
      finally
        RequestBody.Free;
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

function RequestUrlGet(url, token, rfcEmisor, pathReq: String): String;
var
  HTTPClient: TSWHTTPClient;
begin
  HTTPClient := TSWHTTPClient.Create;
  try
    try
      HTTPClient.HTTP.Request.Accept := 'application/json';
      HTTPClient.HTTP.Request.CustomHeaders.FoldLines := false;
      HTTPClient.HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + token);
      url := url + pathReq + rfcEmisor;
      Result := HTTPClient.Get(url);
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

function CsdBody(uuid, password, rfcEmisor, motivo, folioSustitucion, b64Cer, b64Key: String): String;
begin
  b64Cer := RemoveCrLf(b64Cer);
  b64Key := RemoveCrLf(b64Key);
  Result := '{"uuid":"' + uuid + '", ' +
            '"password":"' + password + '", ' +
            '"rfc":"' + rfcEmisor + '", ' +
            '"motivo":"' + motivo + '", ' +
            '"foliosustitucion":"' + folioSustitucion + '", ' +
            '"b64Cer":"' + b64Cer + '", ' +
            '"b64Key":"' + b64Key + '"}';
end;

function CsdBody(uuid, password, rfcEmisor, b64Cer, b64Key: String): String;  overload;
begin

  Result := '{"uuid":"' + uuid + '", ' + '"password": "' + password + '", ' +
    '"rfc": "' + rfcEmisor + '", ' + '"b64Cer": "' + b64Cer + '", ' +
    '"b64Key": "' + b64Key + '"}'
end;

function PfxBody(uuid, password, rfcEmisor, motivo, folioSustitucion, b64Pfx: String): string;
begin
  Result := '{"uuid":"' + uuid + '", "password": "' + password + '", "rfc": "' +
  rfcEmisor + '", "motivo":"' + motivo + '", "foliosustitucion":"' +
  folioSustitucion + '", "b64Pfx": "' + b64Pfx + '"}';
end;

function PfxBodyRelations(uuid, password, rfcEmisor, b64Pfx: String): string; overload;
begin
  Result := '{"uuid":"' + uuid + '", "password": "' + password + '", "rfc": "' +
    rfcEmisor + '", "b64Pfx": "' + b64Pfx + '"}'
end;

function CsdsBody(uuid, accion, password, rfcEmisor, b64Cer, b64Key: String): String;
begin

  Result := '{ "uuids": [ {"uuid":"' + uuid + '", "action":"' + accion +
    '"} ], "password": "' + password + '", "rfc": "' + rfcEmisor +
    '","b64Cer": "' + b64Cer + '","b64Key": "' + b64Key + '"}';
end;

function PfxsBody(uuid, accion, password, rfcEmisor, b64Pfx: String): string;
begin
  Result := '{ "uuids": [ {"uuid":"' + uuid + '", "action":"' + accion +
    '"} ], "password": "' + password + '", "rfc": "' + rfcEmisor +
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

