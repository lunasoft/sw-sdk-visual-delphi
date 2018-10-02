unit TestServices;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  StrUtils,
  EncdDecd,
  System.JSON,
  System.JSON.Builders,
  System.JSON.Writers,
  System.JSON.Readers,
  System.JSON.BSON,
  Authentication,
  AuthenticationResponse,
  Stamp,
  StampResponseV1,
  StampResponseV2,
  StampResponseV3,
  StampResponseV4,
  Issue,
  Validation,
  ValidateLcoResponse,
  ValidateLrfcResponse,
  ValidateCfdiResponse,
  JsonIssue,
  Cancelation,
  CancelationResponse,
  CancelationPendings,
  CancelationPendingsResponse,
  CancelationAcceptReject,
  CancelationAcceptRejectResponse,
  CancelationRelations,
  CancelationRelationsResponse;

function fechaDeVencimiento(expiresIn: String): String;

type
  TForm1 = class(TForm)
    Autenticación: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    Label6: TLabel;
    txtUser: TEdit;
    Label4: TLabel;
    txtPassword: TEdit;
    Label5: TLabel;
    txtURL: TEdit;
    Label1: TLabel;
    txtToken: TEdit;
    Expiración: TLabel;
    txtCaducidad: TEdit;
    Label2: TLabel;
    txtTokenTipo: TEdit;
    Button1: TButton;
    stampXmlIn: TMemo;
    btnTimbrarV1: TButton;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    txtMessageAuth: TEdit;
    txtMessageDetailAuth: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    txtStatus: TEdit;
    btnTimbrarV2: TButton;
    btnTimbrarV3: TButton;
    btnTimbrarV4: TButton;
    txtMessageDetailStamp: TEdit;
    txtTfd: TEdit;
    txtMessageStamp: TEdit;
    txtCfdi: TEdit;
    txtCadenaOriginalSat: TEdit;
    txtNoCertificadoSat: TEdit;
    txtNoCertificadoCfdi: TEdit;
    txtUuid: TEdit;
    txtSelloSat: TEdit;
    txtSelloCfdi: TEdit;
    Label3: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    txtFechaTimbrado: TEdit;
    txtQrCode: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    memoJson: TMemo;
    validateCfdiMemo: TMemo;
    Memo3: TMemo;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    TFD: TLabel;
    adadsad: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label22: TLabel;
    Button8: TButton;
    txtLcoAValidar: TEdit;
    txtValidaLcoNoCertificado: TEdit;
    txtValidaLcoRfc: TEdit;
    Label23: TLabel;
    txtValidacionLcoValidezObligaciones: TEdit;
    txtValidacionLcoEstatusCertificado: TEdit;
    txtValidacionLcoFechaInicio: TEdit;
    txtValidacionLcoFechaFinal: TEdit;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    txtValidaLcoStatus: TEdit;
    txtValidaLcoMessage: TEdit;
    txtValidaLcoMessageDetail: TEdit;
    txtValidateLrfc: TEdit;
    txtValidateContribuyenteRfc: TEdit;
    txtValidateSnfc: TEdit;
    txtValidateSubcontratacion: TEdit;
    txtValidateStatus: TEdit;
    txtValidateMessage: TEdit;
    txtValidateMessageDetail: TEdit;
    Button9: TButton;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    TabCancelacion: TPageControl;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    TabSheet13: TTabSheet;
    txtValidaXmlStatus: TEdit;
    txtValidaXmlCadenaOriginalSAT: TEdit;
    txtValidaXmlCadenaOriginalComprobante: TEdit;
    txtValidaXmlUuid: TEdit;
    txtValidaXmlStatusSat: TEdit;
    txtValidaXmlStatusCodeSAT: TEdit;
    txtValidaXmlMessage: TEdit;
    txtValidaXmlMessageDetail: TEdit;
    Button10: TButton;
    Button11: TButton;
    Label11: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    txtJsonTfd: TEdit;
    txtJsonCfdi: TEdit;
    txtJsonCadenaOriginalSAT: TEdit;
    txtJsonNoCertificadoSAT: TEdit;
    txtJsonNoCertificadoCFDI: TEdit;
    txtJsonUUID: TEdit;
    txtJsonSelloSAT: TEdit;
    txtJsonSelloCFDI: TEdit;
    txtJsonFechaDeTimbrado: TEdit;
    txtJsonCodigoQr: TEdit;
    txtJsonMessage: TEdit;
    txtJsonMessageDetail: TEdit;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Cancelación: TPageControl;
    TabSheet14: TTabSheet;
    TabSheet15: TTabSheet;
    TabSheet16: TTabSheet;
    TabSheet17: TTabSheet;
    Button17: TButton;
    Button20: TButton;
    Button18: TButton;
    txtCsdCer: TMemo;
    txtCsdKey: TMemo;
    txtCsdAcuse: TMemo;
    txtCsdUuid: TEdit;
    txtCsdPassword: TEdit;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    txtCsdStatus: TEdit;
    txtCsdMessage: TEdit;
    txtCsdMessageDetail: TEdit;
    txtCsdRfcEmisor: TEdit;
    Label67: TLabel;
    txtPfxAcuse: TMemo;
    txtPfxPfx: TMemo;
    txtPfxStatus: TEdit;
    txtPfxMessage: TEdit;
    txtPfxMessageDetail: TEdit;
    Button19: TButton;
    txtPfxRfcEmisor: TEdit;
    txtPfxUuid: TEdit;
    txtPfxPassword: TEdit;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Button21: TButton;
    txtXmlXml: TMemo;
    txtXmlAcuse: TMemo;
    txtXmlStatus: TEdit;
    txtXmlMessage: TEdit;
    txtXmlMessageDetail: TEdit;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    txtUuidRfc: TEdit;
    txtUuidUuid: TEdit;
    txtUuidAcuse: TMemo;
    txtUuidStatus: TEdit;
    txtUuidMessage: TEdit;
    txtUuidMessageDetail: TEdit;
    Button25: TButton;
    txtRelationsUuid: TEdit;
    txtRelationsCodStatus: TEdit;
    txtRelationsUuidConsultado: TEdit;
    txtRelationsResultado: TEdit;
    txtRelationsPadreUuid: TEdit;
    txtRelationsPadreRfcEmisor: TEdit;
    txtRelationsPadreRfcReceptor: TEdit;
    txtRelationsHijosUuid: TEdit;
    txtRelationsHijosRfcEmisor: TEdit;
    txtRelationsHijosRfcReceptor: TEdit;
    txtRelationsMessage: TEdit;
    txtRelationsMessageDetail: TEdit;
    txtRelationsRfcEmisor: TEdit;
    txtRelationsPassword: TEdit;
    txtRelationsB64Cer: TMemo;
    txtRelationsB64Key: TMemo;
    txtRelationsB64Pfx: TMemo;
    Button26: TButton;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    txtRelationsStatus: TEdit;
    Label88: TLabel;
    Button27: TButton;
    txtRelationsXml: TMemo;
    Label89: TLabel;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
    Button32: TButton;
    Button33: TButton;
    txtPendingsStatus: TEdit;
    Label90: TLabel;
    txtPendingsUuids: TListBox;
    txtPendingsCodEstatus: TEdit;
    Label91: TLabel;
    txtPendingsMessage: TEdit;
    txtPendingsMessageDetail: TEdit;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    txtPendingsRFC: TEdit;
    Label95: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo4: TMemo;
    Button34: TButton;
    Button35: TButton;
    Button36: TButton;
    Button37: TButton;
    Button38: TButton;
    Button39: TButton;
    Button40: TButton;
    Memo5: TMemo;
    Button41: TButton;
    txtAcceptRejectRFC: TEdit;
    Label96: TLabel;
    txtAcceptRejectPassword: TEdit;
    Label97: TLabel;
    txtAcceptRejectUUID: TEdit;
    Label98: TLabel;
    txtAcceptRejectAccion: TEdit;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    txtAcceptRejectCodStatus: TEdit;
    txtAcceptRejectAcuse: TMemo;
    Label102: TLabel;
    txtAcceptRejectFolios: TListBox;
    Label103: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnTimbrarV1Click(Sender: TObject);
    procedure btnTimbrarV2Click(Sender: TObject);
    procedure btnTimbrarV3Click(Sender: TObject);
    procedure btnTimbrarV4Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure cleanStamp();
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnTimbrarV2Click(Sender: TObject);
var
  url, token, xml: String;
  StampResponse: TStampResponseV2;
