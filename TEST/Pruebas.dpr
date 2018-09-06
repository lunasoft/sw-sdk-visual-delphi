program Pruebas;

uses
  Vcl.Forms,
  UnitTest in 'UnitTest.pas' {SW_Test},
  SWSDK in 'SWSDK.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSW_Test, SW_Test);
  Application.Run;
end.
