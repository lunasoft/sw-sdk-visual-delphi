unit CancelationResponse;

interface

uses Generics.Collections, Rest.Json;

type

  TUuidClass = class
  private
    FLista: String;
  public
    property uuid: String read FLista write FLista;
    function ToJsonString: String;
    class function FromJsonString(AJsonString: string): TUuidClass;
  end;

  TDataClass = class
  private
    FAcuse: String;
    FUuid: TUuidClass;
  public
    property acuse: String read FAcuse write FAcuse;
    property uuid: TUuidClass read FUuid write FUuid;
    constructor Create;
    destructor Destroy; override;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TDataClass;
  end;

  TCancelationResponse = class
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
    class function FromJsonString(AJsonString: string): TCancelationResponse;
  end;

implementation

{ TUuidClass }

function TUuidClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TUuidClass.FromJsonString(AJsonString: string): TUuidClass;
begin
  result := TJson.JsonToObject<TUuidClass>(AJsonString)
end;

{ TDataClass }

constructor TDataClass.Create;
begin
  inherited;
  FUuid := TUuidClass.Create();
end;

destructor TDataClass.Destroy;
begin
  FUuid.free;
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

{ TCancelationResponse }

constructor TCancelationResponse.Create;
begin
  inherited;
  FData := TDataClass.Create();
end;

destructor TCancelationResponse.Destroy;
begin
  FData.free;
  inherited;
end;

function TCancelationResponse.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TCancelationResponse.FromJsonString(AJsonString: string)
  : TCancelationResponse;
begin
  result := TJson.JsonToObject<TCancelationResponse>(AJsonString)
end;

end.
