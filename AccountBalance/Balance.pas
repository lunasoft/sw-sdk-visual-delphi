unit Balance;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.JSON,
  System.JSON.Builders,
  System.JSON.Writers,
  System.JSON.Readers,
  System.JSON.BSON,
  IdHTTP, IdGlobal,
  IdCoder,
  IdCoder3to4,
  IdCoderMIME,
  IdMultipartFormData,
  IdGlobalProtocols,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  IPPeerClient,
  Vcl.StdCtrls,
  REST.Client,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  REST.Types,
  Datasnap.DSClientRest,
  Vcl.ComCtrls,
	BalanceRequest,
	BalanceResponse;

function AccountBalance(URL, Token: String): TBalanceResponse;

implementation

function AccountBalance(URL, Token: String): TBalanceResponse;
begin
	Result := TBalanceResponse.FromJsonString
		((GetBalance(URL, Token)));
end;

end.
