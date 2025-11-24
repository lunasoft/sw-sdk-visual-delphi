unit Validation;

interface

uses
	ValidateCfdiResponse;

function ValidateCFDI(Url, Token, XML: String): TValidateCfdiResponse;

implementation

uses
	ValidateRequest;

function ValidateCFDI(Url, Token, XML: String): TValidateCfdiResponse;
begin
  Result := TValidateCfdiResponse.FromJsonString(ValidateCfdiRequest(Url,
    Token, XML));
end;

end.
