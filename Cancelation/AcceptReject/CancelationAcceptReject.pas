unit CancelationAcceptReject;

interface

uses
  CancelationRelationsResponse,
  CancelationAcceptRejectResponse;

function CancelationAcceptRejectByCsd(URL, Token, RFCEmisor, Uuid, Accion,
	b64Key, b64Cer, PasswordKey: String): TCancelationAcceptRejectResponse;
function CancelationAcceptRejectByPfx(URL, Token, RFCEmisor, Uuid, Accion,
  b64Pfx, PasswordKey: String): TCancelationAcceptRejectResponse;
function CancelationAcceptRejectByXml(URL, Token, XML: String): TCancelationAcceptRejectResponse;
function CancelationAcceptRejectByUuid(URL, Token, RFCEmisor, Uuid, Accion: String): TCancelationAcceptRejectResponse;

implementation

uses
  StampRequest,
  CancelationResponse,
  CancelationRequest;

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
