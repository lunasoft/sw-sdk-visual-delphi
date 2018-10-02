unit ValidateLcoResponse;

interface

uses Generics.Collections, Rest.Json;

type

TDataClass = class
private
  FEstatusCertificado: String;
  FFechaFinal: TDateTime;
  FFechaInicio: TDateTime;
  FNoCertificado: String;
  FRfc: String;
  FValidezObligaciones: String;
public
  property estatusCertificado: String read FEstatusCertificado write FEstatusCertificado;
  property fechaFinal: TDateTime read FFechaFinal write FFechaFinal;
  property fechaInicio: TDateTime read FFechaInicio write FFechaInicio;
  property noCertificado: String read FNoCertificado write FNoCertificado;
  property rfc: String read FRfc write FRfc;
  property validezObligaciones: String read FValidezObligaciones write FValidezObligaciones;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TDataClass;
end;

TValidateLcoResponse = class
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
  class function FromJsonString(AJsonString: string): TValidateLcoResponse;
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

{TValidateLcoResponse}

constructor TValidateLcoResponse.Create;
begin
  inherited;
  FData := TDataClass.Create();
end;

destructor TValidateLcoResponse.Destroy;
begin
  FData.free;
  inherited;
end;

function TValidateLcoResponse.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TValidateLcoResponse.FromJsonString(AJsonString: string): TValidateLcoResponse;
begin
  result := TJson.JsonToObject<TValidateLcoResponse>(AJsonString)
end;

end.
