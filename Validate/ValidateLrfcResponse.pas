unit ValidateLrfcResponse;

interface

uses Generics.Collections, Rest.Json;

type

TDataClass = class
private
  FContribuyenteRFC: String;
  FSncf: Boolean;
  FSubcontratacion: Boolean;
public
  property contribuyenteRFC: String read FContribuyenteRFC write FContribuyenteRFC;
  property sncf: Boolean read FSncf write FSncf;
  property subcontratacion: Boolean read FSubcontratacion write FSubcontratacion;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TDataClass;
end;

TValidateLrfcResponse = class
private
  FData: TDataClass;
  FMessage: String;
  FMessageDetail: String;
  FStatus: String;
public
  property data: TDataClass read FData write FData;
  property message: String read FMessage write FMessage;
  property messageDetail: String read FMessageDetail write FMessageDetail;
  property status: String read FStatus write FStatus;
  constructor Create;
  destructor Destroy; override;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TValidateLrfcResponse;
end;

implementation

{TDataClass}


function TDataClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TDataClass.FromJsonString(AJsonString: string): TDataClass;
begin
  result := TJson.JsonToObject<TDataClass>(AJsonString)
end;

{TValidateLrfcResponse}

constructor TValidateLrfcResponse.Create;
begin
  inherited;
  FData := TDataClass.Create();
end;

destructor TValidateLrfcResponse.Destroy;
begin
  FData.free;
  inherited;
end;

function TValidateLrfcResponse.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TValidateLrfcResponse.FromJsonString(AJsonString: string): TValidateLrfcResponse;
begin
  result := TJson.JsonToObject<TValidateLrfcResponse>(AJsonString)
end;

end.

