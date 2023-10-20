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
  Vcl.ComCtrls, ValidateCfdiResponse, ValidateRequest;

function ValidateCFDI(Url, Token, XML: String): TValidateCfdiResponse;

implementation

function ValidateCFDI(Url, Token, XML: String): TValidateCfdiResponse;
begin
  Result := TValidateCfdiResponse.FromJsonString(ValidateCfdiRequest(Url,
    Token, XML));
end;

end.
