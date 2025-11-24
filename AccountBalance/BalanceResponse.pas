unit BalanceResponse;

interface

type

	TDataClass = class
  private
		FidUserBalance: String;
		FidUser: String;
		FstampsBalance: Integer;
		FstampsUsed: Integer;
		FstampsAssigned: Integer;
		FisUnlimited: Boolean;
		FexpirationDate: String;
	public
		property idUserBalance: String read FidUserBalance write FidUserBalance;
		property idUser: String read FidUser write FidUser;
		property stampsBalance: Integer read FstampsBalance write FstampsBalance;
		property stampsUsed: Integer read FstampsUsed write FstampsUsed;
		property stampsAssigned: Integer read FstampsAssigned write FstampsAssigned;
		property isUnlimited: Boolean read FisUnlimited write FisUnlimited;
		property expirationDate: String read FexpirationDate write FexpirationDate;
    constructor Create;
    destructor Destroy; override;
		function ToJsonString: string;
		class function FromJsonString(AJsonString: string): TDataClass;
	end;

	TBalanceResponse = class
  private
		FData: TDataClass;
    FMessage: String;
    FMessageDetail: String;
		FMeta: String;
		FLinks: String;
		FStatus: String;
	public
		property data: TDataClass read FData write FData;
    property message: String read FMessage write FMessage;
    property messageDetail: String read FMessageDetail write FMessageDetail;
		property meta: String read FMeta write FMeta;
		property links: String read FLinks write FLinks;
		property status: String read FStatus write FStatus;
    constructor Create;
    destructor Destroy; override;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TBalanceResponse;
  end;

implementation

uses
	Generics.Collections,
  Rest.Json;

{ TDataClass }

constructor TDataClass.Create;
begin
end;

destructor TDataClass.Destroy;
begin
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

{ TBalanceResponse }

constructor TBalanceResponse.Create;
begin
  inherited;
  FData := TDataClass.Create();
end;

destructor TBalanceResponse.Destroy;
begin
  FData.free;
  inherited;
end;

function TBalanceResponse.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TBalanceResponse.FromJsonString(AJsonString: string)
	: TBalanceResponse;
begin
	result := TJson.JsonToObject<TBalanceResponse>(AJsonString)
end;

end.
