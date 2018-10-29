unit CancelationAcceptRejectResponse;

interface

uses Generics.Collections, Rest.Json;

type

TFoliosClass = class
private
  FEstatusUUID: String;
  FRespuesta: String;
  FUuid: String;
public
  property estatusUUID: String read FEstatusUUID write FEstatusUUID;
  property respuesta: String read FRespuesta write FRespuesta;
  property uuid: String read FUuid write FUuid;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TFoliosClass;
end;

TDataClass = class
private
  FAcuse: String;
  FFolios: TArray<TFoliosClass>;
public
  property acuse: String read FAcuse write FAcuse;
  property folios: TArray<TFoliosClass> read FFolios write FFolios;
  destructor Destroy; override;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TDataClass;
end;

TCancelationAcceptRejectResponse = class
private
  FCodStatus: String;
  FData: TDataClass;
  FMessage: String;
	FMessageDetail: String;
	FStatus : String;
public
	property codStatus: String read FCodStatus write FCodStatus;
	property data: TDataClass read FData write FData;
	property message: String read FMessage write FMessage;
	property messageDetail: String read FMessageDetail write FMessageDetail;
	property status: String read FStatus write FStatus;
  constructor Create;
  destructor Destroy; override;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TCancelationAcceptRejectResponse;
end;

implementation

{TFoliosClass}


function TFoliosClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TFoliosClass.FromJsonString(AJsonString: string): TFoliosClass;
begin
  result := TJson.JsonToObject<TFoliosClass>(AJsonString)
end;

{TDataClass}

destructor TDataClass.Destroy;
var
  LfoliosItem: TFoliosClass;
begin

 for LfoliosItem in FFolios do
   LfoliosItem.free;

  inherited;
end;

function TDataClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TDataClass.FromJsonString(AJsonString: string): TDataClass;
begin
  result := TJson.JsonToObject<TDataClass>(AJsonString)
end;

{TCancelationAcceptRejectResponse}

constructor TCancelationAcceptRejectResponse.Create;
begin
  inherited;
  FData := TDataClass.Create();
end;

destructor TCancelationAcceptRejectResponse.Destroy;
begin
  FData.free;
  inherited;
end;

function TCancelationAcceptRejectResponse.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TCancelationAcceptRejectResponse.FromJsonString(AJsonString: string): TCancelationAcceptRejectResponse;
begin
  result := TJson.JsonToObject<TCancelationAcceptRejectResponse>(AJsonString)
end;

end.

