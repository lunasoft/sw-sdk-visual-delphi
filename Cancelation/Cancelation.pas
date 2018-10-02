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
  CancelationRequest,
  CancelationRelationsResponse,
  CancelationPendingsResponse;

// Cancelaci�n
function CancelationByXml(URL, Token, XML: String): TCancelationResponse;
function CancelationByCsd(URL, Token, RFCEmisor, Uuid, b64Key, b64Cer,
  PasswordKey: String): TCancelationResponse;
function CancelationByPfx(URL, Token, RFCEmisor, Uuid, b64Pfx,
  PasswordPfx: String): TCancelationResponse;
function CancelationByUuid(URL, Token, RFCEmisor, Uuid: String)
  : TCancelationResponse;

/// Consulta de relacionados
function CancelationRelationsByXml(URL, Token, XML: String)
  : TCancelationRelationsResponse;
function CancelationRelationsByPfx(URL, Token, RFCEmisor, Uuid, b64Pfx,
  PasswordKey: String): TCancelationRelationsResponse;
function CancelationRelationsByCsd(URL, Token, RFCEmisor, Uuid, b64Key, b64Cer,
  PasswordKey: String): TCancelationRelationsResponse;
function CancelationRelationsByUuid(URL, Token, RFCEmisor, Uuid: String)
  : TCancelationRelationsResponse;

/// Aceptaci�n Rechazo
function CancelationAcceptRejectByCsd(URL, Token, RFCEmisor, Uuid, Accion,
  b64Key, b64Cer, PasswordKey: String): TCancelationRelationsResponse;
function CancelationAcceptRejectByPfx(URL, Token, RFCEmisor, Uuid, Accion,
  b64Key, b64Cer, PasswordKey: String): TCancelationRelationsResponse;
function CancelationAcceptRejectByXml(URL, Token, RFCEmisor, Uuid, Accion,
  b64Key, b64Cer, PasswordKey: String): TCancelationRelationsResponse;
function CancelationAcceptRejectByUuid(URL, Token, RFCEmisor, Uuid, Accion,
  b64Key, b64Cer, PasswordKey: String): TCancelationRelationsResponse;

/// Pendientes
function CancelationPendings(URL, Token, RFCEmisor: String)
  : TCancelationPendingsResponse;

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

function CancelationRelationsByCsd(URL, Token, RFCEmisor, Uuid, b64Key, b64Cer,
  PasswordKey: String): TCancelationRelationsResponse;
begin
  Result := TCancelationRelationsResponse.FromJsonString
    (RequestJson(URL, Token, csdBody(Uuid, PasswordKey, RFCEmisor, b64Cer,
    b64Key), '/relations/csd'));
end;

function CancelationRelationsByXml(URL, Token, XML: String)
  : TCancelationRelationsResponse;
begin
  Result := TCancelationRelationsResponse.FromJsonString
    ((StampReq(URL, Token, XML, '/relations/xml', False)));
end;

function CancelationRelationsByPfx(URL, Token, RFCEmisor, Uuid, b64Pfx,
  PasswordKey: String): TCancelationRelationsResponse;
begin
  Result := TCancelationRelationsResponse.FromJsonString
    (RequestJson(URL, Token, pfxBody(Uuid, PasswordKey, RFCEmisor, b64Pfx),
    '/relations/pfx'));
end;

function CancelationRelationsByUuid(URL, Token, RFCEmisor, Uuid: String)
  : TCancelationRelationsResponse;
begin
  Result := TCancelationRelationsResponse.FromJsonString
    ((RequestURL(URL, Token, RFCEmisor, Uuid, '/relations/')));
end;

function CancelationAcceptRejectByCsd(URL, Token, RFCEmisor, Uuid, Accion,
  b64Key, b64Cer, PasswordKey: String): TCancelationRelationsResponse;
begin
  Result := TCancelationRelationsResponse.FromJsonString
    (RequestJson(URL, Token, csdsBody(Uuid, Accion, PasswordKey, RFCEmisor,
    b64Cer, b64Key), '/acceptreject/csd'));
end;

function CancelationAcceptRejectByByXml(URL, Token, XML: String)
  : TCancelationRelationsResponse;
begin
  Result := TCancelationRelationsResponse.FromJsonString
    ((StampReq(URL, Token, XML, '/acceptreject/xml', False)));
end;

function CancelationAcceptRejectByPfx(URL, Token, RFCEmisor, Uuid, Accion,
  b64Key, b64Cer, PasswordKey: String): TCancelationRelationsResponse;
begin
  Result := TCancelationRelationsResponse.FromJsonString
    (RequestJson(URL, Token, csdsBody(Uuid, Accion, PasswordKey, RFCEmisor,
    b64Cer, b64Key), '/acceptreject/pfx'));
end;

function CancelationAcceptRejectByUuid(URL, Token, RFCEmisor, Uuid, Accion,
  b64Key, b64Cer, PasswordKey: String): TCancelationRelationsResponse;
begin
  Result := TCancelationRelationsResponse.FromJsonString
    ((RequestURL(URL, Token, RFCEmisor, Uuid + '/' + Accion,
    '/acceptreject/')));
end;

function CancelationPendings(URL, Token, RFCEmisor: String)
  : TCancelationPendingsResponse;
begin
  Result := TCancelationPendingsResponse.FromJsonString
    ((RequestURLGet(URL, Token, RFCEmisor, '/pendings/')));
end;

end.