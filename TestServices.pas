﻿unit TestServices;

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
	ValidateCfdiResponse,
	JsonIssue,
	Cancelation,
	CancelationResponse,
	CancelationPendings,
	CancelationPendingsResponse,
	CancelationAcceptReject,
	CancelationAcceptRejectResponse,
	CancelationRelations,
	CancelationRelationsResponse,
	BalanceResponse,
	Balance,
	BalanceRequest;

function fechaDeVencimiento(expiresIn: String): String;

type
	TForm1 = class(TForm)
		OpenDialog1: TOpenDialog;
		Label105: TLabel;
		Label106: TLabel;
    Autenticación: TPageControl;
    TabSheet1: TTabSheet;
    Label6: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Expiración: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    txtUser: TEdit;
    txtPassword: TEdit;
    txtURL: TEdit;
    txtToken: TEdit;
    txtCaducidad: TEdit;
    txtTokenTipo: TEdit;
    Button1: TButton;
    txtMessageAuth: TEdit;
    txtMessageDetailAuth: TEdit;
    txtStatus: TEdit;
    TabSheet2: TTabSheet;
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
    Label20: TLabel;
    Label21: TLabel;
    stampXmlIn: TMemo;
    btnTimbrarV1: TButton;
    Button3: TButton;
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
    txtFechaTimbrado: TEdit;
    txtQrCode: TEdit;
    TabSheet3: TTabSheet;
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
    txtIssue: TMemo;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    txtIssueTFD: TEdit;
    txtIssueCFDI: TEdit;
    txtIssueCadOriSAT: TEdit;
    txtIssueNoCertSAT: TEdit;
    txtIssueNoCertCFDI: TEdit;
    txtIssueUUID: TEdit;
    txtIssueSelloSAT: TEdit;
    txtIssueSelloCFDI: TEdit;
    txtIssueFechaTimbrado: TEdit;
    txtIssueMessage: TEdit;
    txtIssueMessageDetail: TEdit;
    txtIssueQr: TEdit;
    TabSheet4: TTabSheet;
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
    memoJson: TMemo;
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
    TabSheet5: TTabSheet;
    Label71: TLabel;
    TabCancelacion: TPageControl;
    TabSheet10: TTabSheet;
    Label104: TLabel;
    Cancelación: TPageControl;
    TabSheet14: TTabSheet;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Button17: TButton;
    Button20: TButton;
    Button18: TButton;
    txtCsdCer: TMemo;
    txtCsdKey: TMemo;
    txtCsdAcuse: TMemo;
    txtCsdUuid: TEdit;
    txtCsdPassword: TEdit;
    txtCsdStatus: TEdit;
    txtCsdMessage: TEdit;
    txtCsdMessageDetail: TEdit;
    txtCsdRfcEmisor: TEdit;
    TabSheet15: TTabSheet;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    txtPfxAcuse: TMemo;
    txtPfxPfx: TMemo;
    txtPfxStatus: TEdit;
    txtPfxMessage: TEdit;
    txtPfxMessageDetail: TEdit;
    Button19: TButton;
    txtPfxRfcEmisor: TEdit;
    txtPfxUuid: TEdit;
    txtPfxPassword: TEdit;
    Button21: TButton;
    TabSheet17: TTabSheet;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Button24: TButton;
    txtUuidRfc: TEdit;
    txtUuidUuid: TEdit;
    txtUuidAcuse: TMemo;
    txtUuidStatus: TEdit;
    txtUuidMessage: TEdit;
    txtUuidMessageDetail: TEdit;
    TabSheet16: TTabSheet;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    txtXmlXml: TMemo;
    txtXmlAcuse: TMemo;
    txtXmlStatus: TEdit;
    txtXmlMessage: TEdit;
    txtXmlMessageDetail: TEdit;
    Button22: TButton;
    TabSheet11: TTabSheet;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Button25: TButton;
    txtRelationsUuid: TEdit;
    txtRelationsCodStatus: TEdit;
    txtRelationsUuidConsultado: TEdit;
    txtRelationsResultado: TEdit;
    txtRelationsMessage: TEdit;
    txtRelationsMessageDetail: TEdit;
    txtRelationsRfcEmisor: TEdit;
    txtRelationsPassword: TEdit;
    txtRelationsB64Cer: TMemo;
    txtRelationsB64Key: TMemo;
    txtRelationsB64Pfx: TMemo;
    Button26: TButton;
    txtRelationsStatus: TEdit;
    Button27: TButton;
    txtRelationsXml: TMemo;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
    Button32: TButton;
    RelacionadosPadre: TListBox;
    RelacionadosHijo: TListBox;
    TabSheet12: TTabSheet;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Button33: TButton;
    txtPendingsStatus: TEdit;
    txtPendingsUuids: TListBox;
    txtPendingsCodEstatus: TEdit;
    txtPendingsMessage: TEdit;
    txtPendingsMessageDetail: TEdit;
    txtPendingsRFC: TEdit;
    TabSheet13: TTabSheet;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Status: TLabel;
    txtAcceptRejectCer: TMemo;
    txtAcceptRejectKey: TMemo;
    txtAcceptRejectPfx: TMemo;
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
    txtAcceptRejectPassword: TEdit;
    txtAcceptRejectUUID: TEdit;
    txtAcceptRejectAccion: TEdit;
    txtAcceptRejectCodStatus: TEdit;
    txtAcceptRejectAcuse: TMemo;
    txtAcceptRejectFolios: TListBox;
    txtAcceptRejectMessage: TEdit;
    txtAcceptRejectMessageDetail: TEdit;
    txtAcceptRejectStatus: TEdit;
    TabSheet6: TTabSheet;
    Label11: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    validateCfdiMemo: TMemo;
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
    TabSheet18: TTabSheet;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    btnBalance: TButton;
    txtIdSaldoCliente: TEdit;
    txtIdClienteUsuario: TEdit;
    txtSaldoTimbres: TEdit;
    txtTimbresUtilizados: TEdit;
    txtFechaExpiracion: TEdit;
    txtUnlimited: TEdit;
    txtTimbresAsignados: TEdit;
    txtStatusBalance: TEdit;
    txtMessageBalance: TEdit;
    txtMessageDetailBalance: TEdit;
    Label23: TLabel;
    txtUuidMotivo: TEdit;
    Folio: TLabel;
    Sustitución: TLabel;
    txtUuidFolioSust: TEdit;
    Label33: TLabel;
    txtCsdFolioSust: TEdit;
    Label34: TLabel;
    txtCsdMotivo: TEdit;
    Label35: TLabel;
    txtPfxFolioSust: TEdit;
    Label36: TLabel;
    txtPfxMotivo: TEdit;
		procedure Button1Click(Sender: TObject);
		procedure Button3Click(Sender: TObject);
		procedure btnTimbrarV1Click(Sender: TObject);
		procedure btnTimbrarV2Click(Sender: TObject);
		procedure btnTimbrarV3Click(Sender: TObject);
		procedure btnTimbrarV4Click(Sender: TObject);
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
		procedure Button37Click(Sender: TObject);
		procedure Button2Click(Sender: TObject);
		procedure Button16Click(Sender: TObject);
		procedure Button4Click(Sender: TObject);
		procedure Button5Click(Sender: TObject);
		procedure Button6Click(Sender: TObject);
		procedure Button7Click(Sender: TObject);
		procedure Button38Click(Sender: TObject);
		procedure Button39Click(Sender: TObject);
		procedure Button40Click(Sender: TObject);
		procedure btnBalanceClick(Sender: TObject);
		procedure Button41Click(Sender: TObject);
		procedure Button35Click(Sender: TObject);
		procedure Button34Click(Sender: TObject);
		procedure Button36Click(Sender: TObject);
		procedure Button32Click(Sender: TObject);
		procedure Button31Click(Sender: TObject);
		procedure Button30Click(Sender: TObject);
		procedure Button28Click(Sender: TObject);
		procedure Button18Click(Sender: TObject);
		procedure Button20Click(Sender: TObject);
		procedure Button21Click(Sender: TObject);
		procedure Button10Click(Sender: TObject);
    procedure memoJsonChange(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
		procedure cleanStamp();
		procedure cleanIssueStamp();
		procedure cleanJsonStamp();
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

procedure TForm1.Button10Click(Sender: TObject);
var
	stream: TMemoryStream;
begin
	validateCfdiMemo.Text := '';
	OpenDialog1.Filter := 'Archivos XML (*.xml)|*.xml|';
	stream := TMemoryStream.Create;

	if OpenDialog1.Execute then
		if FileExists(OpenDialog1.FileName) then
			stream.LoadFromFile(OpenDialog1.FileName)
		else
			raise Exception.Create('File does not exist.');
	validateCfdiMemo.Lines.LoadFromFile(OpenDialog1.FileName);
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

procedure TForm1.Button16Click(Sender: TObject);
begin
  memoJson.Text := ''; // Borra cualquier contenido previo en el TMemo
  OpenDialog1.Filter := 'Archivos JSON (*.json)|*.json|';

  if OpenDialog1.Execute then
  begin
    if FileExists(OpenDialog1.FileName) then
    begin
      memoJson.Lines.LoadFromFile(OpenDialog1.FileName, TEncoding.UTF8); // Carga el archivo utilizando UTF-8
    end
    else
    begin
      raise Exception.Create('File does not exist.');
    end;
  end;
end;

procedure TForm1.Button17Click(Sender: TObject);
var
	cancelationCsd: TCancelationResponse;
begin
	cancelationCsd := CancelationByCsd(txtURL.Text, txtToken.Text,
		txtCsdRfcEmisor.Text, txtCsdUuid.Text, txtCsdMotivo.Text, txtCsdFolioSust.Text,
    txtCsdCer.Text, txtCsdKey.Text, txtCsdPassword.Text);
	try
		txtCsdAcuse.Text := cancelationCsd.data.acuse;
		txtCsdStatus.Text := cancelationCsd.status;
	except
		txtCsdStatus.Text := cancelationCsd.status;
		txtCsdMessageDetail.Text := cancelationCsd.messageDetail;
		txtCsdMessage.Text := cancelationCsd.message;
	end;

end;

procedure TForm1.Button18Click(Sender: TObject);
var
	stream: TMemoryStream;
	encode: String;
begin
	txtCsdKey.Text := '';
	OpenDialog1.Filter := 'Archivos Key (*.key)|*.key|';
	stream := TMemoryStream.Create;

	if OpenDialog1.Execute then
		if FileExists(OpenDialog1.FileName) then
			stream.LoadFromFile(OpenDialog1.FileName)
		else
			raise Exception.Create('File does not exist.');
	encode:= EncodeBase64(stream.Memory, stream.Size);
	txtCsdKey.Text := encode;
end;

procedure TForm1.Button19Click(Sender: TObject);
var
	cancelarPorPfx: TCancelationResponse;
begin
	cancelarPorPfx := CancelationByPfx(txtURL.Text, txtToken.Text,
		txtPfxRfcEmisor.Text, txtPfxUuid.Text,txtPfxMotivo.Text, txtPfxFolioSust.Text, txtPfxPfx.Text, txtPfxPassword.Text);
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

procedure TForm1.Button20Click(Sender: TObject);
var
	stream: TMemoryStream;
	encode: String;
begin
	txtCsdCer.Text := '';
	OpenDialog1.Filter := 'Archivos Cer (*.cer)|*.cer|';
	stream := TMemoryStream.Create;

	if OpenDialog1.Execute then
		if FileExists(OpenDialog1.FileName) then
			stream.LoadFromFile(OpenDialog1.FileName)
		else
			raise Exception.Create('File does not exist.');
	encode:= EncodeBase64(stream.Memory, stream.Size);
	txtCsdCer.Text := encode;
end;

procedure TForm1.Button21Click(Sender: TObject);
var
	stream: TMemoryStream;
	encode: String;
begin
	txtPfxPfx.Text := '';
	OpenDialog1.Filter := 'Archivos Pfx (*.pfx)|*.pfx|';
	stream := TMemoryStream.Create;

	if OpenDialog1.Execute then
		if FileExists(OpenDialog1.FileName) then
			stream.LoadFromFile(OpenDialog1.FileName)
		else
			raise Exception.Create('File does not exist.');
	encode:= EncodeBase64(stream.Memory, stream.Size);
	txtPfxPfx.Text := encode;
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
		txtUuidRfc.Text, txtUuidUuid.Text, txtUuidMotivo.Text, txtUuidFolioSust.Text);
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
	i : Integer;
