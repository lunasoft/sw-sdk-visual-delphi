unit UnitTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, SWSDK,  StrUtils, EncdDecd, System.JSON,
  System.JSON.Builders, System.JSON.Writers, System.JSON.Readers, System.JSON.BSON;

type
  TSW_Test = class(TForm)
    Token_Generado: TMemo;
    User: TEdit;
    Password: TEdit;
    Generar_Token: TButton;
    ValidateLCO: TButton;
    ValidarLRFC: TButton;
    Lco_In: TEdit;
    Lrfc_In: TEdit;
    Lco_Out: TMemo;
    Url: TEdit;
    Abrir_PFX: TButton;
    Abrir_Cer: TButton;
    Abrir_Key: TButton;
    PFX_In: TMemo;
    CER_In: TMemo;
    Key_In: TMemo;
    Password_csd: TEdit;
    StaticText2: TStaticText;
    UUID: TEdit;
    StaticText3: TStaticText;
    RfcEmisor: TEdit;
    StaticText4: TStaticText;
    OpenDialog1: TOpenDialog;
    BCancelCSD: TButton;
    BCancelPFX: TButton;
    BCancelXML: TButton;
    BCancelUUID: TButton;
    text_In: TMemo;
    StaticText1: TStaticText;
    BTimbrar: TButton;
    BTimbrarByEmision: TButton;
    BTimbrarByJson: TButton;
    BValidarXml: TButton;
    txt_Out: TMemo;
    StaticText5: TStaticText;
    BEstadoCuenta: TButton;
    BOpenFile: TButton;
    procedure Generar_TokenClick(Sender: TObject);
    procedure ValidateLCOClick(Sender: TObject);
    procedure ValidarLRFCClick(Sender: TObject);
    procedure Abrir_PFXClick(Sender: TObject);
    procedure Abrir_CerClick(Sender: TObject);
    procedure Abrir_KeyClick(Sender: TObject);
    procedure BEstadoCuentaClick(Sender: TObject);
    procedure BCancelCSDClick(Sender: TObject);
    procedure BCancelPFXClick(Sender: TObject);
    procedure BCancelXMLClick(Sender: TObject);
    procedure BCancelUUIDClick(Sender: TObject);
    procedure BTimbrarClick(Sender: TObject);
    procedure BTimbrarByEmisionClick(Sender: TObject);
    procedure BTimbrarByJsonClick(Sender: TObject);
    procedure BValidarXmlClick(Sender: TObject);
    procedure BOpenFileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SW_Test: TSW_Test;

implementation

{$R *.dfm}

procedure TSW_Test.Abrir_CerClick(Sender: TObject);
var
  stream: TMemoryStream;
begin

  OpenDialog1.Filter := 'Archivos CER (*.CER)|*.CER|';
  stream := TMemoryStream.Create;

  if OpenDialog1.Execute then
    if FileExists(OpenDialog1.FileName) then
      stream.LoadFromFile(OpenDialog1.FileName)
    else
      raise Exception.Create('File does not exist.');
    CER_In.Text := EncodeBase64(stream.Memory, stream.Size)
end;

procedure TSW_Test.Abrir_KeyClick(Sender: TObject);
var
  stream: TMemoryStream;
begin

  OpenDialog1.Filter := 'Archivos KEY (*.KEY)|*.KEY|';
  stream := TMemoryStream.Create;

  if OpenDialog1.Execute then
    if FileExists(OpenDialog1.FileName) then
      stream.LoadFromFile(OpenDialog1.FileName)
    else
      raise Exception.Create('File does not exist.');
    KEY_In.Text := EncodeBase64(stream.Memory, stream.Size)
end;

procedure TSW_Test.Abrir_PFXClick(Sender: TObject);
var
  stream: TMemoryStream;
begin

  OpenDialog1.Filter := 'Archivos PFX (*.PFX)|*.PFX|';
  stream := TMemoryStream.Create;

  if OpenDialog1.Execute then
    if FileExists(OpenDialog1.FileName) then
      stream.LoadFromFile(OpenDialog1.FileName)
    else
      raise Exception.Create('File does not exist.');
    PFX_In.Text := EncodeBase64(stream.Memory, stream.Size)
end;

procedure TSW_Test.BCancelCSDClick(Sender: TObject);
var
Resultado :String;
begin
  Resultado:= CancelationByCSD(URL.Text, Token_Generado.Text, CER_In.Text, KEY_In.Text, RFCEmisor.Text, password_csd.Text, UUID.Text);
  txt_Out.Text:=UTF8Decode(Resultado);
