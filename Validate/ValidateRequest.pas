unit ValidateRequest;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
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
  IdHTTP, IdGlobal,
  IdCoder,
  IdCoder3to4,
  IdCoderMIME,
  IdMultipartFormData,
  IdGlobalProtocols,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  IPPeerClient,
  Vcl.StdCtrls,
  REST.Client,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  REST.Types,
  Vcl.ComCtrls;

function ValidateCfdiRequest(Url, Token, XML: string): String;
function ValidateLrfcRequest(Url, Token, LRFC: string): String;
function ValidateLcoRequest(Url, Token, NoCert: string): String;

implementation

function ValidateCfdiRequest(Url, Token, XML: string): String;
var
  HTTP: TIdHTTP;
  RequestBody: TStream;
  JSonValues: TJSONObject;
  ResponseBody, boundary, body, sp: string;
  Params: TIdMultipartFormDataStream;
  Stream: TStringStream;
  StrList: TStreamWriter;
begin

  HTTP := TIdHTTP.Create;

  try
    Stream := TStringStream.Create('');
    StrList := TStreamWriter.Create('xml.xml', false, TEncoding.UTF8);
    StrList.WriteLine(XML);
    StrList.Free();
  finally
  end;
  try
    Params := TIdMultipartFormDataStream.Create;
    try
      Params.AddFile('XML', 'xml.xml', 'multipart/form-data');
      try
        Url := Url + '/validate/cfdi33/';
        HTTP.Request.CustomHeaders.FoldLines := false;
        HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + Token);
        try
          HTTP.Post(Url, Params, Stream);
          Result := Stream.DataString;
        except
          on E: EIdHTTPProtocolException do
            if (HTTP.ResponseCode > 300) and (HTTP.ResponseCode < 600) then
              Result := E.ErrorMessage
            else
              Result := E.Message;
        end;
      finally
        Params.Free;
      end;
    finally
    end;
  finally
    HTTP.Free;
  end;
  ReportMemoryLeaksOnShutdown := false;
end;

function ValidateLrfcRequest(Url, Token, LRFC: string): String;
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

        try
          Result := HTTP.Get(Url + '/lrfc/' + AnsiUpperCase(LRFC) + '/');
        except
          on E: EIdHTTPProtocolException do
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
  ReportMemoryLeaksOnShutdown := false;
end;

function ValidateLcoRequest(Url, Token, NoCert: string): String;
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

        try
          Result := HTTP.Get(Url + '/lco/' + NoCert);
        except
          on E: EIdHTTPProtocolException do
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
  ReportMemoryLeaksOnShutdown := false;
end;

end.