begin
	relationsCsd := CancelationRelationsByCsd(txtURL.Text, txtToken.Text,
		txtRelationsRfcEmisor.Text, txtRelationsUuid.Text, txtRelationsB64Key.Text,
		txtRelationsB64Cer.Text, txtRelationsPassword.Text);
	try
		for i := Low(relationsCsd.data.uuidsRelacionadosPadres) to High(relationsCsd.data.uuidsRelacionadosPadres) do
			RelacionadosPadre.Items.Add(relationsCsd.data.uuidsRelacionadosPadres[i].uuid);
		for i := Low(relationsCsd.data.uuidsRelacionadosHijos) to High(relationsCsd.data.uuidsRelacionadosHijos) do
			RelacionadosHijo.Items.Add(relationsCsd.data.uuidsRelacionadosHijos[i].uuid);
		txtRelationsCodStatus.Text := relationsCsd.codStatus;
		txtRelationsUuidConsultado.Text := relationsCsd.data.uuidConsultado;
		txtRelationsResultado.Text := relationsCsd.data.resultado;
		txtRelationsMessage.Text := relationsCsd.message;
	except
		txtRelationsMessage.Text := relationsCsd.message;
		txtRelationsMessageDetail.Text := relationsCsd.messageDetail;
	end;

end;

