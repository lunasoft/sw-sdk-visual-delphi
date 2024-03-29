unit AuthenticationResponse;

interface

uses Generics.Collections, Rest.Json;

type

TData = class
private
  FExpires_in: Extended;
  FToken: String;
  FTokeny_type: String;
public
  property expires_in: Extended read FExpires_in write FExpires_in;
  property token: String read FToken write FToken;
  property tokeny_type: String read FTokeny_type write FTokeny_type;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TData;
end;

TResponse = class
private
  FData: TData;
  FMessage: String;
  FMessageDetail: String;
  FStatus: String;
public
  property data: TData read FData write FData;
  property message: String read FMessage write FMessage;
  property messageDetail: String read FMessageDetail write FMessageDetail;
  property status: String read FStatus write FStatus;
  constructor Create;
  destructor Destroy; override;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TResponse;
end;

implementation

{TData}


function TData.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TData.FromJsonString(AJsonString: string): TData;
begin
  result := TJson.JsonToObject<TData>(AJsonString)
end;

{TResponse}

constructor TResponse.Create;
begin
  inherited;
  FData := TData.Create();
end;

destructor TResponse.Destroy;
begin
  FData.free;
  inherited;
end;

function TResponse.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TResponse.FromJsonString(AJsonString: string): TResponse;
begin
  result := TJson.JsonToObject<TResponse>(AJsonString)
end;

end.

