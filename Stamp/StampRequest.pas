unit StampRequest;

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
  Datasnap.DSClientRest, Vcl.ComCtrls, Helper, strUtils;

function StampReq(URL, Token, XML, Path: String; b64 : Boolean = false): String;

implementation

function StampReq(URL, Token, XML, Path: String; b64: Boolean): String;
var
  HTTP: TIdHTTP;
  base64: string;
  Params: TIdMultipartFormDataStream;
  Stream: TStringStream;
  StrList : TStreamWriter;
begin
base64 := IfThen(b64,'b64');

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

     URL := URL+Path+base64;
     HTTP.Request.CustomHeaders.FoldLines := False;
     HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + Token);
    try
        HTTP.Post(URL, Params, Stream);
        Result := Stream.DataString;
     except
      on E: EIdHTTPProtocolException  do
          Result := E.ErrorMessage;
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

end.
