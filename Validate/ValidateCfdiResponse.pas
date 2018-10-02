unit ValidateCfdiResponse;

interface

uses Generics.Collections, Rest.Json;

type

  TDetailClass_001 = class
  private
    FMessage: String;
    FMessageDetail: String;
    FType: Extended;
  public
    property message: String read FMessage write FMessage;
    property messageDetail: String read FMessageDetail write FMessageDetail;
    property &type: Extended read FType write FType;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TDetailClass_001;
  end;

  TDetailClass = class
  private
    FDetail: TArray<TDetailClass_001>;
    FSection: String;
  public
    property detail: TArray<TDetailClass_001> read FDetail write FDetail;
    property section: String read FSection write FSection;
    destructor Destroy; override;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TDetailClass;
  end;

  TValidateCfdiResponse = class
  private
    FCadenaOriginalComprobante: String;
    FDetail: TArray<TDetailClass>;
    FMessage: String;
    FMessageDetail: String;
    FStatus: String;
    FStatusCodeSat: String;
    FStatusSat: String;
    FUuid : String;
  public
    property cadenaOriginalComprobante: String read FCadenaOriginalComprobante
      write FCadenaOriginalComprobante;
    property detail: TArray<TDetailClass> read FDetail write FDetail;
    property message: String read FMessage write FMessage;
    property messageDetail: String read FMessageDetail write FMessageDetail;
    property status: String read FStatus write FStatus;
    property statusCodeSat: String read FStatusCodeSat write FStatusCodeSat;
    property statusSat: String read FStatusSat write FStatusSat;
    property uuid : String read FUuid write FUuid;
    destructor Destroy; override;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TValidateCfdiResponse;
  end;

implementation

{ TDetailClass_001 }

function TDetailClass_001.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TDetailClass_001.FromJsonString(AJsonString: string)
  : TDetailClass_001;
begin
  result := TJson.JsonToObject<TDetailClass_001>(AJsonString)
end;

{ TDetailClass }

destructor TDetailClass.Destroy;
var
  LdetailItem: TDetailClass_001;
begin

  for LdetailItem in FDetail do
    LdetailItem.free;

  inherited;
end;

function TDetailClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TDetailClass.FromJsonString(AJsonString: string): TDetailClass;
begin
  result := TJson.JsonToObject<TDetailClass>(AJsonString)
end;

{ TValidateCfdiResponse }

destructor TValidateCfdiResponse.Destroy;
var
  LdetailItem: TDetailClass;
begin

  for LdetailItem in FDetail do
    LdetailItem.free;

  inherited;
end;

function TValidateCfdiResponse.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TValidateCfdiResponse.FromJsonString(AJsonString: string)
  : TValidateCfdiResponse;
begin
  result := TJson.JsonToObject<TValidateCfdiResponse>(AJsonString)
end;

end.