procedure TForm1.Button26Click(Sender: TObject);
var
	relationsPfx: TCancelationRelationsResponse;
	i : Integer;
begin
	relationsPfx := CancelationRelationsByPfx(txtURL.Text, txtToken.Text,
		txtRelationsRfcEmisor.Text, txtRelationsUuid.Text, txtRelationsB64Pfx.Text,
		txtRelationsPassword.Text);
	try
		txtRelationsCodStatus.Text := relationsPfx.codStatus;
		txtRelationsUuidConsultado.Text := relationsPfx.data.uuidConsultado;
		txtRelationsResultado.Text := relationsPfx.data.resultado;
		for i := Low(relationsPfx.data.uuidsRelacionadosPadres) to High(relationsPfx.data.uuidsRelacionadosPadres) do
			RelacionadosPadre.Items.Add(relationsPfx.data.uuidsRelacionadosPadres[i].uuid);
		for i := Low(relationsPfx.data.uuidsRelacionadosHijos) to High(relationsPfx.data.uuidsRelacionadosHijos) do
			RelacionadosHijo.Items.Add(relationsPfx.data.uuidsRelacionadosHijos[i].uuid);
		txtRelationsMessage.Text := relationsPfx.message;
	except
		txtRelationsMessage.Text := relationsPfx.message;
		txtRelationsMessageDetail.Text := relationsPfx.messageDetail;
	end;
