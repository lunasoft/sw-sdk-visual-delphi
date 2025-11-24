unit Authentication;

interface

uses
	System.Classes,
  AuthenticationResponse;

function AuthenticationService(URL, User, Password: String): TResponse;

implementation

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
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
  IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Types,
  Vcl.ComCtrls, Helper, AuthenticationRequest;

function AuthenticationService(URL, User, Password: String): TResponse;
begin
  Result := AuthenticationResponse.TResponse.FromJsonString
    (AuthenticationRequest.AuthRequest(URL, User, Password));
end;

end.