begin
  cleanStamp();
  url := txtURL.Text;
  token := txtToken.Text;
  xml := stampXmlIn.Text;

  StampResponse := Stamp.StampV2(url, token, xml);
  try
    txtTfd.Text := StampResponse.data.TFD;
    txtCfdi.Text := StampResponse.data.cfdi;
  except
    txtMessageStamp.Text := UTF8ToWideString(StampResponse.message);
    txtMessageDetailStamp.Text := UTF8ToWideString(StampResponse.messageDetail);
  end;
end;

procedure TForm1.btnTimbrarV3Click(Sender: TObject);
var
  url, token, xml: String;
  StampResponse: TStampResponseV3;
begin
  cleanStamp();
  url := txtURL.Text;
  token := txtToken.Text;
  xml := stampXmlIn.Text;

  StampResponse := Stamp.StampV3(url, token, xml);
  try
    txtCfdi.Text := StampResponse.data.cfdi;
  except
    txtMessageStamp.Text := UTF8ToWideString(StampResponse.message);
    txtMessageDetailStamp.Text := UTF8ToWideString(StampResponse.messageDetail);
  end;
end;

procedure TForm1.btnTimbrarV4Click(Sender: TObject);
var
  url, token, xml: String;
  StampResponse: TStampResponseV4;
