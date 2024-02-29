unit CancelationRelations;

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
  CancelationRequest,
  CancelationRelationsResponse;

function CancelationRelationsByXml(URL, Token, XML: String)
  : TCancelationRelationsResponse;
function CancelationRelationsByPfx(URL, Token, RFCEmisor, Uuid, b64Pfx,
  PasswordKey: String): TCancelationRelationsResponse;
function CancelationRelationsByCsd(URL, Token, RFCEmisor, Uuid, b64Key, b64Cer,
  PasswordKey: String): TCancelationRelationsResponse; overload;
function CancelationRelationsByUuid(URL, Token, RFCEmisor, Uuid: String)
  : TCancelationRelationsResponse;

implementation

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
    (RequestJson(URL, Token, pfxBodyRelations(Uuid, PasswordKey, RFCEmisor, b64Pfx),
    '/relations/pfx'));
end;

function CancelationRelationsByUuid(URL, Token, RFCEmisor, Uuid: String)
  : TCancelationRelationsResponse;
begin
  Result := TCancelationRelationsResponse.FromJsonString
    ((RequestURL(URL, Token, RFCEmisor, Uuid, '/relations/')));
end;

end.
