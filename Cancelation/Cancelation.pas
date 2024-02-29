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
  Vcl.ComCtrls,
  StampRequest,
  CancelationResponse,
  CancelationRequest;

function CancelationByXml(url, token, xml: String): TCancelationResponse;
function CancelationByCsd(url, token, rfcEmisor, uuid, motivo, folioSustitucion,
 b64Cer, b64Key, passwordKey: String): TCancelationResponse;
function CancelationByPfx(url, token, rfcEmisor, uuid, motivo, folioSustitucion, b64Pfx,
  passwordPfx: String): TCancelationResponse;
function CancelationByUuid(url, token, rfcEmisor, uuid, motivo, folioSustitucion: String)
  : TCancelationResponse;

implementation

function CancelationByXml(url, token, xml: String): TCancelationResponse;
begin
  Result := TCancelationResponse.FromJsonString
    ((StampReq(url, token, xml, '/cfdi33/cancel/xml', False)));
end;

function CancelationByCsd(url, token, rfcEmisor, uuid, motivo, folioSustitucion,
 b64Cer, b64Key, passwordKey: String): TCancelationResponse;
begin
  Result := TCancelationResponse.FromJsonString
    ((RequestJson(url, token, csdBody(uuid, passwordKey, rfcEmisor, motivo,
    folioSustitucion, b64Cer, b64Key), '/cfdi33/cancel/csd')));
end;

function CancelationByPfx(url, token, rfcEmisor, uuid, motivo, folioSustitucion,
  b64Pfx, passwordPfx: String): TCancelationResponse;
begin
  Result := TCancelationResponse.FromJsonString
    ((RequestJson(url, token, pfxBody(uuid, passwordPfx, rfcEmisor, motivo,
    folioSustitucion, b64Pfx), '/cfdi33/cancel/pfx')));
end;

function CancelationByUuid(url, token, rfcEmisor, uuid, motivo, folioSustitucion: String)
  : TCancelationResponse;
begin
  Result := TCancelationResponse.FromJsonString
    ((RequestURL(url, token, rfcEmisor, uuid, motivo, folioSustitucion, '/cfdi33/cancel/')));
end;

end.