end;

procedure TForm1.Button27Click(Sender: TObject);
var
	relationsXml: TCancelationRelationsResponse;
	i:Integer;
begin
	relationsXml := CancelationRelationsByXml(txtURL.Text, txtToken.Text,
		txtRelationsXml.Text);
	try
		txtRelationsCodStatus.Text := relationsXml.codStatus;
		txtRelationsUuidConsultado.Text := relationsXml.data.uuidConsultado;
		txtRelationsResultado.Text := relationsXml.data.resultado;
		for i := Low(relationsXml.data.uuidsRelacionadosPadres) to High(relationsXml.data.uuidsRelacionadosPadres) do
			RelacionadosPadre.Items.Add(relationsXml.data.uuidsRelacionadosPadres[i].uuid);
		for i := Low(relationsXml.data.uuidsRelacionadosHijos) to High(relationsXml.data.uuidsRelacionadosHijos) do
			RelacionadosHijo.Items.Add(relationsXml.data.uuidsRelacionadosHijos[i].uuid);
		txtRelationsMessage.Text := relationsXml.message;
	except
		txtRelationsMessage.Text := relationsXml.message;
		txtRelationsMessageDetail.Text := relationsXml.messageDetail;
	end;

end;

procedure TForm1.Button28Click(Sender: TObject);
var
	stream: TMemoryStream;
