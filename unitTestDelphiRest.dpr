program unitTestDelphiRest;

uses
  Vcl.Forms,
  TestServices in 'TestServices.pas' {Form1},
  Cancelation in 'Cancelation\Cancelation.pas',
  Helper in 'Helpers\Helper.pas',
  Stamp in 'Stamp\Stamp.pas',
  Authentication in 'Authentication\Authentication.pas',
  AuthenticationRequest in 'Authentication\AuthenticationRequest.pas',
  AuthenticationResponse in 'Authentication\AuthenticationResponse.pas',
  StampResponseV1 in 'Stamp\Response\StampResponseV1.pas',
  StampResponseV2 in 'Stamp\Response\StampResponseV2.pas',
  StampResponseV3 in 'Stamp\Response\StampResponseV3.pas',
  StampResponseV4 in 'Stamp\Response\StampResponseV4.pas',
  StampRequest in 'Stamp\StampRequest.pas',
  CancelationResponse in 'Cancelation\CancelationResponse.pas',
  CancelationRequest in 'Cancelation\CancelationRequest.pas',
  Issue in 'Issue\Issue.pas',
  Validation in 'Validate\Validation.pas',
  ValidateLcoResponse in 'Validate\ValidateLcoResponse.pas',
  ValidateLrfcResponse in 'Validate\ValidateLrfcResponse.pas',
  ValidateCfdiResponse in 'Validate\ValidateCfdiResponse.pas',
  ValidateRequest in 'Validate\ValidateRequest.pas',
  JsonIssue in 'Issue\JsonIssue\JsonIssue.pas',
  IssueJsonRequest in 'Issue\JsonIssue\IssueJsonRequest.pas',
  CancelationRelationsResponse in 'Cancelation\CancelationRelationsResponse.pas',
  CancelationPendingsResponse in 'Cancelation\CancelationPendingsResponse.pas',
  CancelationAcceptRejectResponse in 'Cancelation\CancelationAcceptRejectResponse.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
