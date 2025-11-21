unit CancelationResponse;

interface

uses
  System.SysUtils, System.Classes, System.JSON, REST.JSON,
  System.Generics.Collections;

type
  // Clase de data
  TDataClass = class
  private
    FAcuse: string;
    FUuidList: TDictionary<string, string>;
  public
    property acuse: string read FAcuse write FAcuse;
    property uuidList: TDictionary<string, string> read FUuidList;

    constructor Create;
    destructor Destroy; override;

    function ToJsonString: string;
  end;

  // Clase principal
  TCancelationResponse = class
  private
    FData: TDataClass;
    FMessage: string;
    FMessageDetail: string;
    FStatus: string;
  public
    property data: TDataClass read FData write FData;
    property message: string read FMessage write FMessage;
    property messageDetail: string read FMessageDetail write FMessageDetail;
    property status: string read FStatus write FStatus;

    constructor Create;
    destructor Destroy; override;

    function ToJsonString: string;

    class function FromJsonString(const AJsonString: string)
      : TCancelationResponse;
    function GetStatusUuid: string;

  end;

implementation

{ TDataClass }

constructor TDataClass.Create;
begin
  inherited;
  FUuidList := TDictionary<string, string>.Create;
end;

destructor TDataClass.Destroy;
begin
  FUuidList.Free;
  inherited;
end;

function TDataClass.ToJsonString: string;
var
  Obj, UuidObj: TJSONObject;
  Pair: TPair<string, string>;
begin
  Obj := TJSONObject.Create;
  try
    Obj.AddPair('acuse', FAcuse);

    UuidObj := TJSONObject.Create;
    for Pair in FUuidList do
      UuidObj.AddPair(Pair.Key, Pair.Value);

    Obj.AddPair('uuid', UuidObj);
    Result := Obj.ToJSON;
  finally
    Obj.Free;
  end;
end;

{ TCancelationResponse }
constructor TCancelationResponse.Create;
begin
  inherited;
  FData := TDataClass.Create;
end;

destructor TCancelationResponse.Destroy;
begin
  FData.Free;
  inherited;
end;

function TCancelationResponse.ToJsonString: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

class function TCancelationResponse.FromJsonString(const AJsonString: string)
  : TCancelationResponse;
var
  Root, DataObj, UuidObj: TJSONObject;
  Pair: TJSONPair;
  JsonValue: TJSONValue;
begin
  Result := TJson.JsonToObject<TCancelationResponse>(AJsonString);

  Root := TJSONObject.ParseJSONValue(AJsonString) as TJSONObject;
  try
    if Assigned(Root) and Root.TryGetValue('data', DataObj) and
      (DataObj is TJSONObject) then
    begin
      if DataObj.TryGetValue('uuid', JsonValue) and (JsonValue is TJSONObject)
      then
      begin
        UuidObj := JsonValue as TJSONObject;
        for Pair in UuidObj do
          Result.FData.FUuidList.Add(Pair.JsonString.Value,
            Pair.JsonValue.Value);
      end;
    end;
  finally
    Root.Free;
  end;
end;

function TCancelationResponse.GetStatusUuid: string;
var
  Obj: TJSONObject;
  Pair: TPair<string, string>;
begin
  Obj := TJSONObject.Create;
  try
    for Pair in FData.FUuidList do
      Obj.AddPair(Pair.Key, Pair.Value);
    Result := Obj.ToJSON;
  finally
    Obj.Free;
  end;
end;

end.