begin
	txtRelationsXml.Text := '';
	OpenDialog1.Filter := 'Archivos XML (*.xml)|*.xml|';
	stream := TMemoryStream.Create;

	if OpenDialog1.Execute then
		if FileExists(OpenDialog1.FileName) then
			stream.LoadFromFile(OpenDialog1.FileName)
		else
			raise Exception.Create('File does not exist.');
	txtRelationsXml.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.Button29Click(Sender: TObject);
var
	relationsUuid: TCancelationRelationsResponse;
	i:Integer;
begin
	relationsUuid := CancelationRelationsByUuid(txtURL.Text, txtToken.Text,
		txtRelationsRfcEmisor.Text, txtRelationsUuid.Text);
	try
		txtRelationsCodStatus.Text := relationsUuid.codStatus;
		txtRelationsUuidConsultado.Text := relationsUuid.data.uuidConsultado;
		txtRelationsResultado.Text := relationsUuid.data.resultado;
		for i := Low(relationsUuid.data.uuidsRelacionadosPadres) to High(relationsUuid.data.uuidsRelacionadosPadres) do
			RelacionadosPadre.Items.Add(relationsUuid.data.uuidsRelacionadosPadres[i].uuid);
		for i := Low(relationsUuid.data.uuidsRelacionadosHijos) to High(relationsUuid.data.uuidsRelacionadosHijos) do
			RelacionadosHijo.Items.Add(relationsUuid.data.uuidsRelacionadosHijos[i].uuid);
		txtRelationsMessage.Text := relationsUuid.message;
	except
		txtRelationsMessage.Text := relationsUuid.message;
		txtRelationsMessageDetail.Text := relationsUuid.messageDetail;
	end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
	stream: TMemoryStream;
begin
	txtIssue.Text := '';
	OpenDialog1.Filter := 'Archivos XML (*.xml)|*.xml|';
	stream := TMemoryStream.Create;

	if OpenDialog1.Execute then
		if FileExists(OpenDialog1.FileName) then
			stream.LoadFromFile(OpenDialog1.FileName)
		else
			raise Exception.Create('File does not exist.');
	txtIssue.Lines.LoadFromFile(OpenDialog1.FileName);
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

procedure TForm1.btnBalanceClick(Sender: TObject);
var
	url, token: String;
	BalanceResponse: TBalanceResponse;
begin
	url := txtURL.Text;
	token := txtToken.Text;
	BalanceResponse := Balance.AccountBalance(url,token);
	try
		txtIdSaldoCliente.Text := BalanceResponse.data.idSaldoCliente;
		txtIdClienteUsuario.Text := BalanceResponse.data.idClienteUsuario;
		txtSaldoTimbres.Text := inttostr(BalanceResponse.data.saldoTimbres);
		txtTimbresUtilizados.Text := inttostr(BalanceResponse.data.timbresUtilizados);
		txtFechaExpiracion.Text := BalanceResponse.data.fechaExpiracion;
		txtUnlimited.Text := BoolToStr(BalanceResponse.data.unlimited);
		txtTimbresAsignados.Text := inttostr(BalanceResponse.data.timbresAsignados);
		txtStatusBalance.Text := BalanceResponse.status;
	except
		txtMessageBalance.Text := UTF8ToWideString(BalanceResponse.message);
		txtMessageDetailBalance.Text := UTF8ToWideString(BalanceResponse.messageDetail);
	end;
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

procedure TForm1.Button30Click(Sender: TObject);
var
	stream: TMemoryStream;
	encode: String;
begin
	txtRelationsB64Cer.Text := '';
	OpenDialog1.Filter := 'Archivos Cer (*.cer)|*.cer|';
	stream := TMemoryStream.Create;

	if OpenDialog1.Execute then
		if FileExists(OpenDialog1.FileName) then
			stream.LoadFromFile(OpenDialog1.FileName)
		else
			raise Exception.Create('File does not exist.');
	encode:= EncodeBase64(stream.Memory, stream.Size);
	txtRelationsB64Cer.Text := encode;
end;

procedure TForm1.Button31Click(Sender: TObject);
var
	stream: TMemoryStream;
	encode: String;
