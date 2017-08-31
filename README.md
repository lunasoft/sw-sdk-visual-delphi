<p align="center">
    <img src="http://szintezis-net.hu/wp-content/uploads/2016/08/delphi.jpg">
</p>
<p align="center">
  <img src="http://sw.com.mx/images/logo.png">
</p>


Para utilizar los servicios de SW con Delphi se debe tener primeramente el fichero DLL correspondiente a **SWServices.dll** y su dependencia **MSXML2_TLB.dcu**.

IDE Compatible
------------
* Para poder correr el ejemplo necesitas tener instalado Embarcadero® Delphi 10.2


Pasos Previos
---------


* Ambos archivos se pueden encontrar en el repositorio de github correspondiente al proyecto **sw-sdk-visual-delphi**  https://github.com/lunasoft/sw-sdk-visual-delphi en la carpeta **Release** (https://github.com/lunasoft/sw-sdk-visual-delphi/releases).

* Otra alternativa seria clonar el proyecto y compilarlo para generar la DLL y el archivo DCU.

Interfaz
---------
El proyecto de ejemplo cuenta con un formulario principal el cual tiene botones referentes a los servicios **Autenticar**,  **Timbrado**, **Cancelacion** y **Consulta de Saldo**

Para incluir la DLL de nuestro servicio es necesaria indicarla de la siguiente manera:

	function Authentication(User, Password, URL: String):String; stdcall external 'SWServices.dll';
	function StampV1(URL, XML, Token: String):String; stdcall external 'SWServices.dll';
	function StampV2(URL, XML, Token: String):String; stdcall external 'SWServices.dll';
	function StampV3(URL, XML, Token: String):String; stdcall external 'SWServices.dll';
	function StampV4(URL, XML, Token: String):String; stdcall external 'SWServices.dll';
	function CancelByPFX (Token, URL, PFX, UUID, PasswordKey, RFC: String):String; stdcall external 'SWServices.dll';
	function CancelByXML (Token, URL, XML: String):String; stdcall external 'SWServices.dll';
	function CancelByCSD (Token, URL, UUID, PasswordKey, RFC, Cer, Key: String):String; stdcall external 'SWServices.dll';
	function AccountBalance(Token, URL: String):String; stdcall external 'SWServices.dll';


Dentro de nuestro proyecto declararemos las constantes siguientes



 	 User : String = 'demo';
     Password : String = '123456789';
     URL : String = 'http://services.test.sw.com.mx';


#### Funci&oacute;n de Autenticacion #####




* El String User recibe el **Usuario** que se utilizara para autenticarse el cual en nuestro ambiente de pruebas seria 'demo'
* El String Password recibe la **Contrase&ntilde;a** que necesita para poder obtener el token el cual seria '123456789'
* El URL User recibe la **Url** a donde apuntara el servicio la cual en nuestro ambiente de prueba ser&iacute;a 'http://services.test.sw.com.mx/security/authenticate'



`ShowMessage(Authentication(User, Password, URL) );`

* El **ShowMessage** arroja el resultado del servicio de autenticaci&oacute;n


#### Funci&oacute;nes de Timbrado #####


* Aquí tenemos cuatro formas de timbrado(**V1, V2, V3, V4**) **todos los metodos necesitan de un XML ya selllado**


* En todos los met&oacute;dos enviaremos los parametros en el siguiente orden: URL, XML y Autenticaci&oacute;n, esta &uacute;ltima podemos acceder a ella mediante la funci&oacute;n de Authentication

* **Timbrado Versi&oacute;n 1** devuelve solo el TFD de la factura

```
	
	XML: String;

	FileStream : TFileStream;

    Bytes: TBytes;

    Respuesta: String; 

	begin


	FileStream := TFileStream.Create( 'C:\Users\office-user\Documents\Embarcadero\Studio\Projects\Timbrado\Data\cancelar.xml', fmOpenRead or fmShareDenyWrite);
      SetLength(Bytes, FileStream.Size);
      FileStream.Read(Bytes[0], FileStream.Size);
 	XML :=  TEncoding.ASCII.GetString(Bytes);
  	FileStream.Free;
	ShowMessage(StampV1(URL, XML, Token) );




* **Timbrado Versi&oacute;n 2** devuelve solo el TFD y el CFDI de la factura

```
  		
		XML: String;
		FileStream : TFileStream;
    	Bytes: TBytes;
    	Respuesta: String;
	begin
		FileStream := TFileStream.Create( 'C:\Users\office-user\Documents\Embarcadero\Studio\Projects\Timbrado\Data\cancelar.xml', fmOpenRead or fmShareDenyWrite);
      	SetLength(Bytes, FileStream.Size);
      	FileStream.Read(Bytes[0], FileStream.Size);
 		XML :=  TEncoding.ASCII.GetString(Bytes);
  	FileStream.Free;
	ShowMessage(StampV2(URL, XML, Token) );



* **Timbrado Versi&oacute;n 3** devuelve solo el TFD y el TFD ya unidos de la factura

