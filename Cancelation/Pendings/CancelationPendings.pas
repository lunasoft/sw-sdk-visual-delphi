unit CancelationPendings;

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
  CancelationPendingsResponse;

function CancelationPendingsService(URL, Token, RFCEmisor: String)
  : TCancelationPendingsResponse;

implementation

function CancelationPendingsService(URL, Token, RFCEmisor: String)
  : TCancelationPendingsResponse;
begin
  Result := TCancelationPendingsResponse.FromJsonString
    ((RequestURLGet(URL, Token, RFCEmisor, '/pendings/')));
end;
end.