begin
	txtRelationsB64Key.Text := '';
	OpenDialog1.Filter := 'Archivos Key (*.key)|*.key|';
	stream := TMemoryStream.Create;

	if OpenDialog1.Execute then
		if FileExists(OpenDialog1.FileName) then
			stream.LoadFromFile(OpenDialog1.FileName)
		else
			raise Exception.Create('File does not exist.');
	encode:= EncodeBase64(stream.Memory, stream.Size);
	txtRelationsB64Key.Text := encode;
end;

procedure TForm1.Button32Click(Sender: TObject);
var
	stream: TMemoryStream;
	encode: String;
begin
	txtRelationsB64Pfx.Text := '';
	OpenDialog1.Filter := 'Archivos Pfx (*.pfx)|*.pfx|';
	stream := TMemoryStream.Create;

	if OpenDialog1.Execute then
		if FileExists(OpenDialog1.FileName) then
			stream.LoadFromFile(OpenDialog1.FileName)
		else
			raise Exception.Create('File does not exist.');
	encode:= EncodeBase64(stream.Memory, stream.Size);
	txtRelationsB64Pfx.Text := encode;
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

procedure TForm1.Button34Click(Sender: TObject);
var
	stream: TMemoryStream;
	encode: String;
begin
	txtAcceptRejectKey.Text := '';
	OpenDialog1.Filter := 'Archivos Key (*.key)|*.key|';
	stream := TMemoryStream.Create;

	if OpenDialog1.Execute then
		if FileExists(OpenDialog1.FileName) then
			stream.LoadFromFile(OpenDialog1.FileName)
		else
			raise Exception.Create('File does not exist.');
	encode:= EncodeBase64(stream.Memory, stream.Size);
	txtAcceptRejectKey.Text := encode;
end;

procedure TForm1.Button35Click(Sender: TObject);
var
	stream: TMemoryStream;
	encode: String;
begin
	txtAcceptRejectCer.Text := '';
	OpenDialog1.Filter := 'Archivos Cer (*.cer)|*.cer|';
	stream := TMemoryStream.Create;

	if OpenDialog1.Execute then
		if FileExists(OpenDialog1.FileName) then
			stream.LoadFromFile(OpenDialog1.FileName)
		else
			raise Exception.Create('File does not exist.');
	encode:= EncodeBase64(stream.Memory, stream.Size);
	txtAcceptRejectCer.Text := encode;
end;

procedure TForm1.Button36Click(Sender: TObject);
var
	stream: TMemoryStream;
	encode: String;
begin
	txtAcceptRejectPfx.Text := '';
	OpenDialog1.Filter := 'Archivos Pfx (*.pfx)|*.pfx|';
	stream := TMemoryStream.Create;

	if OpenDialog1.Execute then
		if FileExists(OpenDialog1.FileName) then
			stream.LoadFromFile(OpenDialog1.FileName)
		else
			raise Exception.Create('File does not exist.');
	encode:= EncodeBase64(stream.Memory, stream.Size);
	txtAcceptRejectPfx.Text := encode;
end;

procedure TForm1.Button37Click(Sender: TObject);
 var
 i:Integer;
	acceptRejectResponse: TCancelationAcceptRejectResponse;
begin
	acceptRejectResponse := CancelationAcceptRejectByCsd(txtURL.Text, txtToken.Text, txtAcceptRejectRFC.Text, txtAcceptRejectUUID.Text,
	 txtAcceptRejectAccion.Text,txtAcceptRejectKey.Text, txtAcceptRejectCer.Text, txtAcceptRejectPassword.Text);
	try
		txtAcceptRejectStatus.Text := acceptRejectResponse.status;
		txtAcceptRejectCodStatus.Text := acceptRejectResponse.codStatus;
		for i := Low(acceptRejectResponse.data.folios)
		to High(acceptRejectResponse.data.folios) do
		txtAcceptRejectFolios.Items.Add(acceptRejectResponse.data.folios[i].uuid);
		txtAcceptRejectAcuse.Text := acceptRejectResponse.data.acuse;
		txtAcceptRejectMessage.Text := acceptRejectResponse.message;
	except
		txtAcceptRejectMessage.Text := acceptRejectResponse.message;
		txtAcceptRejectMessageDetail.Text := acceptRejectResponse.messageDetail;
	end;
end;