begin
  cleanStamp();
  url := txtURL.Text;
  token := txtToken.Text;
  xml := stampXmlIn.Text;

  StampResponse := Stamp.StampV4(url, token, xml);
  try
    txtCfdi.Text := StampResponse.data.cfdi;
    txtCadenaOriginalSat.Text := StampResponse.data.cadenaOriginalSAT;
    txtNoCertificadoSat.Text := StampResponse.data.noCertificadoSAT;
    txtNoCertificadoCfdi.Text := StampResponse.data.noCertificadoSAT;
    txtUuid.Text := StampResponse.data.uuid;
    txtSelloSat.Text := StampResponse.data.selloSAT;
    txtSelloCfdi.Text := StampResponse.data.noCertificadoSAT;
    txtFechaTimbrado.Text := DateToStr(StampResponse.data.fechaTimbrado);
    txtQrCode.Text := StampResponse.data.qrCode;

  except
    txtMessageStamp.Text := UTF8ToWideString(StampResponse.message);
    txtMessageDetailStamp.Text := UTF8ToWideString(StampResponse.messageDetail);
  end;
end;

procedure TForm1.Button11Click(Sender: TObject);
var
  validaCfdi: TValidateCfdiResponse;
  url, token, cfdi: String;
begin
  url := txtURL.Text;
  token := txtToken.Text;
  cfdi := validateCfdiMemo.Text;

  validaCfdi := ValidateCFDI(url, token, cfdi);
  try
    txtValidaXmlStatus.Text := validaCfdi.status;
    txtValidaXmlCadenaOriginalSAT.Text :=
      UTF8ToWideString(validaCfdi.cadenaOriginalComprobante);
    txtValidaXmlCadenaOriginalComprobante.Text :=
      UTF8ToWideString(validaCfdi.cadenaOriginalComprobante);
    txtValidaXmlUuid.Text := validaCfdi.uuid;
    txtValidaXmlStatusSat.Text := UTF8ToWideString(validaCfdi.statusSat);
    txtValidaXmlStatusCodeSAT.Text :=
      UTF8ToWideString(validaCfdi.statusCodeSat);
  except
    txtValidaXmlMessage.Text := UTF8ToWideString(validaCfdi.message);
    txtValidaXmlMessageDetail.Text :=
      UTF8ToWideString(validaCfdi.messageDetail);
  end;
end;

procedure TForm1.Button12Click(Sender: TObject);
var
  jsonEmision: TStampResponseV1;
begin
  jsonEmision := JsonIssue.IssueJsonV1(txtURL.Text, txtToken.Text,
    memoJson.Text);
  try
    txtJsonTfd.Text := jsonEmision.data.TFD;
  except
    txtJsonMessage.Text := jsonEmision.message;
    txtJsonMessageDetail.Text := jsonEmision.messageDetail;
  end;
