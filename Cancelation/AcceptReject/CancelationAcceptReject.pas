unit CancelationAcceptReject;

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
  CancelationAcceptRejectResponse;

function CancelationAcceptRejectByCsd(URL, Token, RFCEmisor, Uuid, Accion,
	b64Key, b64Cer, PasswordKey: String): TCancelationAcceptRejectResponse;
function CancelationAcceptRejectByPfx(URL, Token, RFCEmisor, Uuid, Accion,
  b64Pfx, PasswordKey: String): TCancelationAcceptRejectResponse;
function CancelationAcceptRejectByXml(URL, Token, XML: String): TCancelationAcceptRejectResponse;
function CancelationAcceptRejectByUuid(URL, Token, RFCEmisor, Uuid, Accion: String): TCancelationAcceptRejectResponse;

implementation

function CancelationAcceptRejectByCsd(URL, Token, RFCEmisor, Uuid, Accion,
  b64Key, b64Cer, PasswordKey: String): TCancelationAcceptRejectResponse;
begin
  Result := TCancelationAcceptRejectResponse.FromJsonString
    (RequestJson(URL, Token, csdsBody(Uuid, Accion, PasswordKey, RFCEmisor,
    b64Cer, b64Key), '/acceptreject/csd'));
end;

function CancelationAcceptRejectByXml(URL, Token, XML: String)
  : TCancelationAcceptRejectResponse;
begin
  Result := TCancelationAcceptRejectResponse.FromJsonString
    ((StampReq(URL, Token, XML, '/acceptreject/xml', False)));
end;

function CancelationAcceptRejectByPfx(URL, Token, RFCEmisor, Uuid, Accion,
  b64Pfx, PasswordKey: String): TCancelationAcceptRejectResponse;
begin
  Result := TCancelationAcceptRejectResponse.FromJsonString
		(RequestJson(URL, Token, pfxsBody(Uuid, Accion, PasswordKey, RFCEmisor,
		b64Pfx), '/acceptreject/pfx'));
end;

function CancelationAcceptRejectByUuid(URL, Token, RFCEmisor, Uuid, Accion : String): TCancelationAcceptRejectResponse;
begin
  Result := TCancelationAcceptRejectResponse.FromJsonString
    ((RequestURL(URL, Token, RFCEmisor, Uuid + '/' + Accion,
    '/acceptreject/')));
end;

end.