procedure TForm1.Button38Click(Sender: TObject);
 var
 i:Integer;
	acceptRejectResponse: TCancelationAcceptRejectResponse;
begin
	acceptRejectResponse := CancelationAcceptRejectByPfx(txtURL.Text, txtToken.Text, txtAcceptRejectRFC.Text, txtAcceptRejectUUID.Text,
	 txtAcceptRejectAccion.Text,txtAcceptRejectPfx.Text, txtAcceptRejectPassword.Text);
	try
		txtAcceptRejectStatus.Text := acceptRejectResponse.status;
		txtAcceptRejectCodStatus.Text := acceptRejectResponse.codStatus;
		for i := Low(acceptRejectResponse.data.folios)
		to High(acceptRejectResponse.data.folios) do
		txtAcceptRejectFolios.Items.Add(acceptRejectResponse.data.folios[i].uuid);
		txtAcceptRejectAcuse.Text := acceptRejectResponse.data.acuse;
		txtAcceptRejectMessage.Text := acceptRejectResponse.message;
	except
		txtAcceptRejectMessage.Text := acceptRejectResponse.message;
		txtAcceptRejectMessageDetail.Text := acceptRejectResponse.messageDetail;
	end;
end;

procedure TForm1.Button39Click(Sender: TObject);
var
 i:Integer;
	acceptRejectResponse: TCancelationAcceptRejectResponse;
begin
	acceptRejectResponse := CancelationAcceptRejectByXml(txtURL.Text, txtToken.Text, Memo5.Text);
	try
		txtAcceptRejectStatus.Text := acceptRejectResponse.status;
		txtAcceptRejectCodStatus.Text := acceptRejectResponse.codStatus;
		for i := Low(acceptRejectResponse.data.folios)
		to High(acceptRejectResponse.data.folios) do
		txtAcceptRejectFolios.Items.Add(acceptRejectResponse.data.folios[i].uuid);
		txtAcceptRejectAcuse.Text := acceptRejectResponse.data.acuse;
		txtAcceptRejectMessage.Text := acceptRejectResponse.message;
	except
		txtAcceptRejectMessage.Text := acceptRejectResponse.message;
		txtAcceptRejectMessageDetail.Text := acceptRejectResponse.messageDetail;
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

procedure TForm1.Button40Click(Sender: TObject);
 var
 i:Integer;
	acceptRejectResponse: TCancelationAcceptRejectResponse;
begin
	acceptRejectResponse := CancelationAcceptRejectByUuid(txtURL.Text, txtToken.Text, txtAcceptRejectRFC.Text, txtAcceptRejectUUID.Text,
	 txtAcceptRejectAccion.Text);
	try
		txtAcceptRejectStatus.Text := acceptRejectResponse.status;
		txtAcceptRejectCodStatus.Text := acceptRejectResponse.codStatus;
		for i := Low(acceptRejectResponse.data.folios)
		to High(acceptRejectResponse.data.folios) do
		txtAcceptRejectFolios.Items.Add(acceptRejectResponse.data.folios[i].uuid);
		txtAcceptRejectAcuse.Text := acceptRejectResponse.data.acuse;
		txtAcceptRejectMessage.Text := acceptRejectResponse.message;
	except
		txtAcceptRejectMessage.Text := acceptRejectResponse.message;
		txtAcceptRejectMessageDetail.Text := acceptRejectResponse.messageDetail;
	end;
end;

procedure TForm1.Button41Click(Sender: TObject);
var
	stream: TMemoryStream;
begin
	Memo5.Text := '';
	OpenDialog1.Filter := 'Archivos XML (*.xml)|*.xml|';
	stream := TMemoryStream.Create;

	if OpenDialog1.Execute then
		if FileExists(OpenDialog1.FileName) then
			stream.LoadFromFile(OpenDialog1.FileName)
		else
			raise Exception.Create('File does not exist.');
	Memo5.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
	url, token, xml: String;
	StampResponse: TStampResponseV1;
begin
	cleanIssueStamp();
	url := txtURL.Text;
	token := txtToken.Text;
	xml := txtIssue.Text;

	StampResponse := Issue.IssueV1(url, token, xml);
	try
		txtIssueTFD.Text := StampResponse.data.TFD;
	except
		txtIssueMessage.Text := UTF8ToWideString(StampResponse.message);
		txtIssueMessageDetail.Text := UTF8ToWideString(StampResponse.messageDetail);
	end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
	url, token, xml: String;
	StampResponse: TStampResponseV2;