end;

procedure TForm1.Button13Click(Sender: TObject);
var
  jsonEmision: TStampResponseV2;
begin
  jsonEmision := JsonIssue.IssueJsonV2(txtURL.Text, txtToken.Text,
    memoJson.Text);
  try
    txtJsonTfd.Text := jsonEmision.data.TFD;
    txtJsonCfdi.Text := jsonEmision.data.cfdi;
  except
    txtJsonMessage.Text := jsonEmision.message;
    txtJsonMessageDetail.Text := jsonEmision.messageDetail;
  end;
end;

procedure TForm1.Button14Click(Sender: TObject);
var
  jsonEmision: TStampResponseV3;
begin
  jsonEmision := JsonIssue.IssueJsonV3(txtURL.Text, txtToken.Text,
    memoJson.Text);
  try
    txtJsonCfdi.Text := jsonEmision.data.cfdi;
  except
    txtJsonMessage.Text := jsonEmision.message;
    txtJsonMessageDetail.Text := jsonEmision.messageDetail;
  end;
end;

procedure TForm1.Button15Click(Sender: TObject);
var
  jsonEmision: TStampResponseV4;
begin
  jsonEmision := JsonIssue.IssueJsonV4(txtURL.Text, txtToken.Text,
    memoJson.Text);
  try

    txtJsonCadenaOriginalSAT.Text := jsonEmision.data.cadenaOriginalSAT;
    txtJsonNoCertificadoSAT.Text := jsonEmision.data.noCertificadoSAT;
    txtJsonNoCertificadoCFDI.Text := jsonEmision.data.noCertificadoCFDI;
    txtJsonUUID.Text := jsonEmision.data.uuid;
    txtJsonSelloSAT.Text := jsonEmision.data.selloSAT;
    txtJsonSelloCFDI.Text := jsonEmision.data.selloCFDI;
    txtJsonFechaDeTimbrado.Text := DateToStr(jsonEmision.data.fechaTimbrado);
    txtJsonCodigoQr.Text := jsonEmision.data.qrCode;
    txtJsonCfdi.Text := jsonEmision.data.cfdi;
  except
    txtJsonMessage.Text := jsonEmision.message;
    txtJsonMessageDetail.Text := jsonEmision.messageDetail;
  end;
end;

procedure TForm1.Button17Click(Sender: TObject);
var
  cancelationCsd: TCancelationResponse;
begin
  cancelationCsd := CancelationByCsd(txtURL.Text, txtToken.Text,
    txtCsdRfcEmisor.Text, txtUuidUuid.Text, txtCsdCer.Text, txtCsdKey.Text,
    txtCsdPassword.Text);
  try
    txtCsdAcuse.Text := cancelationCsd.data.acuse;
    txtCsdStatus.Text := cancelationCsd.status;
  except
    txtCsdStatus.Text := cancelationCsd.status;
    txtCsdMessageDetail.Text := cancelationCsd.messageDetail;
    txtCsdMessage.Text := cancelationCsd.message;
  end;

end;

procedure TForm1.Button19Click(Sender: TObject);
var
  cancelarPorPfx: TCancelationResponse;
begin
  cancelarPorPfx := CancelationByPfx(txtURL.Text, txtToken.Text,
    txtPfxRfcEmisor.Text, txtPfxUuid.Text, txtPfxPfx.Text, txtPfxPassword.Text);
  try
    txtPfxAcuse.Text := cancelarPorPfx.data.acuse;
    txtPfxStatus.Text := cancelarPorPfx.status;
  except
    txtPfxStatus.Text := cancelarPorPfx.status;
    txtPfxMessageDetail.Text := cancelarPorPfx.messageDetail;
    txtPfxMessage.Text := cancelarPorPfx.message;
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  usuario, contrasena, direccion: String;
  resultado: TResponse;
begin
  usuario := txtUser.Text;
  contrasena := txtPassword.Text;
  direccion := txtURL.Text;
  resultado := AuthenticationService(direccion, usuario, contrasena);
  try
    txtToken.Text := resultado.data.token;
    txtCaducidad.Text := fechaDeVencimiento(resultado.data.expires_in.ToString);
    txtTokenTipo.Text := resultado.data.tokeny_type;
    txtMessageAuth.Text := resultado.message;
    txtMessageDetailAuth.Text := resultado.messageDetail;
    txtStatus.Text := resultado.status;
  except
    txtMessageAuth.Text := UTF8ToWideString(resultado.message);
    txtMessageDetailAuth.Text := resultado.messageDetail;
    txtStatus.Text := resultado.status;
  end;
