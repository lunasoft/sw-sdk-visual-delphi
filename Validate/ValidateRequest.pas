unit ValidateRequest;

interface

function ValidateCfdiRequest(Url, Token, XML: string): String;

implementation

uses
	System.Classes,
  System.SysUtils,
  SWHTTPClient,
  IdMultipartFormData,
  IdHTTP;

function ValidateCfdiRequest(Url, Token, XML: string): String;
var
  HTTPClient: TSWHTTPClient;
  Params: TIdMultipartFormDataStream;
  Stream: TStringStream;
  StrList: TStreamWriter;
begin
  HTTPClient := TSWHTTPClient.Create;
  try
    Stream := TStringStream.Create('', TEncoding.UTF8);
    StrList := TStreamWriter.Create('xml.xml', false, TEncoding.UTF8);
    StrList.WriteLine(XML);
    StrList.Free();
    
    Params := TIdMultipartFormDataStream.Create;
    try
      Params.AddFile('XML', 'xml.xml', 'multipart/form-data');
      Url := Url + '/validate/cfdi/';
      HTTPClient.HTTP.Request.CustomHeaders.FoldLines := false;
      HTTPClient.HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + Token);
      try
        HTTPClient.Post(Url, Params, Stream);
        Result := Stream.DataString;
      except
        on E: EIdHTTPProtocolException do
          if (HTTPClient.HTTP.ResponseCode > 300) and (HTTPClient.HTTP.ResponseCode < 600) then
            Result := E.ErrorMessage
          else
            Result := E.Message;
      end;
    finally
      Params.Free;
      Stream.Free;
    end;
  finally
    HTTPClient.Free;
  end;
end;


end.