end;

procedure TSW_Test.BCancelPFXClick(Sender: TObject);
var
Resultado :String;
begin
  Resultado:= CancelationByPFX(URL.Text, Token_Generado.Text, PFX_In.Text, RFCEmisor.Text, password_csd.Text, UUID.Text);
  txt_Out.Text:=UTF8Decode(Resultado);
end;

procedure TSW_Test.BCancelUUIDClick(Sender: TObject);
var
Resultado :String;
begin
  Resultado:= CancelationByUUID(URL.Text, Token_Generado.Text, RFCEmisor.Text, UUID.Text);
  txt_Out.Text:=UTF8Decode(Resultado);
end;

procedure TSW_Test.BCancelXMLClick(Sender: TObject);
var
  Resultado: String;
begin
  Resultado := CancelationByXML(URL.Text, Token_Generado.Text, text_In.Text);
  txt_Out.Text :=  UTF8Decode(Resultado);
end;

procedure TSW_Test.BEstadoCuentaClick(Sender: TObject);
var
  Resultado: String;
begin
  Resultado := AccountBalance(URL.Text, Token_Generado.Text);
  txt_Out.Text :=  UTF8Decode(Resultado);
end;

procedure TSW_Test.BOpenFileClick(Sender: TObject);
var
  stream: TMemoryStream;
begin

  OpenDialog1.Filter := 'Todos los Archivos (*.*)|*.*|';
  stream := TMemoryStream.Create;

  if OpenDialog1.Execute then
    if FileExists(OpenDialog1.FileName) then
      stream.LoadFromFile(OpenDialog1.FileName)
    else
      raise Exception.Create('File does not exist.');
    text_In.Lines.LoadFromFile(OpenDialog1.Filename);
end;

procedure TSW_Test.BTimbrarByEmisionClick(Sender: TObject);
var
  Resultado: String;
begin
  Resultado := IssueService(URL.Text, Token_Generado.Text, text_In.Text, 'v4', false);
  txt_Out.Text :=  UTF8Decode(Resultado);
end;

procedure TSW_Test.BTimbrarByJsonClick(Sender: TObject);
var
  Resultado: String;
begin
  Resultado := IssueServiceJSON(URL.Text, Token_Generado.Text, text_In.Text, 'v4');
  txt_Out.Text :=  UTF8Decode(Resultado);
end;

procedure TSW_Test.BTimbrarClick(Sender: TObject);
var
  Resultado: String;
begin
  Resultado := StampService(URL.Text, Token_Generado.Text, text_In.Text, 'v4', false);
  txt_Out.Text :=  UTF8Decode(Resultado);
end;

procedure TSW_Test.BValidarXmlClick(Sender: TObject);
var
  Resultado: String;
begin
  Resultado := ValidateXML(URL.Text, Token_Generado.Text, text_In.Text);
  txt_Out.Text :=  UTF8Decode(Resultado);
end;

procedure TSW_Test.Generar_TokenClick(Sender: TObject);
var
resultado, usuario, contrasena, sToken, direccion: String;
 jsonRequestStamp, Obj, ObjCons, ObjIpp, JSONdata: TJSONValue;
 jRespuesta: TJSONValue;
 JSonObject : TJSonObject;
 JSonValue : TJSonValue;
begin
   usuario:= User.Text;
   contrasena:= Password.Text;
   direccion:= URL.Text;
   resultado:= AuthenticationService(direccion, usuario, contrasena);

   try
  JsonValue:=JSonObject.ParseJSONValue(resultado);
  JsonValue:=(JsonValue as TJSONObject).Get('data').JSONValue;
  JsonValue:=(JsonValue as TJSONObject).Get('token').JSONValue;

  Token_Generado.text := getStringValue(JsonValue.ToString);
  except
  Token_Generado.text:=UTF8Decode(resultado);

  end;
end;

procedure TSW_Test.ValidarLRFCClick(Sender: TObject);
var
resultado: String;
begin
   resultado:= SearchByLRFC(URL.Text, Token_Generado.Text, LRFC_In.Text);
   Lco_Out.text:=UTF8Decode(resultado);
end;

procedure TSW_Test.ValidateLCOClick(Sender: TObject);
var
resultado: String;
begin
   resultado:= SearchLCOByCertificate(URL.Text, Token_Generado.Text, Lco_In.Text);
   Lco_Out.text:=UTF8Decode(resultado);
end;

end.
