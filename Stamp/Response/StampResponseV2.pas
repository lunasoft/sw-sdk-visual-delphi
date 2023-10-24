unit StampResponseV2;

interface

uses Generics.Collections, Rest.Json;

type

TDataClass = class
private
  FCfdi: String;
  FTfd: String;
public
  property cfdi: String read FCfdi write FCfdi;
  property tfd: String read FTfd write FTfd;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TDataClass;
end;

TStampResponseV2 = class
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
  class function FromJsonString(AJsonString: string): TStampResponseV2;
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

{TStampResponseV2}

constructor TStampResponseV2.Create;
begin
  inherited;
  FData := TDataClass.Create();
end;

destructor TStampResponseV2.Destroy;
begin
  FData.free;
  inherited;
end;

function TStampResponseV2.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TStampResponseV2.FromJsonString(AJsonString: string): TStampResponseV2;
begin
  result := TJson.JsonToObject<TStampResponseV2>(AJsonString)
end;

end.

