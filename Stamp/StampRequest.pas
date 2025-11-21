unit StampRequest;

interface

function StampReq(URL, Token, XML, Path: String; b64 : Boolean = false): String;

implementation

uses
  System.SysUtils,
  System.Classes,
  Helper,
  strUtils,
  SWHTTPClient,
  IdMultipartFormData,
  IdHTTP;

function StampReq(URL, Token, XML, Path: String; b64: Boolean): String;
var
  HTTPClient: TSWHTTPClient;
  base64: string;
  Params: TIdMultipartFormDataStream;
  Stream: TStringStream;
  XMLStream: TStringStream;
begin
  base64 := IfThen(b64, 'b64', '');

  HTTPClient := TSWHTTPClient.Create;
  try
    try
      Stream := TStringStream.Create('', TEncoding.UTF8);

     XMLStream := TStringStream.Create(XML, TUTF8Encoding.Create(False));
      XMLStream.Position := 0;

      Params := TIdMultipartFormDataStream.Create;
      try
        Params.AddFormField('XML', 'multipart/form-data', '', XMLStream, 'cfdi.xml');
        URL := URL + Path + base64;
        HTTPClient.HTTP.Request.CustomHeaders.FoldLines := False;
        HTTPClient.HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + Token);
        HTTPClient.Post(URL, Params, Stream);
        Result := Stream.DataString;
      finally
        Params.Free;
        Stream.Free;
        XMLStream.Free;
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