end;

procedure TForm1.Button22Click(Sender: TObject);
var
  cancelacionXML: TCancelationResponse;
begin
  cancelacionXML := CancelationByXml(txtURL.Text, txtToken.Text,
    txtXmlXml.Text);
  try
    txtXmlAcuse.Text := cancelacionXML.data.acuse;
    txtXmlStatus.Text := cancelacionXML.status;
  except
    txtXmlMessage.Text := cancelacionXML.message;
    txtXmlMessageDetail.Text := cancelacionXML.messageDetail
  end;
end;

procedure TForm1.Button24Click(Sender: TObject);
var
  cancelacionUuid: TCancelationResponse;
begin
  cancelacionUuid := CancelationByUuid(txtURL.Text, txtToken.Text,
    txtUuidRfc.Text, txtUuidUuid.Text);
  try
    txtUuidAcuse.Text := cancelacionUuid.data.acuse;
    txtUuidStatus.Text := cancelacionUuid.status;
  except
    txtUuidMessage.Text := cancelacionUuid.message;
    txtUuidMessageDetail.Text := cancelacionUuid.messageDetail
  end;

end;

procedure TForm1.Button25Click(Sender: TObject);
var
  relationsCsd: TCancelationRelationsResponse;
begin
  relationsCsd := CancelationRelationsByCsd(txtURL.Text, txtToken.Text,
    txtRelationsRfcEmisor.Text, txtRelationsUuid.Text, txtRelationsB64Cer.Text,
    txtRelationsB64Key.Text, txtRelationsPassword.Text);
  try
    txtRelationsCodStatus.Text := relationsCsd.codStatus;
    txtRelationsUuidConsultado.Text := relationsCsd.data.uuidConsultado;
    txtRelationsResultado.Text := relationsCsd.data.resultado;
    {
      txtRelationsPadreUuid.Text := relationsCsd.data.uuidsRelacionadosPadres;
      txtRelationsPadreRfcEmisor.Text :=
      relationsCsd.data.uuidsRelacionadosPadres;
      txtRelationsPadreRfcReceptor.Text :=
      relationsCsd.data.uuidsRelacionadosPadres;

      txtRelationsHijosUuid.Text := relationsCsd.data.uuidsRelacionadosHijos;
      txtRelationsHijosRfcEmisor.Text := relationsCsd.data.uuidsRelacionadosHijos;
      txtRelationsHijosRfcReceptor.Text :=
      relationsCsd.data.uuidsRelacionadosHijos;
    }
    txtRelationsMessage.Text := relationsCsd.message;
  except
    txtRelationsMessage.Text := relationsCsd.message;
    txtRelationsMessageDetail.Text := relationsCsd.messageDetail;
  end;

end;

procedure TForm1.Button26Click(Sender: TObject);
var
  relationsPfx: TCancelationRelationsResponse;
begin
  relationsPfx := CancelationRelationsByPfx(txtURL.Text, txtToken.Text,
    txtRelationsRfcEmisor.Text, txtRelationsUuid.Text, txtRelationsB64Pfx.Text,
    txtRelationsPassword.Text);
  try
    txtRelationsCodStatus.Text := relationsPfx.codStatus;
    txtRelationsUuidConsultado.Text := relationsPfx.data.uuidConsultado;
    txtRelationsResultado.Text := relationsPfx.data.resultado;
    {
      txtRelationsPadreUuid.Text := relationsPfx.data.uuidsRelacionadosPadres;
      txtRelationsPadreRfcEmisor.Text :=
      relationsPfx.data.uuidsRelacionadosPadres;
      txtRelationsPadreRfcReceptor.Text :=
      relationsPfx.data.uuidsRelacionadosPadres;

      txtRelationsHijosUuid.Text := relationsPfx.data.uuidsRelacionadosHijos;
      txtRelationsHijosRfcEmisor.Text := relationsPfx.data.uuidsRelacionadosHijos;
      txtRelationsHijosRfcReceptor.Text :=
      relationsPfx.data.uuidsRelacionadosHijos;
    }
    txtRelationsMessage.Text := relationsPfx.message;
  except
    txtRelationsMessage.Text := relationsPfx.message;
    txtRelationsMessageDetail.Text := relationsPfx.messageDetail;
  end;
