unit CancelationRelationsResponse;

interface

uses Generics.Collections, Rest.Json;

type

TUuidsRelacionadosHijosClass = class
private
  FRfcEmisor: String;
  FRfcReceptor: String;
  FUuid: String;
public
  property rfcEmisor: String read FRfcEmisor write FRfcEmisor;
  property rfcReceptor: String read FRfcReceptor write FRfcReceptor;
  property uuid: String read FUuid write FUuid;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TUuidsRelacionadosHijosClass;
end;

TUuidsRelacionadosPadresClass = class
private
  FRfcEmisor: String;
  FRfcReceptor: String;
	FUuid: String;
	FStatus: String;
public
	property rfcEmisor: String read FRfcEmisor write FRfcEmisor;
	property rfcReceptor: String read FRfcReceptor write FRfcReceptor;
	property uuid: String read FUuid write FUuid;
	property status: String read FStatus write FStatus;
	function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TUuidsRelacionadosPadresClass;
end;

TDataClass = class
private
  FResultado: String;
  FUuidConsultado: String;
  FUuidsRelacionadosHijos: TArray<TUuidsRelacionadosHijosClass>;
  FUuidsRelacionadosPadres: TArray<TUuidsRelacionadosPadresClass>;
public
  property resultado: String read FResultado write FResultado;
  property uuidConsultado: String read FUuidConsultado write FUuidConsultado;
  property uuidsRelacionadosHijos: TArray<TUuidsRelacionadosHijosClass> read FUuidsRelacionadosHijos write FUuidsRelacionadosHijos;
  property uuidsRelacionadosPadres: TArray<TUuidsRelacionadosPadresClass> read FUuidsRelacionadosPadres write FUuidsRelacionadosPadres;
  destructor Destroy; override;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TDataClass;
end;

TCancelationRelationsResponse = class
private
  FCodStatus: String;
  FData: TDataClass;
  FMessage: String;
  FMessageDetail: String;
  FStatus: String;
public
  property codStatus: String read FCodStatus write FCodStatus;
  property data: TDataClass read FData write FData;
  property message: String read FMessage write FMessage;
  property messageDetail: String read FMessageDetail write FMessageDetail;
  property status: String read FStatus write FStatus;
  constructor Create;
  destructor Destroy; override;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TCancelationRelationsResponse;
end;

implementation

{TUuidsRelacionadosHijosClass}


function TUuidsRelacionadosHijosClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TUuidsRelacionadosHijosClass.FromJsonString(AJsonString: string): TUuidsRelacionadosHijosClass;
begin
  result := TJson.JsonToObject<TUuidsRelacionadosHijosClass>(AJsonString)
end;

{TUuidsRelacionadosPadresClass}


function TUuidsRelacionadosPadresClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TUuidsRelacionadosPadresClass.FromJsonString(AJsonString: string): TUuidsRelacionadosPadresClass;
begin
  result := TJson.JsonToObject<TUuidsRelacionadosPadresClass>(AJsonString)
end;

{TDataClass}

destructor TDataClass.Destroy;
var
  LuuidsRelacionadosPadresItem: TUuidsRelacionadosPadresClass;
  LuuidsRelacionadosHijosItem: TUuidsRelacionadosHijosClass;
begin

 for LuuidsRelacionadosPadresItem in FUuidsRelacionadosPadres do
   LuuidsRelacionadosPadresItem.free;
 for LuuidsRelacionadosHijosItem in FUuidsRelacionadosHijos do
   LuuidsRelacionadosHijosItem.free;

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

{TCancelationRelationsResponse}

constructor TCancelationRelationsResponse.Create;
begin
  inherited;
  FData := TDataClass.Create();
end;

destructor TCancelationRelationsResponse.Destroy;
begin
  FData.free;
  inherited;
end;

function TCancelationRelationsResponse.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TCancelationRelationsResponse.FromJsonString(AJsonString: string): TCancelationRelationsResponse;
begin
  result := TJson.JsonToObject<TCancelationRelationsResponse>(AJsonString)
end;

end.

