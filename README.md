<div id="readme" class="readme blob instapaper_body">
    <article class="markdown-body entry-content" itemprop="text"><p align="center">
    <a href="https://camo.githubusercontent.com/e29b06fe1da0a7b612145240053c218c882cef71/687474703a2f2f737a696e74657a69732d6e65742e68752f77702d636f6e74656e742f75706c6f6164732f323031362f30382f64656c7068692e6a7067" target="_blank"><img src="https://camo.githubusercontent.com/e29b06fe1da0a7b612145240053c218c882cef71/687474703a2f2f737a696e74657a69732d6e65742e68752f77702d636f6e74656e742f75706c6f6164732f323031362f30382f64656c7068692e6a7067" data-canonical-src="http://szintezis-net.hu/wp-content/uploads/2016/08/delphi.jpg" style="max-width:100%;"></a>
</p>
<p align="center">
  <a href="https://camo.githubusercontent.com/cae95d2d0cad625452f72543c68fb37930ece9c2/687474703a2f2f73772e636f6d2e6d782f696d616765732f6c6f676f2e706e67" target="_blank"><img src="https://camo.githubusercontent.com/cae95d2d0cad625452f72543c68fb37930ece9c2/687474703a2f2f73772e636f6d2e6d782f696d616765732f6c6f676f2e706e67" data-canonical-src="http://sw.com.mx/images/logo.png" style="max-width:100%;"></a>
</p>
<p>Para utilizar los servicios de SW con Delphi se debe tener primeramente el fichero DLL correspondiente a <strong>SWServices.dll</strong> y su dependencia <strong>MSXML2_TLB.dcu</strong>.</p>
<h2><a id="user-content-ide-compatible" class="anchor" href="#ide-compatible" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>IDE Compatible</h2>
<ul>
<li>Para poder correr el ejemplo necesitas tener instalado Embarcadero® Delphi 10.2</li>
</ul>
<h2><a id="user-content-pasos-previos" class="anchor" href="#pasos-previos" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Pasos Previos</h2>
<ul>
<li>
<p>Ambos archivos se pueden encontrar en el repositorio de github correspondiente al proyecto <strong>sw-sdk-visual-delphi</strong>  <a href="https://github.com/lunasoft/sw-sdk-visual-delphi">https://github.com/lunasoft/sw-sdk-visual-delphi</a> en la carpeta <strong>Release</strong> (<a href="https://github.com/lunasoft/sw-sdk-visual-delphi/releases">https://github.com/lunasoft/sw-sdk-visual-delphi/releases</a>).</p>
</li>
<li>
<p>Otra alternativa seria clonar el proyecto y compilarlo para generar la DLL y el archivo DCU.</p>
</li>
</ul>
<h2><a id="user-content-interfaz" class="anchor" href="#interfaz" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Interfaz</h2>
<p>El proyecto de ejemplo cuenta con un formulario principal el cual tiene botones referentes a los servicios <strong>Autenticar</strong>,  <strong>Timbrado</strong>, <strong>Cancelacion</strong> y <strong>Consulta de Saldo</strong></p>
<p>Para incluir la DLL de nuestro servicio es necesaria indicarla de la siguiente manera:</p>
<pre><code>function Authentication(User, Password, URL: String):String; stdcall external 'SWServices.dll';
function StampV1(URL, XML, Token: String):String; stdcall external 'SWServices.dll';
function StampV2(URL, XML, Token: String):String; stdcall external 'SWServices.dll';
function StampV3(URL, XML, Token: String):String; stdcall external 'SWServices.dll';
function StampV4(URL, XML, Token: String):String; stdcall external 'SWServices.dll';
function CancelByPFX (Token, URL, PFX, UUID, PasswordKey, RFC: String):String; stdcall external 'SWServices.dll';
function CancelByXML (Token, URL, XML: String):String; stdcall external 'SWServices.dll';
function CancelByCSD (Token, URL, UUID, PasswordKey, RFC, Cer, Key: String):String; stdcall external 'SWServices.dll';
function AccountBalance(Token, URL: String):String; stdcall external 'SWServices.dll';
</code></pre>
<p>Dentro de nuestro proyecto declararemos las constantes siguientes</p>
<pre><code> User : String = 'demo';
 Password : String = '123456789';
 URL : String = 'http://services.test.sw.com.mx';