```


	var

  		XML: String;
		FileStream : TFileStream;
    	Bytes: TBytes;
   		Respuesta: String;
	begin
		FileStream := TFileStream.Create( 'C:\Users\office-user\Documents\Embarcadero\Studio\Projects\Timbrado\Data\cancelar.xml', fmOpenRead or fmShareDenyWrite);
      	SetLength(Bytes, FileStream.Size);
      	FileStream.Read(Bytes[0], FileStream.Size);
 		XML :=  TEncoding.ASCII.GetString(Bytes);
  		FileStream.Free;
		ShowMessage(Stampv3(URL, XML, Token) );
	end;


En caso 


* **Timbrado Versi&oacute;n 4** este servicio devuelve CFDI, TFD, CadenaOriginal, noCertificadoSat, noCertificadoCFDI, UUID, selloSAT, selloCFDI, fechaTimbrado y QR. Este servicio recibe el comprobante ya sellado.

```

	var

  		XML: String;
		FileStream : TFileStream;
    	Bytes: TBytes;
    	Respuesta: String;
	begin
		FileStream := TFileStream.Create( 'C:\Users\office-user\Documents\Embarcadero\Studio\Projects\Timbrado\Data\cancelar.xml', fmOpenRead or fmShareDenyWrite);
      	SetLength(Bytes, FileStream.Size);
      	FileStream.Read(Bytes[0], FileStream.Size);
 		XML :=  TEncoding.ASCII.GetString(Bytes);
  		FileStream.Free;
		ShowMessage(Stampv4(URL, XML, Token) );


#### Funciones de cancelaci&oacute;n ####
* **Cancelaci&oacute;n por CSD** Como su nombre lo indica, este servicio recibe todos los elementos que componen el CSD en base64 los cuales son los siguientes:

   Certificado (.cer)

   Key (.key)

   Password del archivo key

   RFC emisor


	var
			XML, UUID, Cer, Key, PasswordKey, RFC: String;
		FileStream : TFileStream;
		Bytes: TBytes;
	begin

		UUID := '091f85fb-6b7b-4738-ad41-da42752af610';
		RFC := 'LAN7008173R5';
	
		FileStream := TFileStream.Create( 'C:\Users\office-user\Documents\Embarcadero\Studio\Projects\Timbrado\Data\XML.xml', fmOpenRead or fmShareDenyWrite);
  		SetLength(Bytes, FileStream.Size);
  		FileStream.Read(Bytes[0], FileStream.Size);
			XML :=  TEncoding.ASCII.GetString(Bytes);
			FileStream.Free;

		FileStream := TFileStream.Create( 'C:\Users\office-user\Documents\Embarcadero\Studio\Projects\Timbrado\Data\RFC.cer', fmOpenRead or fmShareDenyWrite);
  		SetLength(Bytes, FileStream.Size);
  		FileStream.Read(Bytes[0], FileStream.Size);
			Cer :=  TEncoding.ASCII.GetString(Bytes);
			FileStream.Free;

		FileStream := TFileStream.Create( 'C:\Users\office-user\Documents\Embarcadero\Studio\Projects\Timbrado\Data\RFC.key', fmOpenRead or fmShareDenyWrite);
  		SetLength(Bytes, FileStream.Size);
  		FileStream.Read(Bytes[0], FileStream.Size);
			Key :=  Base64Encode(TEncoding.ASCII.GetString(Bytes));
			FileStream.Free;
			
		ShowMessage(CancelByCSD(Authentication(User, Password, URL), URL, UUID, PasswordKey, RFC, Cer, Key));
	end;

* **Cancelaci&oacute;n por XML**

Como su nombre lo indica, este servicio recibe &uacute;nicamente el XML sellado con los UUID a cancelar.


	var
  		XML: String;
		FileStream : TFileStream;
    	Bytes: TBytes;
	begin
		FileStream := TFileStream.Create( 'C:\Users\office-user\Documents\Embarcadero\Studio\Projects\Timbrado\Data\cancelar.xml', fmOpenRead or fmShareDenyWrite);
      	SetLength(Bytes, FileStream.Size);
      	FileStream.Read(Bytes[0], FileStream.Size);
 		XML :=  TEncoding.ASCII.GetString(Bytes);
  		FileStream.Free;

		ShowMessage(CancelByXML(Authentication(User, Password, URL),URL, XML));
	end;


* **Cancelacion por PFX**


Como su nombre lo indica, este servicio recibe todos los elementos que componen el PFX los cuales son los siguientes:
 
   PFX

   Password del archivo key

   RFC emisor

Enviaremos los siguientes parametros


	
	var
  		XML, PFX, UUID, PasswordKey, RFC: String;
		FileStream : TFileStream;
    	Bytes: TBytes;
	begin
		RFC := 'LAN7008173R5';
		PasswordKey := '12345678a';
		UUID := '091f85fb-6b7b-4738-ad41-da42752af610';

		FileStream := TFileStream.Create( 'C:\Users\office-user\Documents\Embarcadero\Studio\Projects\Timbrado\Data\certificado.pfx', fmOpenRead or fmShareDenyWrite);
      	SetLength(Bytes, FileStream.Size);
      	FileStream.Read(Bytes[0], FileStream.Size);
 		PFX :=  Base64Encode(TEncoding.ASCII.GetString(Bytes));
  		FileStream.Free;
				
		ShowMessage(CancelByPFX(Authentication(User, Password, URL), URL, PFX, UUID, PasswordKey, RFC));
	end;

* **Consulta de Saldo**

Este servicio recibe el token y genera los elementos que componen la consulta de saldos:

	begin	
		ShowMessage(AccountBalance(Authentication(User, Password, URL),URL));
	end;

