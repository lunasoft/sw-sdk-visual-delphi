unit BalanceResponse;

interface

uses Generics.Collections, Rest.Json;

type

	TDataClass = class
  private
		FidSaldoCliente: String;
		FidClienteUsuario: String;
		FsaldoTimbres: Integer;
		FtimbresUtilizados: Integer;
		FfechaExpiracion: String;
		Funlimited: Boolean;
		FtimbresAsignados: Integer;
	public
		property idSaldoCliente: String read FidSaldoCliente write FidSaldoCliente;
		property idClienteUsuario: String read FidClienteUsuario write FidClienteUsuario;
		property saldoTimbres: Integer read FsaldoTimbres write FsaldoTimbres;
		property timbresUtilizados: Integer read FtimbresUtilizados write FtimbresUtilizados;
		property fechaExpiracion: String read FfechaExpiracion write FfechaExpiracion;
		property unlimited: Boolean read Funlimited write Funlimited;
		property timbresAsignados: Integer read FtimbresAsignados write FtimbresAsignados;
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
		FStatus: String;
	public
		property data: TDataClass read FData write FData;
		property message: String read FMessage write FMessage;
		property messageDetail: String read FMessageDetail write FMessageDetail;
		property status: String read FStatus write FStatus;
    constructor Create;
    destructor Destroy; override;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TBalanceResponse;
  end;

implementation

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
