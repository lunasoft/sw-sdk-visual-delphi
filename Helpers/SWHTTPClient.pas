unit SWHTTPClient;

interface

uses
  System.SysUtils,
  System.Classes,
  IdHTTP,
  IdSSLOpenSSL,
  IdGlobal,
  IdGlobalProtocols,
  IdMultipartFormData;

type
  TSWHTTPClient = class
  private
    FHTTP: TIdHTTP;
    FSSLIOHandler: TIdSSLIOHandlerSocketOpenSSL;
    procedure ConfigureSSL;
  public
    constructor Create;
    destructor Destroy; override;
    function Get(const AURL: string): string;
    function Post(const AURL: string; const ASource: TStream): string; overload;
    function Post(const AURL: string; const ASource: TIdMultipartFormDataStream): string; overload;
    function Post(const AURL: string; const ASource: TIdMultipartFormDataStream; AResponseContent: TStream): string; overload;
    property HTTP: TIdHTTP read FHTTP;
  end;

implementation

uses
  IdIOHandler,
  IdIOHandlerSocket,
  IdIOHandlerStack,
  IdSSL;

constructor TSWHTTPClient.Create;
begin
  inherited Create;
  FHTTP := TIdHTTP.Create(nil);
  FSSLIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  
  // Configurar el IOHandler SSL
  FHTTP.IOHandler := FSSLIOHandler;
  
  // Configurar SSL/TLS
  ConfigureSSL;
end;

destructor TSWHTTPClient.Destroy;
begin
  if Assigned(FSSLIOHandler) then
    FSSLIOHandler.Free;
  if Assigned(FHTTP) then
    FHTTP.Free;
  inherited Destroy;
end;

procedure TSWHTTPClient.ConfigureSSL;
begin
  // Configurar TLS 1.2 o superior
  FSSLIOHandler.SSLOptions.Method := sslvTLSv1_2;
  FSSLIOHandler.SSLOptions.SSLVersions := [sslvTLSv1_2];

  // Configuraciones adicionales de seguridad
  FSSLIOHandler.SSLOptions.VerifyDepth := 0;
  FSSLIOHandler.SSLOptions.VerifyMode := [];
  FSSLIOHandler.SSLOptions.VerifyDirs := '';
  FSSLIOHandler.SSLOptions.CertFile := '';
  FSSLIOHandler.SSLOptions.KeyFile := '';
  FSSLIOHandler.SSLOptions.RootCertFile := '';

  // Configurar timeouts
  FHTTP.ConnectTimeout := 30000; // 30 segundos
  FHTTP.ReadTimeout := 30000;    // 30 segundos
end;

function TSWHTTPClient.Get(const AURL: string): string;
begin
  Result := FHTTP.Get(AURL);
end;

function TSWHTTPClient.Post(const AURL: string; const ASource: TStream): string;
var
  ResponseStream: TStringStream;
begin
  ResponseStream := TStringStream.Create('', TEncoding.UTF8);
  try
    FHTTP.Post(AURL, ASource, ResponseStream);
    Result := ResponseStream.DataString;
  finally
    ResponseStream.Free;
  end;
end;

function TSWHTTPClient.Post(const AURL: string; const ASource: TIdMultipartFormDataStream): string;
var
  ResponseStream: TStringStream;
begin
  ResponseStream := TStringStream.Create('', TEncoding.UTF8);
  try
    FHTTP.Post(AURL, ASource, ResponseStream);
    Result := ResponseStream.DataString;
  finally
    ResponseStream.Free;
  end;
end;

function TSWHTTPClient.Post(const AURL: string; const ASource: TIdMultipartFormDataStream; AResponseContent: TStream): string;
begin
  FHTTP.Post(AURL, ASource, AResponseContent);

  if AResponseContent is TStringStream then
    Result := TStringStream(AResponseContent).DataString
  else
    Result := ''; // o devuelve un mensaje indicando que no es texto
end;

end.
