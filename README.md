# SDK Visual Delphi 
[![SW sapien](https://dka575ofm4ao0.cloudfront.net/pages-transactional_logos/retina/68712/SW_smarter-Servicios_web.png)](http://sw.com.mx/)

Librería Visual delphi para el consumo de los servicios de SW sapien®.



### Compatibilidad
- Embarcadero® Delphi
- RAD Studio
---
### Instalación
Para utilizar los servicios de SW con Delphi se debe tener importados en el proyecto todos los archivos **.PAS**.


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
---

## Authentication ##
El servicio de Autenticación es utilizado principalmente para obtener el **token** el cual será utilizado para poder timbrar nuestro CFDI (xml) ya emitido (sellado), para poder utilizar este servicio es necesario que cuente con un **usuario** y **contraseña**

<details>
<summary>
Ejemplo de uso:
</summary>
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
</details>

# Account Balance #
Método mediante el cual puedes realizar la consulta de tu saldo para consumir los servicios de SW.
Este método recibe una URL y el Token de la cuenta a revisar.

<details>
<summary>
Ejemplo de uso:
</summary>
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
</details>

# Timbrado #

<details>
<summary>
Timbrado CFDI V1
</summary>

Esta función recibe un XML sellado y lo envía a timbrar.

**TimbrarV1** Recibe el contenido de un **XML** sellado en formato **String**, posteriormente si la factura y el token son correctos devuelve el complemento timbre en un string (**TFD**), en caso contrario lanza una excepción.

Ejemplo de uso:
```pascal
procedure TForm1.btnTimbrarV1Click(Sender: TObject);
var
  url, token, xml: String;
  StampResponse: TStampResponseV1;
begin
  url := txtURL.Text;
  token := txtToken.Text;
  xml := stampXmlIn.Text;

  StampResponse := Stamp.StampV4(url, token, xml);
  try
    txtCfdi.Text := StampResponse.data.tfd;
  except
    txtMessageStamp.Text := UTF8ToWideString(StampResponse.message);
    txtMessageDetailStamp.Text := UTF8ToWideString(StampResponse.messageDetail);
	end;
end;
```
</details>

<details>
<summary>
Emisión Timbrado V1
</summary>


**Emisión Timbrado** Realiza el sellado y timbrado de un comprobante CFDI. Recibe el contenido de un **XML** en formato **String**, posteriormente si la factura y el token son correctos devuelve el complemento timbre en un string (**TFD**), en caso contrario lanza una excepción.


Ejemplo de uso:
```pascal
procedure TForm1.Button7Click(Sender: TObject);
var
  url, token, xml: String;
  StampResponse: TStampResponseV1;
begin
  url := txtURL.Text;
  token := txtToken.Text;
  xml := stampXmlIn.Text;

	StampResponse := Issue.IssueV1(url, token, xml);
  try
		txtIssueCfdi.Text := StampResponse.data.tfd;

	except
		txtIssueMessage.Text := UTF8ToWideString(StampResponse.message);
		txtIssueMessageDetail.Text := UTF8ToWideString(StampResponse.messageDetail);
  end;
end;
```
</details>

<details>
<summary>
Emisión Timbrado JSON V1
</summary>

# Emisión Timbrado JSON #
**Emisión Timbrado JSON** Realiza el sellado y timbrado de un. Recibe un **JSON** bajo un formato definido, posteriormente si la factura y el token son correctos devuelve el complemento timbre en un string (**TFD**), en caso contrario lanza una excepción.


Ejemplo de uso:
```pascal
procedure TForm1.Button15Click(Sender: TObject);
var
  jsonEmision: TStampResponseV1;
begin
  jsonEmision := JsonIssue.IssueJsonV1(txtURL.Text, txtToken.Text,
    memoJson.Text);
  try
    txtJsonCfdi.Text := jsonEmision.data.tfd;
  except
    txtJsonMessage.Text := jsonEmision.message;
    txtJsonMessageDetail.Text := jsonEmision.messageDetail;
  end;
end;
```
</details>

:pushpin: ***NOTA:*** Existen varias versiones de respuesta, las cuales son las siguientes:

| Version |                         Respuesta                             | 
|---------|---------------------------------------------------------------|
|  V1     | Devuelve el timbre fiscal digital                             | 
|  V2     | Devuelve el timbre fiscal digital y el CFDI timbrado          | 
|  V3     | Devuelve el CFDI timbrado                                     | 
|  V4     | Devuelve todos los datos del timbrado                         |

Para mayor referencia de estas versiones de respuesta, favor de visitar el siguiente [link](https://developers.sw.com.mx/knowledge-base/versiones-de-respuesta-timbrado/).

# Cancelación #

Este servicio se utiliza para cancelar documentos xml y se puede hacer mediante varios métodos **Cancelación CSD**, **Cancelación PFX**, **Cancelacion por XML** y **Cancelación UUID**.

<details>
<summary>
Cancelación por CSD
</summary>

Este método recibe los siguientes parámetros:
* Usuario y contraseña o token
* Url Servicios SW
* Certificado (.cer) en **Base64**
* Key (.key) en **Base64**
* RFC emisor
* Password del archivo key
* UUID
* Motivo

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
</details>

<details>
<summary>
Cancelación por PFX
</summary>

Este método recibe los siguientes parámetros:
* Usuario y contraseña o token
* Url Servicios SW
* Archivo PFX en **Base64**
* RFC emisor
* Password (CSD)
* UUID
* Motivo

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
</details>

<details>
<summary>
Cancelación por XML
</summary>

Este método recibe los siguientes parámetros:
* Usuario y contraseña o token
* Url Servicios SW
* XML sellado con los UUID a cancelar.

Ejemplo de XML
```xml
<Cancelacion xmlns="http://cancelacfd.sat.gob.mx"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" Fecha="2021-12-26T18:15:28" RfcEmisor="EKU9003173C9">
    <Folios>
        <Folio UUID="fe4e71b0-8959-4fb9-8091-f5ac4fb0fef8" Motivo="02" FolioSustitucion=""/>
    </Folios>
    <Signature xmlns="http://www.w3.org/2000/09/xmldsig#">
        <SignedInfo>
            <CanonicalizationMethod Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315" />
            <SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1" />
            <Reference URI="">
                <Transforms>
                    <Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature" />
                </Transforms>
                <DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1" />
                <DigestValue>XEdUtCptjdlz9DsYAP7nnU6MytU=</DigestValue>
            </Reference>
        </SignedInfo>
        <SignatureValue>ZnWh91e5tUc4/t1ZWnb3yOgB8zuCXNPioND+rv6aLOEwIw26/8sYYb+GT4wgyqlc09wOs32XTUwWoGQwtWMG8Euqq+4xJyobWvPCsX6CiURvD/Pd33xgkH92A0AGQxEMYGVT7wK+GFS2gDTYEYAXvZqzCe6+rXnlQvHML0TOOmhVu/wc8YrCbGt4z/F5sRxhjpa0eqwFEq4RmB4nkWjcD3Pnudn3XAI5NHIiOd8KVGVcDR+LvYvKj7h+18WxZgujpggYjbFN79i1jEsAEPDfgryUdTvjDw+KC7Mg+/ge6pssH42buEMIwVE4VX9Y3NtWSGTwdIK/8pxXk+Y5wyR6Gg==</SignatureValue>
        <KeyInfo>
            <X509Data>
                <X509IssuerSerial>
                    <X509IssuerName>OID.1.2.840.113549.1.9.2=responsable: ACDMA-SAT, OID.2.5.4.45=2.5.4.45, L=COYOACAN, S=CIUDAD DE MEXICO, C=MX, PostalCode=06370, STREET=3ra cerrada de cadiz, E=oscar.martinez@sat.gob.mx, OU=SAT-IES Authority, O=SERVICIO DE ADMINISTRACION TRIBUTARIA, CN=AC UAT</X509IssuerName>
                    <X509SerialNumber>292233162870206001759766198444326234574038512436</X509SerialNumber>
                </X509IssuerSerial>
                <X509Certificate>MIIFuzCCA6OgAwIBAgIUMzAwMDEwMDAwMDA0MDAwMDI0MzQwDQYJKoZIhvcNAQELBQAwggErMQ8wDQYDVQQDDAZBQyBVQVQxLjAsBgNVBAoMJVNFUlZJQ0lPIERFIEFETUlOSVNUUkFDSU9OIFRSSUJVVEFSSUExGjAYBgNVBAsMEVNBVC1JRVMgQXV0aG9yaXR5MSgwJgYJKoZIhvcNAQkBFhlvc2Nhci5tYXJ0aW5lekBzYXQuZ29iLm14MR0wGwYDVQQJDBQzcmEgY2VycmFkYSBkZSBjYWRpejEOMAwGA1UEEQwFMDYzNzAxCzAJBgNVBAYTAk1YMRkwFwYDVQQIDBBDSVVEQUQgREUgTUVYSUNPMREwDwYDVQQHDAhDT1lPQUNBTjERMA8GA1UELRMIMi41LjQuNDUxJTAjBgkqhkiG9w0BCQITFnJlc3BvbnNhYmxlOiBBQ0RNQS1TQVQwHhcNMTkwNjE3MTk0NDE0WhcNMjMwNjE3MTk0NDE0WjCB4jEnMCUGA1UEAxMeRVNDVUVMQSBLRU1QRVIgVVJHQVRFIFNBIERFIENWMScwJQYDVQQpEx5FU0NVRUxBIEtFTVBFUiBVUkdBVEUgU0EgREUgQ1YxJzAlBgNVBAoTHkVTQ1VFTEEgS0VNUEVSIFVSR0FURSBTQSBERSBDVjElMCMGA1UELRMcRUtVOTAwMzE3M0M5IC8gWElRQjg5MTExNlFFNDEeMBwGA1UEBRMVIC8gWElRQjg5MTExNk1HUk1aUjA1MR4wHAYDVQQLExVFc2N1ZWxhIEtlbXBlciBVcmdhdGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCN0peKpgfOL75iYRv1fqq+oVYsLPVUR/GibYmGKc9InHFy5lYF6OTYjnIIvmkOdRobbGlCUxORX/tLsl8Ya9gm6Yo7hHnODRBIDup3GISFzB/96R9K/MzYQOcscMIoBDARaycnLvy7FlMvO7/rlVnsSARxZRO8Kz8Zkksj2zpeYpjZIya/369+oGqQk1cTRkHo59JvJ4Tfbk/3iIyf4H/Ini9nBe9cYWo0MnKob7DDt/vsdi5tA8mMtA953LapNyCZIDCRQQlUGNgDqY9/8F5mUvVgkcczsIgGdvf9vMQPSf3jjCiKj7j6ucxl1+FwJWmbvgNmiaUR/0q4m2rm78lFAgMBAAGjHTAbMAwGA1UdEwEB/wQCMAAwCwYDVR0PBAQDAgbAMA0GCSqGSIb3DQEBCwUAA4ICAQBcpj1TjT4jiinIujIdAlFzE6kRwYJCnDG08zSp4kSnShjxADGEXH2chehKMV0FY7c4njA5eDGdA/G2OCTPvF5rpeCZP5Dw504RZkYDl2suRz+wa1sNBVpbnBJEK0fQcN3IftBwsgNFdFhUtCyw3lus1SSJbPxjLHS6FcZZ51YSeIfcNXOAuTqdimusaXq15GrSrCOkM6n2jfj2sMJYM2HXaXJ6rGTEgYmhYdwxWtil6RfZB+fGQ/H9I9WLnl4KTZUS6C9+NLHh4FPDhSk19fpS2S/56aqgFoGAkXAYt9Fy5ECaPcULIfJ1DEbsXKyRdCv3JY89+0MNkOdaDnsemS2o5Gl08zI4iYtt3L40gAZ60NPh31kVLnYNsmvfNxYyKp+AeJtDHyW9w7ftM0Hoi+BuRmcAQSKFV3pk8j51la+jrRBrAUv8blbRcQ5BiZUwJzHFEKIwTsRGoRyEx96sNnB03n6GTwjIGz92SmLdNl95r9rkvp+2m4S6q1lPuXaFg7DGBrXWC8iyqeWE2iobdwIIuXPTMVqQb12m1dAkJVRO5NdHnP/MpqOvOgLqoZBNHGyBg4Gqm4sCJHCxA1c8Elfa2RQTCk0tAzllL4vOnI1GHkGJn65xokGsaU4B4D36xh7eWrfj4/pgWHmtoDAYa8wzSwo2GVCZOs+mtEgOQB91/g==</X509Certificate>
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
</details>

<details>
<summary>
Cancelación por UUID
</summary>

Este método recibe los siguientes parámetros:
* Usuario y contraseña o token
* Url Servicios SW
* RFC emisor
* UUID
* Motivo

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
</details>

# Consulta Solicitudes pendientes por Aceptar/Rechazar #
Método mediante el cual obtendremos una lista de UUID asociada a un RFC que nos dirá cuales facturas nos enviaron para que aceptemos o rechacemos.
El método requiere de la URL, Token, y RFC.

<details>
  <summary>Ejemplo</summary>
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
</details>

# Aceptar/Rechazar Cancelación #
Método mediante el cual responderemos aquellos UUID que teníamos pendientes. El servicio soporta la aceptación o rechazo de las facturas.
Los parámetros necesarios para el consumo, son dependientes de la forma.
<details>
<summary>
Aceptar / Rechazar por CSD
</summary>
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
</details>

<details>
<summary>
Aceptar / Rechazar por PFX
</summary>

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
</details>

<details>
<summary>
Aceptar / Rechazar por XML
</summary>

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
</details>

<details>
<summary>
Aceptar / Rechazar por UUID
</summary>

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
</details>

# Consulta de Documentos Relacionados #
Método mediante el cual consultamos las facturas que se encuentras relacionadas a otra factura (UUID).
Los parámetros necesarios para el consumo, son dependientes de la forma.
<details>
<summary>
Relacionados por CSD
</summary>
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
</details>

<details>
<summary>
Relacionados por PFX
</summary>
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
</details>

<details>
<summary>
Relacionados por XML
</summary>
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
</details>

<details>
<summary>
Relacionados por UUID
</summary>

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
</details>

# Validación #
Métodos mediante los cuales se verifican datos o documentos.

Este servicio recibe un comprobante CFDI en formato XML mediante el cual se valida integridad, sello, errores de estructura, matriz de errores del SAT incluyendo complementos, se valida que exista en el SAT, así como el estatus en el SAT.

Este método recibe los siguientes parámetros:
* Url Servicios SW
* Usuario y contraseña o token
* XML

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
```
