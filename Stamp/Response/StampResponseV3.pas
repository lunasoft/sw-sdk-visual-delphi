unit StampResponseV3;

interface

uses Generics.Collections, Rest.Json;

type

TDataClass = class
private
  FCfdi: String;
public
  property cfdi: String read FCfdi write FCfdi;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TDataClass;
end;

TStampResponseV3 = class
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
  class function FromJsonString(AJsonString: string): TStampResponseV3;
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

{TStampResponseV3}

constructor TStampResponseV3.Create;
begin
  inherited;
  FData := TDataClass.Create();
end;

destructor TStampResponseV3.Destroy;
begin
  FData.free;
  inherited;
end;

function TStampResponseV3.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TStampResponseV3.FromJsonString(AJsonString: string): TStampResponseV3;
begin
  result := TJson.JsonToObject<TStampResponseV3>(AJsonString)
end;

end.

