![](https://camo.githubusercontent.com/e29b06fe1da0a7b612145240053c218c882cef71/687474703a2f2f737a696e74657a69732d6e65742e68752f77702d636f6e74656e742f75706c6f6164732f323031362f30382f64656c7068692e6a7067)

Para utilizar los servicios de SW con Delphi se debe tener importados en el proyecto todos los archivos **.PAS**.

## IDE Compatible ##

-   Para poder correr el ejemplo necesitas tener instalado Embarcadero® Delphi 10.2

## Incorporación del archivo .pas
La incorporación del archivo se realizará a través del menú superior "Project" y seleccionando "Add to Proyect". Buscamos nuestros archivos que nos sean necesarios y lo agregamos.

Antes de la utilización del mismo, debemos declararlo en los "uses" de nuestro programa, quedando algo así como lo siguiente.

```pascal
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
  CancelationRelationsResponse,
  BalanceResponse,
  Balance,
  BalanceRequest;
```

#  Authentication #
Este método recibirá una URL, Usuario y Password para la generación de un token.

Ejemplo de uso:
```pascal
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
```

# Account Balance #
Este método recibe una URL y el Token de la cuenta a revisar.

Ejemplo uso:
```pascal
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
```

# Timbrado #
Esta función recibe un XML sellado y lo envía a timbrar.

Existen 4 versiones de timbrado en nuestros servicios. Cada versión regresa distintos datos, los cuales son los siguientes:

 - v1 : regresa → TFD.
 - v2 : regresa → TFD y el CFDI.
 - v3 : regresa → CFDI y el TFD ya unidos.
 - v4 : regresa → CFDI, TFD, CadenaOriginal, noCertificadoSat, noCertificadoCFDI, UUID, selloSAT, selloCFDI, fechaTimbrado y QR.

Ejemplo de uso:
```pascal
procedure TForm1.btnTimbrarV4Click(Sender: TObject);
var
  url, token, xml: String;
  StampResponse: TStampResponseV4;
begin
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
```

# Emisión Timbrado #

Esta función recibe un XML sin sellar y lo envía a sellar + timbrar.

Existen 4 versiones de timbrado en nuestros servicios. Cada versión regresa distintos datos, los cuales son los siguientes:

 - v1 : regresa → TFD.
 - v2 : regresa → TFD y el CFDI.
 - v3 : regresa → CFDI y el TFD ya unidos.
 - v4 : regresa → CFDI, TFD, CadenaOriginal, noCertificadoSat, noCertificadoCFDI, UUID, selloSAT, selloCFDI, fechaTimbrado y QR.

Ejemplo de uso:
```pascal
procedure TForm1.Button7Click(Sender: TObject);
var
  url, token, xml: String;
  StampResponse: TStampResponseV4;
begin
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
```

# Emisión Timbrado JSON #
Esta función recibe un JSON bajo un formato definido, y lo envía a timbrar.

Existen 4 versiones de timbrado en nuestros servicios. Cada versión regresa distintos datos, los cuales son los siguientes:

 - v1 : regresa → TFD.
 - v2 : regresa → TFD y el CFDI.
 - v3 : regresa → CFDI y el TFD ya unidos.
 - v4 : regresa → CFDI, TFD, CadenaOriginal, noCertificadoSat, noCertificadoCFDI, UUID, selloSAT, selloCFDI, fechaTimbrado y QR.

Ejemplo de uso:
```pascal
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
```

# Cancelación #

Depende del método que se utilice, se cancela un CFDI.

## Cancelación por CSD ##

Mediante esta cancelación será necesario enviar la **URL**, el **Token**, el **UUID** de la factura, **RFC** emisor, **Certificado** en Base64, **Llave** en Base64 y **Password** del certificado.

Ejemplo de uso:
```pascal
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
```

## Cancelación por PFX ##

Mediante esta cancelación será necesario enviar la **URL**, el **Token**, el **UUID** de la factura, **RFC** emisor, **PFX** en Base64 y **Password** del certificado.

Ejemplo de uso:
```pascal
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
```
## Cancelación por XML ##

Mediante esta cancelación será necesario enviar la **URL**, el **Token** y el **XML** de cancelación.

Ejemplo de XML
```xml
<Cancelacion Fecha="2018-11-05T12:39:36" RfcEmisor="LAN7008173R5" xmlns="http://cancelacfd.sat.gob.mx" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Folios>
		<UUID>3741DE37-E4F0-4FCB-85B1-5C8BAD995B84</UUID>
	</Folios>
	<Signature xmlns="http://www.w3.org/2000/09/xmldsig#">
		<SignedInfo>
			<CanonicalizationMethod Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/>
			<SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/>
			<Reference URI="">
				<Transforms>
					<Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature"/>
				</Transforms>
				<DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
				<DigestValue>m42rt4ZsSZ/IOFdiMiYSnkO6kZo=</DigestValue>
			</Reference>
		</SignedInfo>
		<SignatureValue>aSf9fKJakK8j2e73vlw2UGKI/WSrQp5hXzPR4pI5D5G6ropIwLpVSNpkzqY0GPehvtNpXn/Ib3Dzsh2D7qulkIcD1EPl5omvR5vl2+MWJxv7X52LL55bbaHOS9J+evC7JkfY/6wqzMSNWc4JsTRZfqp6A7V8qnfErpAnaeF4cMoN1Nl7vaauCLImRo3/nKM2JG1XQy1qJU5y0MpdB3VVtsx/I8VKlNCsSjiX7xloRLDLNZ+oRYIkKFsmA9retF9SHQl1O50mjwXOV/G11yuNCG5naxVOtQPOGtqeTjexeJ9e6dA3/uOD2OxOIcbTgm32LxGNvGjyesF0HTZQnl9cVw==</SignatureValue>
		<KeyInfo>
			<X509Data>
				<X509IssuerSerial>
					<X509IssuerName>OID.1.2.840.113549.1.9.2=Responsable: ACDMA, OID.2.5.4.45=SAT970701NN3, L=Coyoacán, S=Distrito Federal, C=MX, PostalCode=06300, STREET=&quot;Av. Hidalgo 77, Col. Guerrero&quot;, E=asisnet@pruebas.sat.gob.mx, OU=Administración de Seguridad de la Información, O=Servicio de Administración Tributaria, CN=A.C. 2 de pruebas(4096)</X509IssuerName>
					<X509SerialNumber>286524172099382162235533054548081509963388170549</X509SerialNumber>
				</X509IssuerSerial>
				<X509Certificate>MIIFxTCCA62gAwIBAgIUMjAwMDEwMDAwMDAzMDAwMjI4MTUwDQYJKoZIhvcNAQELBQAwggFmMSAwHgYDVQQDDBdBLkMuIDIgZGUgcHJ1ZWJhcyg0MDk2KTEvMC0GA1UECgwmU2VydmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExODA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEgSW5mb3JtYWNpw7NuMSkwJwYJKoZIhvcNAQkBFhphc2lzbmV0QHBydWViYXMuc2F0LmdvYi5teDEmMCQGA1UECQwdQXYuIEhpZGFsZ28gNzcsIENvbC4gR3VlcnJlcm8xDjAMBgNVBBEMBTA2MzAwMQswCQYDVQQGEwJNWDEZMBcGA1UECAwQRGlzdHJpdG8gRmVkZXJhbDESMBAGA1UEBwwJQ295b2Fjw6FuMRUwEwYDVQQtEwxTQVQ5NzA3MDFOTjMxITAfBgkqhkiG9w0BCQIMElJlc3BvbnNhYmxlOiBBQ0RNQTAeFw0xNjEwMjUyMTUyMTFaFw0yMDEwMjUyMTUyMTFaMIGxMRowGAYDVQQDExFDSU5ERU1FWCBTQSBERSBDVjEaMBgGA1UEKRMRQ0lOREVNRVggU0EgREUgQ1YxGjAYBgNVBAoTEUNJTkRFTUVYIFNBIERFIENWMSUwIwYDVQQtExxMQU43MDA4MTczUjUgLyBGVUFCNzcwMTE3QlhBMR4wHAYDVQQFExUgLyBGVUFCNzcwMTE3TURGUk5OMDkxFDASBgNVBAsUC1BydWViYV9DRkRJMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAgvvCiCFDFVaYX7xdVRhp/38ULWto/LKDSZy1yrXKpaqFXqERJWF78YHKf3N5GBoXgzwFPuDX+5kvY5wtYNxx/Owu2shNZqFFh6EKsysQMeP5rz6kE1gFYenaPEUP9zj+h0bL3xR5aqoTsqGF24mKBLoiaK44pXBzGzgsxZishVJVM6XbzNJVonEUNbI25DhgWAd86f2aU3BmOH2K1RZx41dtTT56UsszJls4tPFODr/caWuZEuUvLp1M3nj7Dyu88mhD2f+1fA/g7kzcU/1tcpFXF/rIy93APvkU72jwvkrnprzs+SnG81+/F16ahuGsb2EZ88dKHwqxEkwzhMyTbQIDAQABox0wGzAMBgNVHRMBAf8EAjAAMAsGA1UdDwQEAwIGwDANBgkqhkiG9w0BAQsFAAOCAgEAJ/xkL8I+fpilZP+9aO8n93+20XxVomLJjeSL+Ng2ErL2GgatpLuN5JknFBkZAhxVIgMaTS23zzk1RLtRaYvH83lBH5E+M+kEjFGp14Fne1iV2Pm3vL4jeLmzHgY1Kf5HmeVrrp4PU7WQg16VpyHaJ/eonPNiEBUjcyQ1iFfkzJmnSJvDGtfQK2TiEolDJApYv0OWdm4is9Bsfi9j6lI9/T6MNZ+/LM2L/t72Vau4r7m94JDEzaO3A0wHAtQ97fjBfBiO5M8AEISAV7eZidIl3iaJJHkQbBYiiW2gikreUZKPUX0HmlnIqqQcBJhWKRu6Nqk6aZBTETLLpGrvF9OArV1JSsbdw/ZH+P88RAt5em5/gjwwtFlNHyiKG5w+UFpaZOK3gZP0su0sa6dlPeQ9EL4JlFkGqQCgSQ+NOsXqaOavgoP5VLykLwuGnwIUnuhBTVeDbzpgrg9LuF5dYp/zs+Y9ScJqe5VMAagLSYTShNtN8luV7LvxF9pgWwZdcM7lUwqJmUddCiZqdngg3vzTactMToG16gZA4CWnMgbU4E+r541+FNMpgAZNvs2CiW/eApfaaQojsZEAHDsDv4L5n3M1CC7fYjE/d61aSng1LaO6T1mh+dEfPvLzp7zyzz+UgWMhi5Cs4pcXx1eic5r7uxPoBwcCTt3YI1jKVVnV7/w=</X509Certificate>
			</X509Data>
		</KeyInfo>
	</Signature>
</Cancelacion>
```


Ejemplo de uso:
```pascal
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
```
## Cancelación por UUID ##

Mediante esta cancelación será necesario enviar la **URL**, el **Token** y el **UUID** de la factura.

Ejemplo de uso:
```pascal
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
```

# Validación #
Métodos mediante los cuales se verifican datos o documentos.

## Validación XML ##
Este método recibe un **XML**, una **URL**, y un **Token**.

Ejemplo de uso:
```pascal
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
```

## Validación de LRFC ##
Este método recibe un **RFC**, una **URL**, y un **Token**. 

Ejemplo de uso:
```pascal
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
```

## Validación de LCO ##
Este método recibe un **Número de Certificado**, una **URL**, y un **Token**. 

Ejemplo de uso:
```pascal
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
```

# Consulta Solicitudes pendientes por Aceptar/Rechazar #
Método mediante el cual obtendremos una lista de UUID asociada a un RFC que nos dirá cuales facturas nos enviaron para que aceptemos o rechacemos.
El método requiere de la URL, Token, y RFC.

Ejemplo de consumo
```pascal
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
```
# Aceptar/Rechazar Cancelación #
Método mediante el cual responderemos aquellos UUID que teníamos pendientes. El servicio soporta la aceptación o rechazo de las facturas.
Los parámetros necesarios para el consumo, son dependientes de la forma.
## Aceptar/Rechazar por CSD ##
Necesitaremos URL, Token, RFC Receptor, UUID, Acción, Key b64, CSD b64 y password del CSD.
Ejemplo de uso
```pascal
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
```
## Aceptar/Rechazar por PFX ##
Necesitaremos URL, Token, RFC Receptor, UUID, Acción, PFX b64 y password del PFX.
Ejemplo de uso
```pascal
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
```

## Aceptar/Rechazar por XML ##
Necesitaremos URL, Token y el XML para aceptar/rechazar.
**Ejemplo de XML**
```xml
<SolicitudAceptacionRechazo Fecha="2018-09-20T14:48:09" RfcPacEnviaSolicitud="AAA010101AAA" RfcReceptor="LAN7008173R5" xmlns="http://cancelacfd.sat.gob.mx" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Folios>
		<UUID>FD74D156-B9B0-44A5-9906-E08182E8363E</UUID>
		<Respuesta>Aceptacion</Respuesta>
	</Folios>
	<Signature xmlns="http://www.w3.org/2000/09/xmldsig#">
		<SignedInfo>
			<CanonicalizationMethod Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/>
			<SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/>
			<Reference URI="">
				<Transforms>
					<Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature"/>
				</Transforms>
				<DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
				<DigestValue>QlfpYnalZKv6WAv33vZwMME7noA=</DigestValue>
			</Reference>
		</SignedInfo>
		<SignatureValue>dwhdSsuP64IFJMuR0sogqxpcQqlN9zq4tBXK6KHGTPMlC/xSXEi30L5SD6ogeCHpu3G2NzaXrE6wRxc8kRLOuSy/LxVEPUJi5HgYnfJMBWSq/EVccf2DD6JY4ihAtgdko7E26liY3RcqczfF9ujh98FC3eu9i1IJCJ9isIZYPqTvthwOtKEQVFvSfeA0wE7aVz1z1wBVur0wnIFHz13//SUHRgHMWrJ9m5pLuH5zVv+MU80dmmrNQ7EXz3krCDj7JMh6/I1ftgYsJMsUzwhcYgy7v9FTGrz3tkn/j8Gq1dWWYcqTtqHUcQtSpdCLgw6d9KojpUsqN5WVVb+HFe2uCA==</SignatureValue>
		<KeyInfo>
			<X509Data>
				<X509IssuerSerial>
					<X509IssuerName>OID.1.2.840.113549.1.9.2=Responsable: ACDMA, OID.2.5.4.45=SAT970701NN3, L=Coyoacán, S=Distrito Federal, C=MX, PostalCode=06300, STREET=&quot;Av. Hidalgo 77, Col. Guerrero&quot;, E=asisnet@pruebas.sat.gob.mx, OU=Administración de Seguridad de la Información, O=Servicio de Administración Tributaria, CN=A.C. 2 de pruebas(4096)</X509IssuerName>
					<X509SerialNumber>286524172099382162235533054548081509963388170549</X509SerialNumber>
				</X509IssuerSerial>
				<X509Certificate>MIIFxTCCA62gAwIBAgIUMjAwMDEwMDAwMDAzMDAwMjI4MTUwDQYJKoZIhvcNAQELBQAwggFmMSAwHgYDVQQDDBdBLkMuIDIgZGUgcHJ1ZWJhcyg0MDk2KTEvMC0GA1UECgwmU2VydmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExODA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEgSW5mb3JtYWNpw7NuMSkwJwYJKoZIhvcNAQkBFhphc2lzbmV0QHBydWViYXMuc2F0LmdvYi5teDEmMCQGA1UECQwdQXYuIEhpZGFsZ28gNzcsIENvbC4gR3VlcnJlcm8xDjAMBgNVBBEMBTA2MzAwMQswCQYDVQQGEwJNWDEZMBcGA1UECAwQRGlzdHJpdG8gRmVkZXJhbDESMBAGA1UEBwwJQ295b2Fjw6FuMRUwEwYDVQQtEwxTQVQ5NzA3MDFOTjMxITAfBgkqhkiG9w0BCQIMElJlc3BvbnNhYmxlOiBBQ0RNQTAeFw0xNjEwMjUyMTUyMTFaFw0yMDEwMjUyMTUyMTFaMIGxMRowGAYDVQQDExFDSU5ERU1FWCBTQSBERSBDVjEaMBgGA1UEKRMRQ0lOREVNRVggU0EgREUgQ1YxGjAYBgNVBAoTEUNJTkRFTUVYIFNBIERFIENWMSUwIwYDVQQtExxMQU43MDA4MTczUjUgLyBGVUFCNzcwMTE3QlhBMR4wHAYDVQQFExUgLyBGVUFCNzcwMTE3TURGUk5OMDkxFDASBgNVBAsUC1BydWViYV9DRkRJMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAgvvCiCFDFVaYX7xdVRhp/38ULWto/LKDSZy1yrXKpaqFXqERJWF78YHKf3N5GBoXgzwFPuDX+5kvY5wtYNxx/Owu2shNZqFFh6EKsysQMeP5rz6kE1gFYenaPEUP9zj+h0bL3xR5aqoTsqGF24mKBLoiaK44pXBzGzgsxZishVJVM6XbzNJVonEUNbI25DhgWAd86f2aU3BmOH2K1RZx41dtTT56UsszJls4tPFODr/caWuZEuUvLp1M3nj7Dyu88mhD2f+1fA/g7kzcU/1tcpFXF/rIy93APvkU72jwvkrnprzs+SnG81+/F16ahuGsb2EZ88dKHwqxEkwzhMyTbQIDAQABox0wGzAMBgNVHRMBAf8EAjAAMAsGA1UdDwQEAwIGwDANBgkqhkiG9w0BAQsFAAOCAgEAJ/xkL8I+fpilZP+9aO8n93+20XxVomLJjeSL+Ng2ErL2GgatpLuN5JknFBkZAhxVIgMaTS23zzk1RLtRaYvH83lBH5E+M+kEjFGp14Fne1iV2Pm3vL4jeLmzHgY1Kf5HmeVrrp4PU7WQg16VpyHaJ/eonPNiEBUjcyQ1iFfkzJmnSJvDGtfQK2TiEolDJApYv0OWdm4is9Bsfi9j6lI9/T6MNZ+/LM2L/t72Vau4r7m94JDEzaO3A0wHAtQ97fjBfBiO5M8AEISAV7eZidIl3iaJJHkQbBYiiW2gikreUZKPUX0HmlnIqqQcBJhWKRu6Nqk6aZBTETLLpGrvF9OArV1JSsbdw/ZH+P88RAt5em5/gjwwtFlNHyiKG5w+UFpaZOK3gZP0su0sa6dlPeQ9EL4JlFkGqQCgSQ+NOsXqaOavgoP5VLykLwuGnwIUnuhBTVeDbzpgrg9LuF5dYp/zs+Y9ScJqe5VMAagLSYTShNtN8luV7LvxF9pgWwZdcM7lUwqJmUddCiZqdngg3vzTactMToG16gZA4CWnMgbU4E+r541+FNMpgAZNvs2CiW/eApfaaQojsZEAHDsDv4L5n3M1CC7fYjE/d61aSng1LaO6T1mh+dEfPvLzp7zyzz+UgWMhi5Cs4pcXx1eic5r7uxPoBwcCTt3YI1jKVVnV7/w=</X509Certificate>
			</X509Data>
		</KeyInfo>
	</Signature>
</SolicitudAceptacionRechazo>
```

Ejemplo de uso
```pascal
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
```

## Aceptar/Rechazar por UUID ##
Necesitaremos URL, Token, RFC Receptor, UUID, Acción. 
**Importante:** El Servicio requiere los CSD y KEY en el administrador de timbres para funcionar.
Ejemplo de uso
```pascal
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
```

# Consulta de Documentos Relacionados #
Método mediante el cual consultamos las facturas que se encuentras relacionadas a otra factura (UUID).
Los parámetros necesarios para el consumo, son dependientes de la forma.
## Relacionados por CSD ##
Necesitaremos URL, Token, RFC Receptor, UUID, Key b64, CSD b64 y password del CSD.
Ejemplo de uso
```pascal
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
```
## Relacionados por PFX ##
Necesitaremos URL, Token, RFC Receptor, UUID, PFX b64 y password del PFX.
Ejemplo de uso
```pascal
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
```

## Relacionados por XML ##
Necesitaremos URL, Token y el XML para consulta de Relacionados.
**Ejemplo de XML**
```xml
<PeticionConsultaRelacionados RfcPacEnviaSolicitud="DAL050601L35" RfcReceptor="LAN7008173R5" Uuid="A618EA43-28A8-48B6-8F2A-6C8C6702445C" xmlns="http://cancelacfd.sat.gob.mx" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Signature xmlns="http://www.w3.org/2000/09/xmldsig#">
		<SignedInfo>
			<CanonicalizationMethod Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/>
			<SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/>
			<Reference URI="">
				<Transforms>
					<Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature"/>
				</Transforms>
				<DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
				<DigestValue>j1LztfbU/WUKkr/0K9UiMERr0Fc=</DigestValue>
			</Reference>
		</SignedInfo>
		<SignatureValue>dOVqJ0nazPfpo3XGCaGQJsNZf7D4dMol2fnKxQZPhrYOOhccz9jokIVhT8MbG4kn2iQPmEom/HIXK9adirlJjV8paCYL2Aw+R0B1FueP7tkep+66iuA6vjFyExFHtzVFNsJkI8QM4FyuS+HpWtB6KuzoqUjbJroemmgHN2f6MzGxwjZ0pmNL4a7h73qUCDmAkUUwJxWm85WFa7BbKk5UUB+d2vgumtHau3M6fvjcsdWbxqaRxyEp0iSjfQsHuaGLxgqPhIM1rQ5uM8cQkhQIH4HJVH93uNa+/p/ENbLPpfGZmU/CQbT0TAv0S/UR/3I7KgzhUvyMzVmBNrLLv0e+tg==</SignatureValue>
		<KeyInfo>
			<X509Data>
				<X509IssuerSerial>
					<X509IssuerName>OID.1.2.840.113549.1.9.2=Responsable: ACDMA, OID.2.5.4.45=SAT970701NN3, L=Coyoacán, S=Distrito Federal, C=MX, PostalCode=06300, STREET=&quot;Av. Hidalgo 77, Col. Guerrero&quot;, E=asisnet@pruebas.sat.gob.mx, OU=Administración de Seguridad de la Información, O=Servicio de Administración Tributaria, CN=A.C. 2 de pruebas(4096)</X509IssuerName>
					<X509SerialNumber>286524172099382162235533054548081509963388170549</X509SerialNumber>
				</X509IssuerSerial>
				<X509Certificate>MIIFxTCCA62gAwIBAgIUMjAwMDEwMDAwMDAzMDAwMjI4MTUwDQYJKoZIhvcNAQELBQAwggFmMSAwHgYDVQQDDBdBLkMuIDIgZGUgcHJ1ZWJhcyg0MDk2KTEvMC0GA1UECgwmU2VydmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExODA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEgSW5mb3JtYWNpw7NuMSkwJwYJKoZIhvcNAQkBFhphc2lzbmV0QHBydWViYXMuc2F0LmdvYi5teDEmMCQGA1UECQwdQXYuIEhpZGFsZ28gNzcsIENvbC4gR3VlcnJlcm8xDjAMBgNVBBEMBTA2MzAwMQswCQYDVQQGEwJNWDEZMBcGA1UECAwQRGlzdHJpdG8gRmVkZXJhbDESMBAGA1UEBwwJQ295b2Fjw6FuMRUwEwYDVQQtEwxTQVQ5NzA3MDFOTjMxITAfBgkqhkiG9w0BCQIMElJlc3BvbnNhYmxlOiBBQ0RNQTAeFw0xNjEwMjUyMTUyMTFaFw0yMDEwMjUyMTUyMTFaMIGxMRowGAYDVQQDExFDSU5ERU1FWCBTQSBERSBDVjEaMBgGA1UEKRMRQ0lOREVNRVggU0EgREUgQ1YxGjAYBgNVBAoTEUNJTkRFTUVYIFNBIERFIENWMSUwIwYDVQQtExxMQU43MDA4MTczUjUgLyBGVUFCNzcwMTE3QlhBMR4wHAYDVQQFExUgLyBGVUFCNzcwMTE3TURGUk5OMDkxFDASBgNVBAsUC1BydWViYV9DRkRJMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAgvvCiCFDFVaYX7xdVRhp/38ULWto/LKDSZy1yrXKpaqFXqERJWF78YHKf3N5GBoXgzwFPuDX+5kvY5wtYNxx/Owu2shNZqFFh6EKsysQMeP5rz6kE1gFYenaPEUP9zj+h0bL3xR5aqoTsqGF24mKBLoiaK44pXBzGzgsxZishVJVM6XbzNJVonEUNbI25DhgWAd86f2aU3BmOH2K1RZx41dtTT56UsszJls4tPFODr/caWuZEuUvLp1M3nj7Dyu88mhD2f+1fA/g7kzcU/1tcpFXF/rIy93APvkU72jwvkrnprzs+SnG81+/F16ahuGsb2EZ88dKHwqxEkwzhMyTbQIDAQABox0wGzAMBgNVHRMBAf8EAjAAMAsGA1UdDwQEAwIGwDANBgkqhkiG9w0BAQsFAAOCAgEAJ/xkL8I+fpilZP+9aO8n93+20XxVomLJjeSL+Ng2ErL2GgatpLuN5JknFBkZAhxVIgMaTS23zzk1RLtRaYvH83lBH5E+M+kEjFGp14Fne1iV2Pm3vL4jeLmzHgY1Kf5HmeVrrp4PU7WQg16VpyHaJ/eonPNiEBUjcyQ1iFfkzJmnSJvDGtfQK2TiEolDJApYv0OWdm4is9Bsfi9j6lI9/T6MNZ+/LM2L/t72Vau4r7m94JDEzaO3A0wHAtQ97fjBfBiO5M8AEISAV7eZidIl3iaJJHkQbBYiiW2gikreUZKPUX0HmlnIqqQcBJhWKRu6Nqk6aZBTETLLpGrvF9OArV1JSsbdw/ZH+P88RAt5em5/gjwwtFlNHyiKG5w+UFpaZOK3gZP0su0sa6dlPeQ9EL4JlFkGqQCgSQ+NOsXqaOavgoP5VLykLwuGnwIUnuhBTVeDbzpgrg9LuF5dYp/zs+Y9ScJqe5VMAagLSYTShNtN8luV7LvxF9pgWwZdcM7lUwqJmUddCiZqdngg3vzTactMToG16gZA4CWnMgbU4E+r541+FNMpgAZNvs2CiW/eApfaaQojsZEAHDsDv4L5n3M1CC7fYjE/d61aSng1LaO6T1mh+dEfPvLzp7zyzz+UgWMhi5Cs4pcXx1eic5r7uxPoBwcCTt3YI1jKVVnV7/w=</X509Certificate>
			</X509Data>
		</KeyInfo>
	</Signature>
</PeticionConsultaRelacionados>
```

Ejemplo de uso
```pascal
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
```

## Relacionados por UUID ##
Necesitaremos URL, Token, RFC Receptor y UUID. 
**Importante:** El Servicio requiere los CSD y KEY en el administrador de timbres para funcionar.
Ejemplo de uso
```pascal
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
```