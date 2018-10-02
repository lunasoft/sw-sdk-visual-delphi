unit Validation;

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
  Datasnap.DSClientRest, Vcl.ComCtrls, ValidateCfdiResponse, ValidateRequest,
  ValidateLrfcResponse, ValidateLcoResponse;

function ValidateCFDI(Url, Token, XML: String): TValidateCfdiResponse;
function ValidateLrfc(Url, Token, Lrfc: String): TValidateLrfcResponse;
function ValidateLco(Url, Token, Lco: String): TValidateLcoResponse;

implementation

function ValidateCFDI(Url, Token, XML: String): TValidateCfdiResponse;
begin
  Result := TValidateCfdiResponse.FromJsonString(ValidateCfdiRequest(Url,
    Token, XML));
end;

function ValidateLrfc(Url, Token, Lrfc: String): TValidateLrfcResponse;
begin
  Result := TValidateLrfcResponse.FromJsonString(ValidateLrfcRequest(Url,
    Token, Lrfc));
end;

function ValidateLco(Url, Token, Lco: String): TValidateLcoResponse;
begin
  Result := TValidateLcoResponse.FromJsonString
    (ValidateLcoRequest(Url, Token, Lco));
end;

end.