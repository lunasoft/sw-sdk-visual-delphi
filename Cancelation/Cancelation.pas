unit Cancelation;

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
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  IPPeerClient,
  Vcl.StdCtrls,
  REST.Client,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  REST.Types,
  Datasnap.DSClientRest,
  Vcl.ComCtrls,
  StampRequest,
  CancelationResponse,
  CancelationRequest;

function CancelationByXml(URL, Token, XML: String): TCancelationResponse;
function CancelationByCsd(URL, Token, RFCEmisor, Uuid, b64Key, b64Cer,
  PasswordKey: String): TCancelationResponse;
function CancelationByPfx(URL, Token, RFCEmisor, Uuid, b64Pfx,
  PasswordPfx: String): TCancelationResponse;
function CancelationByUuid(URL, Token, RFCEmisor, Uuid: String)
  : TCancelationResponse;

implementation

function CancelationByXml(URL, Token, XML: String): TCancelationResponse;
begin
  Result := TCancelationResponse.FromJsonString
    ((StampReq(URL, Token, XML, '/cfdi33/cancel/xml', False)));
end;

function CancelationByCsd(URL, Token, RFCEmisor, Uuid, b64Key, b64Cer,
  PasswordKey: String): TCancelationResponse;
begin
  Result := TCancelationResponse.FromJsonString
    ((RequestJson(URL, Token, csdBody(Uuid, PasswordKey, RFCEmisor, b64Cer,
    b64Key), '/cfdi33/cancel/xml')));
end;

function CancelationByPfx(URL, Token, RFCEmisor, Uuid, b64Pfx,
  PasswordPfx: String): TCancelationResponse;
begin
  Result := TCancelationResponse.FromJsonString
    ((RequestJson(URL, Token, pfxBody(Uuid, PasswordPfx, RFCEmisor, b64Pfx),
    '/cfdi33/cancel/csd')));
end;

function CancelationByUuid(URL, Token, RFCEmisor, Uuid: String)
  : TCancelationResponse;
begin
  Result := TCancelationResponse.FromJsonString
    ((RequestURL(URL, Token, RFCEmisor, Uuid, '/cfdi33/cancel/')));
end;

end.
