[![](https://camo.githubusercontent.com/e29b06fe1da0a7b612145240053c218c882cef71/687474703a2f2f737a696e74657a69732d6e65742e68752f77702d636f6e74656e742f75706c6f6164732f323031362f30382f64656c7068692e6a7067)](https://camo.githubusercontent.com/e29b06fe1da0a7b612145240053c218c882cef71/687474703a2f2f737a696e74657a69732d6e65742e68752f77702d636f6e74656e742f75706c6f6164732f323031362f30382f64656c7068692e6a7067)

[![](https://camo.githubusercontent.com/cae95d2d0cad625452f72543c68fb37930ece9c2/687474703a2f2f73772e636f6d2e6d782f696d616765732f6c6f676f2e706e67)](https://camo.githubusercontent.com/cae95d2d0cad625452f72543c68fb37930ece9c2/687474703a2f2f73772e636f6d2e6d782f696d616765732f6c6f676f2e706e67)

Para utilizar los servicios de SW con Delphi se debe tener primeramente el fichero PAS correspondiente a  **SWSDK.pas**.

## IDE Compatible ##

-   Para poder correr el ejemplo necesitas tener instalado Embarcadero® Delphi 10.2

## Incorporación del archivo .pas
La incorporación del archivo se realizará a través del menú superior "Project" y seleccionando "Add to Proyect". Buscamos nuestro archivo "SWSDK.pas" y lo agregamos.

Antes de la utilización del mismo, debemos declararlo en los "uses" de nuestro programa, quedando algo así como lo siguiente.

```delphi
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, SWSDK, StrUtils, EncdDecd;
```

#  Authentication #
Este método recibirá una URL, Usuario y Password para la generación de un token.
Ejemplo de uso
```
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
```

# Account Balance #
Este método recibe una URL y el Token de la cuenta a revisar.

Ejemplo uso:
```
procedure TSW_Test.BEstadoCuentaClick(Sender: TObject);
var
  Resultado: String;
begin
  Resultado := AccountBalance(URL.Text, Token_Generado.Text);
  txt_Out.Text :=  UTF8Decode(Resultado);
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
```
procedure TSW_Test.BTimbrarClick(Sender: TObject);
var
  Resultado: String;
begin
  Resultado := StampService(URL.Text, Token_Generado.Text, text_In.Text, 'v4', false);
  txt_Out.Text :=  UTF8Decode(Resultado);
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
```
procedure TSW_Test.BTimbrarByEmisionClick(Sender: TObject);
var
  Resultado: String;
begin
  Resultado := IssueService(URL.Text, Token_Generado.Text, text_In.Text, 'v4', false);
  txt_Out.Text :=  UTF8Decode(Resultado);
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
```
procedure TSW_Test.BTimbrarByJsonClick(Sender: TObject);
var
  Resultado: String;
begin
  Resultado := IssueServiceJSON(URL.Text, Token_Generado.Text, text_In.Text, 'v4');
  txt_Out.Text :=  UTF8Decode(Resultado);
end;
```

# Cancelación #

Depende del método que se utilice, se cancela un CFDI.

## Cancelación por CSD ##

Mediante esta cancelación será necesario enviar la **URL**, el **Token**, el **UUID** de la factura, **RFC** emisor, **Certificado** en Base64, **Llave** en Base64 y **Password** del certificado.

Ejemplo de uso:
```
procedure TSW_Test.BCancelCSDClick(Sender: TObject);
var
Resultado :String;
begin
  Resultado:= CancelationByCSD(URL.Text, Token_Generado.Text, CER_In.Text, KEY_In.Text, RFCEmisor.Text, password_csd.Text, UUID.Text);
  txt_Out.Text:=UTF8Decode(Resultado);
end;
```

## Cancelación por PFX ##

Mediante esta cancelación será necesario enviar la **URL**, el **Token**, el **UUID** de la factura, **RFC** emisor, **PFX** en Base64 y **Password** del certificado.

Ejemplo de uso:
```
procedure TSW_Test.BCancelPFXClick(Sender: TObject);
var
Resultado :String;
begin
  Resultado:= CancelationByPFX(URL.Text, Token_Generado.Text, PFX_In.Text, RFCEmisor.Text, password_csd.Text, UUID.Text);
  txt_Out.Text:=UTF8Decode(Resultado);
end;
```
## Cancelación por XML ##

Mediante esta cancelación será necesario enviar la **URL**, el **Token** y el **XML** de cancelación.

Ejemplo de uso:
```
procedure TSW_Test.BCancelXMLClick(Sender: TObject);
var
  Resultado: String;
begin
  Resultado := CancelationByXML(URL.Text, Token_Generado.Text, text_In.Text);
  txt_Out.Text :=  UTF8Decode(Resultado);
end;
```
## Cancelación por UUID ##

Mediante esta cancelación será necesario enviar la **URL**, el **Token** y el **UUID** de la factura.

Ejemplo de uso:
```
procedure TSW_Test.BCancelPFXClick(Sender: TObject);
var
Resultado :String;
begin
  Resultado:= CancelationByPFX(URL.Text, Token_Generado.Text, PFX_In.Text, RFCEmisor.Text, password_csd.Text, UUID.Text);
  txt_Out.Text:=UTF8Decode(Resultado);
end;
```

# Validación #
Métodos mediante los cuales se verifican datos o documentos.

## Validación XML ##
Este método recibe un **XML**, una **URL**, y un **Token**.

Ejemplo de uso:
```
procedure TSW_Test.BValidarXmlClick(Sender: TObject);
var
  Resultado: String;
begin
  Resultado := ValidateXML(URL.Text, Token_Generado.Text, text_In.Text);
  txt_Out.Text :=  UTF8Decode(Resultado);
end;
```

## Validación de LRFC ##
Este método recibe un **RFC**, una **URL**, y un **Token**. 

Ejemplo de uso:
```
procedure TSW_Test.ValidarLRFCClick(Sender: TObject);
var
resultado: String;
begin
   resultado:= SearchByLRFC(URL.Text, Token_Generado.Text, LRFC_In.Text);
   Lco_Out.text:=UTF8Decode(resultado);
end;
```

## Validación de LCO ##
Este método recibe un **Número de Certificado**, una **URL**, y un **Token**. 

Ejemplo de uso:
```
procedure TSW_Test.ValidateLCOClick(Sender: TObject);
var
resultado: String;
begin
   resultado:= SearchLCOByCertificate(URL.Text, Token_Generado.Text, Lco_In.Text);
   Lco_Out.text:=UTF8Decode(resultado);
end;
```