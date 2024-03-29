unit StampResponseV4;

interface

uses Generics.Collections, Rest.Json;

type

TDataClass = class
private
  FCadenaOriginalSAT: String;
  FCfdi: String;
  FFechaTimbrado: TDateTime;
  FNoCertificadoCFDI: String;
  FNoCertificadoSAT: String;
  FQrCode: String;
  FSelloCFDI: String;
  FSelloSAT: String;
	FUuid: String;
	FStatus: String;
public
  property cadenaOriginalSAT: String read FCadenaOriginalSAT write FCadenaOriginalSAT;
  property cfdi: String read FCfdi write FCfdi;
  property fechaTimbrado: TDateTime read FFechaTimbrado write FFechaTimbrado;
  property noCertificadoCFDI: String read FNoCertificadoCFDI write FNoCertificadoCFDI;
  property noCertificadoSAT: String read FNoCertificadoSAT write FNoCertificadoSAT;
  property qrCode: String read FQrCode write FQrCode;
  property selloCFDI: String read FSelloCFDI write FSelloCFDI;
  property selloSAT: String read FSelloSAT write FSelloSAT;
	property uuid: String read FUuid write FUuid;
	property status: String read FStatus write FStatus;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TDataClass;
end;

TStampResponseV4 = class
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
  class function FromJsonString(AJsonString: string): TStampResponseV4;
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

{TStampResponseV4}

constructor TStampResponseV4.Create;
begin
  inherited;
  FData := TDataClass.Create();
end;

destructor TStampResponseV4.Destroy;
begin
  FData.free;
  inherited;
end;

function TStampResponseV4.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TStampResponseV4.FromJsonString(AJsonString: string): TStampResponseV4;
begin
  result := TJson.JsonToObject<TStampResponseV4>(AJsonString)
end;

end.

