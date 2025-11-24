unit CancelationPendings;

interface

uses
  CancelationPendingsResponse;

function CancelationPendingsService(URL, Token, RFCEmisor: String)
  : TCancelationPendingsResponse;

implementation

uses
  CancelationRequest;

function CancelationPendingsService(URL, Token, RFCEmisor: String)
  : TCancelationPendingsResponse;
begin
  Result := TCancelationPendingsResponse.FromJsonString
    ((RequestURLGet(URL, Token, RFCEmisor, '/pendings/')));
end;
end.