begin
	cleanIssueStamp();
	url := txtURL.Text;
	token := txtToken.Text;
	xml := txtIssue.Text;

	StampResponse := Issue.IssueV2(url, token, xml);
	try
		txtIssueTfd.Text := StampResponse.data.TFD;
		txtIssueCfdi.Text := StampResponse.data.cfdi;
	except
		txtIssueMessage.Text := UTF8ToWideString(StampResponse.message);
		txtIssueMessageDetail.Text := UTF8ToWideString(StampResponse.messageDetail);
	end;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
	url, token, xml: String;
	StampResponse: TStampResponseV3;
begin
	cleanIssueStamp();
	url := txtURL.Text;
	token := txtToken.Text;
	xml := txtIssue.Text;

	StampResponse := Issue.IssueV3(url, token, xml);
	try
		txtIssueCfdi.Text := StampResponse.data.cfdi;
	except
		txtIssueMessage.Text := UTF8ToWideString(StampResponse.message);
		txtIssueMessageDetail.Text := UTF8ToWideString(StampResponse.messageDetail);
	end;
end;

procedure TForm1.Button7Click(Sender: TObject);
var
	url, token, xml: String;
	StampResponse: TStampResponseV4;
begin
	cleanIssueStamp();
	url := txtURL.Text;
	token := txtToken.Text;
	xml := stampXmlIn.Text;

	StampResponse := Issue.IssueV4(url, token, xml);
	try
		txtIssueCfdi.Text := StampResponse.data.cfdi;
		txtIssueCadOriSat.Text := StampResponse.data.cadenaOriginalSAT;
		txtIssueNoCertSat.Text := StampResponse.data.noCertificadoSAT;
		txtIssueNoCertCfdi.Text := StampResponse.data.noCertificadoSAT;
		txtIssueUuid.Text := StampResponse.data.uuid;
		txtIssueSelloSat.Text := StampResponse.data.selloSAT;
		txtIssueSelloCfdi.Text := StampResponse.data.noCertificadoSAT;
		txtIssueFechaTimbrado.Text := DateToStr(StampResponse.data.fechaTimbrado);
		txtIssueQr.Text := StampResponse.data.qrCode;

	except
		txtIssueMessage.Text := UTF8ToWideString(StampResponse.message);
		txtIssueMessageDetail.Text := UTF8ToWideString(StampResponse.messageDetail);
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
procedure TForm1.memoJsonChange(Sender: TObject);
var
  TextToProcess: string;
begin
  TextToProcess := memoJson.Text;

  TextToProcess := UTF8Encode(TextToProcess);

  memoJson.Text := TextToProcess;
end;

procedure TForm1.cleanIssueStamp();
begin
	 txtIssueTFD.Text := '';
	 txtIssueCFDI.Text := '';
	 txtIssueCadOriSAT.Text := '';
	 txtIssueNoCertSAT.Text := '';
	 txtIssueNoCertCFDI.Text := '';
	 txtIssueUUID.Text := '';
	 txtIssueSelloSAT.Text := '';
	 txtIssueSelloCFDI.Text := '';
	 txtIssueFechaTimbrado.Text := '';
	 txtIssueQr.Text := '';
	 txtIssueMessageDetail.Text := '';
end;

procedure TForm1.cleanJsonStamp();
begin
	txtJsonTfd.Text := '';
	txtJsonCfdi.Text := '';
	txtJsonNoCertificadoSat.Text := '';
	txtJsonCadenaOriginalSat.Text := '';
	txtJsonNoCertificadoSat.Text := '';
	txtJsonNoCertificadoCfdi.Text := '';
	txtJsonUuid.Text := '';
	txtJsonSelloSat.Text := '';
	txtJsonSelloCfdi.Text := '';
	txtJsonFechaDeTimbrado.Text := '';
	txtJsonCodigoQr.Text := '';
	txtJsonMessage.Text := '';
	txtJsonMessageDetail.Text := '';
end;

end.