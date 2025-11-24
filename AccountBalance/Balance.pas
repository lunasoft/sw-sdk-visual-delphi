unit Balance;

interface

uses
	BalanceResponse;

function AccountBalance(URL, Token: String): TBalanceResponse;

implementation

uses
	BalanceRequest;

function AccountBalance(URL, Token: String): TBalanceResponse;
begin
	Result := TBalanceResponse.FromJsonString
		((GetBalance(URL, Token)));
end;

end.
