unit CancelationPendingsResponse;

interface

uses Generics.Collections, Rest.Json;

type

TDataClass = class
private
  FCodEstatus: String;
  FUUID: TArray<String>;
public
  property CodEstatus: String read FCodEstatus write FCodEstatus;
  property UUID: TArray<String> read FUUID write FUUID;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TDataClass;
end;

TCancelationPendingsResponse = class
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
  class function FromJsonString(AJsonString: string): TCancelationPendingsResponse;
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

{TCancelationPendingsResponse}

constructor TCancelationPendingsResponse.Create;
begin
  inherited;
  FData := TDataClass.Create();
end;

destructor TCancelationPendingsResponse.Destroy;
begin
  FData.free;
  inherited;
end;

function TCancelationPendingsResponse.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TCancelationPendingsResponse.FromJsonString(AJsonString: string): TCancelationPendingsResponse;
begin
  result := TJson.JsonToObject<TCancelationPendingsResponse>(AJsonString)
end;

end.