end;

procedure TForm1.Button27Click(Sender: TObject);
var
  relationsXml: TCancelationRelationsResponse;
begin
  relationsXml := CancelationRelationsByXml(txtURL.Text, txtToken.Text,
    txtRelationsXml.Text);
  try
    txtRelationsCodStatus.Text := relationsXml.codStatus;
    txtRelationsUuidConsultado.Text := relationsXml.data.uuidConsultado;
    txtRelationsResultado.Text := relationsXml.data.resultado;
    {
      txtRelationsPadreUuid.Text := relationsXml.data.uuidsRelacionadosPadres;
      txtRelationsPadreRfcEmisor.Text :=
      relationsXml.data.uuidsRelacionadosPadres;
      txtRelationsPadreRfcReceptor.Text :=
      relationsXml.data.uuidsRelacionadosPadres;

      txtRelationsHijosUuid.Text := relationsXml.data.uuidsRelacionadosHijos;
      txtRelationsHijosRfcEmisor.Text := relationsXml.data.uuidsRelacionadosHijos;
      txtRelationsHijosRfcReceptor.Text :=
      relationsXml.data.uuidsRelacionadosHijos;
    }
    txtRelationsMessage.Text := relationsXml.message;
  except
    txtRelationsMessage.Text := relationsXml.message;
    txtRelationsMessageDetail.Text := relationsXml.messageDetail;
  end;

end;

procedure TForm1.Button29Click(Sender: TObject);
var
  relationsUuid: TCancelationRelationsResponse;
begin
  relationsUuid := CancelationRelationsByUuid(txtURL.Text, txtToken.Text,
    txtRelationsRfcEmisor.Text, txtRelationsUuid.Text);
  try
    txtRelationsCodStatus.Text := relationsUuid.codStatus;
    txtRelationsUuidConsultado.Text := relationsUuid.data.uuidConsultado;
    txtRelationsResultado.Text := relationsUuid.data.resultado;
    {
      txtRelationsPadreUuid.Text := relationsUuid.data.uuidsRelacionadosPadres;
      txtRelationsPadreRfcEmisor.Text :=
      relationsUuid.data.uuidsRelacionadosPadres;
      txtRelationsPadreRfcReceptor.Text :=
      relationsUuid.data.uuidsRelacionadosPadres;

      txtRelationsHijosUuid.Text := relationsUuid.data.uuidsRelacionadosHijos;
      txtRelationsHijosRfcEmisor.Text :=
      relationsUuid.data.uuidsRelacionadosHijos;
      txtRelationsHijosRfcReceptor.Text :=
      relationsUuid.data.uuidsRelacionadosHijos;
    }
    txtRelationsMessage.Text := relationsUuid.message;
  except
    txtRelationsMessage.Text := relationsUuid.message;
    txtRelationsMessageDetail.Text := relationsUuid.messageDetail;
  end;
end;

function fechaDeVencimiento(expiresIn: String): String;
var
  UnixTime: Double;
  TimeZoneInformation: TTimeZoneInformation;
  utime: tdatetime;
begin
  UnixTime := StrToInt(expiresIn) - 6 * 3600;
  utime := StrToDate('1/1/1970') + (UnixTime / (24 * 3600));
  case GetTimeZoneInformation(TimeZoneInformation) of
    TIME_ZONE_ID_DAYLIGHT:
      utime := utime - (TimeZoneInformation.DaylightBias / (24 * 60));
  else
    utime := utime - (TimeZoneInformation.Bias / (24 * 60));
  end;
  Result := DateTimeToStr(utime);
end;

procedure TForm1.btnTimbrarV1Click(Sender: TObject);
var
  url, token, xml: String;
  StampResponse: TStampResponseV1;
