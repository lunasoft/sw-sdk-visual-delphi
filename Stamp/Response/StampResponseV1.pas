unit StampResponseV1;

interface

uses Generics.Collections, Rest.Json;

type

TDataClass = class
private
  FTfd: String;
public
  property tfd: String read FTfd write FTfd;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TDataClass;
end;

TStampResponseV1 = class
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
  class function FromJsonString(AJsonString: string): TStampResponseV1;
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

{TStampResponseV1}

constructor TStampResponseV1.Create;
begin
  inherited;
  FData := TDataClass.Create();
end;

destructor TStampResponseV1.Destroy;
begin
  FData.free;
  inherited;
end;

function TStampResponseV1.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TStampResponseV1.FromJsonString(AJsonString: string): TStampResponseV1;
begin
  result := TJson.JsonToObject<TStampResponseV1>(AJsonString)
end;

end.