</code></pre>
<h4><a id="user-content-función-de-autenticacion" class="anchor" href="#función-de-autenticacion" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Función de Autenticacion</h4>
<ul>
<li>El String User recibe el <strong>Usuario</strong> que se utilizara para autenticarse el cual en nuestro ambiente de pruebas seria 'demo'</li>
<li>El String Password recibe la <strong>Contraseña</strong> que necesita para poder obtener el token el cual seria '123456789'</li>
<li>El URL User recibe la <strong>Url</strong> a donde apuntara el servicio la cual en nuestro ambiente de prueba sería '<a href="http://services.test.sw.com.mx/security/authenticate">http://services.test.sw.com.mx/security/authenticate</a>'</li>
</ul>
<p><code>ShowMessage(Authentication(User, Password, URL) );</code></p>
<ul>
<li>El <strong>ShowMessage</strong> arroja el resultado del servicio de autenticación</li>
</ul>
<h4><a id="user-content-funciónes-de-timbrado" class="anchor" href="#funciónes-de-timbrado" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Funciónes de Timbrado</h4>
<ul>
<li>
<p>Aquí tenemos cuatro formas de timbrado(<strong>V1, V2, V3, V4</strong>) <strong>todos los metodos necesitan de un XML ya selllado</strong></p>
</li>
<li>
<p>En todos los metódos enviaremos los parametros en el siguiente orden: URL, XML y Autenticación, esta última podemos acceder a ella mediante la función de Authentication</p>
</li>
<li>
<p><strong>Timbrado Versión 1</strong> devuelve solo el TFD de la factura</p>
</li>
</ul>
<pre><code>	
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

</code></pre>
<p><b>Timbrado Versi&oacute;n 2</b> devuelve solo el TFD y el CFDI de la factura</p>
<pre><code>	XML: String;
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
</code></pre>
<ul>
<li><strong>Timbrado Versión 3</strong> devuelve solo el TFD y el TFD ya unidos de la factura</li>
</ul>
<pre><code>

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

</code></pre>
<p><b>Timbrado Versi&oacute;n 4</b> este servicio devuelve CFDI, TFD, CadenaOriginal, noCertificadoSat, noCertificadoCFDI, UUID, selloSAT, selloCFDI, fechaTimbrado y QR. Este servicio recibe el comprobante ya sellado.</p>
<pre><code>var

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
</code></pre>
<h4><a id="user-content-funciones-de-cancelación" class="anchor" href="#funciones-de-cancelación" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Funciones de cancelación</h4>
<ul>
<li>
<p><strong>Cancelación por CSD</strong> Como su nombre lo indica, este servicio recibe todos los elementos que componen el CSD en base64 los cuales son los siguientes:</p>
<p>Certificado (.cer)</p>
<p>Key (.key)</p>
<p>Password del archivo key</p>
<p>RFC emisor</p>
<pre><code>var
XML, UUID, Cer, Key, PasswordKey, RFC: String;
FileStream : TFileStream;
Bytes: TBytes;
begin  UUID := '091f85fb-6b7b-4738-ad41-da42752af610';
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
</code></pre>
<p></p>
</li>
<li>
<p><strong>Cancelación por XML</strong></p>
</li>
</ul>
<p>Como su nombre lo indica, este servicio recibe únicamente el XML sellado con los UUID a cancelar.</p>
<pre><code>var
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
</code></pre>
<ul>
<li><strong>Cancelacion por PFX</strong></li>
</ul>
<p>Como su nombre lo indica, este servicio recibe todos los elementos que componen el PFX los cuales son los siguientes:</p>
<p>PFX</p>
<p>Password del archivo key</p>
<p>RFC emisor</p>
<p>Enviaremos los siguientes parametros</p>
<pre><code>var
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
</code></pre>
<ul>
<li><strong>Consulta de Saldo</strong></li>
</ul>
<p>Este servicio recibe el token y genera los elementos que componen la consulta de saldos:</p>
<pre><code>begin	
	ShowMessage(AccountBalance(Authentication(User, Password, URL),URL));
end;
</code></pre>
</article>
  </div>

  </div>