begin
  cleanStamp();
  url := txtURL.Text;
  token := txtToken.Text;
  xml := stampXmlIn.Text;

  StampResponse := Stamp.StampV1(url, token, xml);
  try
    txtTfd.Text := StampResponse.data.TFD;
  except
    txtMessageStamp.Text := UTF8ToWideString(StampResponse.message);
    txtMessageDetailStamp.Text := UTF8ToWideString(StampResponse.messageDetail);
  end;
end;

procedure TForm1.Button33Click(Sender: TObject);
var
  i: Integer;
  cancelacionPendings: TCancelationPendingsResponse;
begin
  cancelacionPendings := CancelationPendingsService(txtURL.Text, txtToken.Text,
    txtPendingsRFC.Text);

  txtPendingsUuids.Clear;
  for i := Low(cancelacionPendings.data.uuid)
    to High(cancelacionPendings.data.uuid) do
    txtPendingsUuids.Items.Add(cancelacionPendings.data.uuid[i]);

  try
    txtPendingsStatus.Text := cancelacionPendings.status;
    txtPendingsCodEstatus.Text := cancelacionPendings.data.CodEstatus;
    txtPendingsMessage.Text := cancelacionPendings.message;
    txtPendingsMessageDetail.Text := cancelacionPendings.messageDetail;
  except
    txtPendingsMessage.Text := cancelacionPendings.message;
    txtPendingsMessageDetail.Text := cancelacionPendings.messageDetail;
    txtPendingsStatus.Text := cancelacionPendings.status;
  end;

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  stream: TMemoryStream;
begin
  stampXmlIn.Text := '';
  OpenDialog1.Filter := 'Archivos XML (*.xml)|*.xml|';
  stream := TMemoryStream.Create;

  if OpenDialog1.Execute then
    if FileExists(OpenDialog1.FileName) then
      stream.LoadFromFile(OpenDialog1.FileName)
    else
      raise Exception.Create('File does not exist.');
  stampXmlIn.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  validaLco: TValidateLcoResponse;

begin
  validaLco := ValidateLco(txtURL.Text, txtToken.Text, txtLcoAValidar.Text);
  try
    txtValidaLcoNoCertificado.Text := validaLco.data.noCertificado;
    txtValidaLcoRfc.Text := validaLco.data.rfc;
    txtValidacionLcoValidezObligaciones.Text :=
      validaLco.data.validezObligaciones;
    txtValidacionLcoEstatusCertificado.Text :=
      validaLco.data.estatusCertificado;
    txtValidacionLcoFechaInicio.Text := DateToStr(validaLco.data.fechaInicio);
    txtValidacionLcoFechaFinal.Text := DateToStr(validaLco.data.fechaFinal);
    txtValidaLcoStatus.Text := validaLco.status;
  except
    txtValidaLcoMessage.Text := validaLco.message;
    txtValidaLcoMessageDetail.Text := validaLco.messageDetail;
  end;

end;

procedure TForm1.Button9Click(Sender: TObject);
var
  validaLrfc: TValidateLrfcResponse;
begin

  validaLrfc := ValidateLrfc(txtURL.Text, txtToken.Text, txtValidateLrfc.Text);

  try
    txtValidateContribuyenteRfc.Text := validaLrfc.data.contribuyenteRFC;
    txtValidateSnfc.Text := ifthen(validaLrfc.data.sncf, 'True', 'False');
    txtValidateSubcontratacion.Text := ifthen(validaLrfc.data.subcontratacion,
      'True', 'False');
    txtValidateStatus.Text := validaLrfc.status;

  except
    txtValidateMessage.Text := validaLrfc.message;
    txtValidateMessageDetail.Text := validaLrfc.messageDetail;
    txtValidateStatus.Text := validaLrfc.status;
  end;

end;

procedure TForm1.cleanStamp();
begin
  txtTfd.Text := '';
  txtCfdi.Text := '';
  txtNoCertificadoSat.Text := '';
  txtCadenaOriginalSat.Text := '';
  txtNoCertificadoSat.Text := '';
  txtNoCertificadoCfdi.Text := '';
  txtUuid.Text := '';
  txtSelloSat.Text := '';
  txtSelloCfdi.Text := '';
  txtFechaTimbrado.Text := '';
  txtQrCode.Text := '';
  txtMessageStamp.Text := '';
  txtMessageDetailStamp.Text := '';
end;

end.
