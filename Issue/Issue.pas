unit Issue;


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

function IssueV1(URL, Token, XML: String; Base64: Boolean = False): TStampResponseV1;
function IssueV2(URL, Token, XML: String; Base64: Boolean = False): TStampResponseV2;
function IssueV3(URL, Token, XML: String; Base64: Boolean = False): TStampResponseV3;
function IssueV4(URL, Token, XML: String; Base64: Boolean = False): TStampResponseV4;

implementation

function IssueV1(URL, Token, XML: String; Base64 : Boolean): TStampResponseV1;
begin
  Result := StampResponseV1.TStampResponseV1.FromJsonString
    (StampReq(URL, Token, XML, '/cfdi33/issue/v1/', Base64));
end;

function IssueV2(URL, Token, XML: String; Base64 : Boolean): TStampResponseV2;
begin
  Result := StampResponseV2.TStampResponseV2.FromJsonString
    (StampReq(URL, Token, XML, '/cfdi33/issue/v2/', Base64));
end;

function IssueV3(URL, Token, XML: String; Base64 : Boolean): TStampResponseV3;
begin
  Result := StampResponseV3.TStampResponseV3.FromJsonString
    (StampReq(URL, Token, XML, '/cfdi33/issue/v3/', Base64));
end;

function IssueV4(URL, Token, XML: String; Base64 : Boolean): TStampResponseV4;
begin
  Result := StampResponseV4.TStampResponseV4.FromJsonString
    (StampReq(URL, Token, XML, '/cfdi33/issue/v4/', Base64));
end;

end.
