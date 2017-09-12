
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




* **Timbrado Versi&amp;oacute;n 2** devuelve solo el TFD y el CFDI de la factura

</code></pre>
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


En caso 


* **Timbrado Versi&amp;oacute;n 4** este servicio devuelve CFDI, TFD, CadenaOriginal, noCertificadoSat, noCertificadoCFDI, UUID, selloSAT, selloCFDI, fechaTimbrado y QR. Este servicio recibe el comprobante ya sellado.

</code></pre>
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
<p>var
XML, UUID, Cer, Key, PasswordKey, RFC: String;
FileStream : TFileStream;
Bytes: TBytes;
begin</p>
<pre><code>  UUID := '091f85fb-6b7b-4738-ad41-da42752af610';
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
</code></pre>
<p>end;</p>
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

  <button type="button" data-facebox="#jump-to-line" data-facebox-class="linejump" data-hotkey="l" class="d-none">Jump to Line</button>
  <div id="jump-to-line" style="display:none">
    <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="" class="js-jump-to-line-form" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
      <input class="form-control linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" aria-label="Jump to line" autofocus>
      <button type="submit" class="btn">Go</button>
</form>  </div>

  </div>
  <div class="modal-backdrop js-touch-events"></div>
</div>

    </div>
  </div>

  </div>

      
<div class="footer container-lg px-3" role="contentinfo">
  <div class="position-relative d-flex flex-justify-between py-6 mt-6 f6 text-gray border-top border-gray-light ">
    <ul class="list-style-none d-flex flex-wrap ">
      <li class="mr-3">&copy; 2017 <span title="0.17564s from unicorn-2352025571-mc3g6">GitHub</span>, Inc.</li>
        <li class="mr-3"><a href="https://github.com/site/terms" data-ga-click="Footer, go to terms, text:terms">Terms</a></li>
        <li class="mr-3"><a href="https://github.com/site/privacy" data-ga-click="Footer, go to privacy, text:privacy">Privacy</a></li>
        <li class="mr-3"><a href="https://github.com/security" data-ga-click="Footer, go to security, text:security">Security</a></li>
        <li class="mr-3"><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
        <li><a href="https://help.github.com" data-ga-click="Footer, go to help, text:help">Help</a></li>
    </ul>

    <a href="https://github.com" aria-label="Homepage" class="footer-octicon" title="GitHub">
      <svg aria-hidden="true" class="octicon octicon-mark-github" height="24" version="1.1" viewBox="0 0 16 16" width="24"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"/></svg>
</a>
    <ul class="list-style-none d-flex flex-wrap ">
        <li class="mr-3"><a href="https://github.com/contact" data-ga-click="Footer, go to contact, text:contact">Contact GitHub</a></li>
      <li class="mr-3"><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li class="mr-3"><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
      <li class="mr-3"><a href="https://shop.github.com" data-ga-click="Footer, go to shop, text:shop">Shop</a></li>
        <li class="mr-3"><a href="https://github.com/blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a href="https://github.com/about" data-ga-click="Footer, go to about, text:about">About</a></li>

    </ul>
  </div>
</div>



  <div id="ajax-error-message" class="ajax-error-message flash flash-error">
    <svg aria-hidden="true" class="octicon octicon-alert" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8.865 1.52c-.18-.31-.51-.5-.87-.5s-.69.19-.87.5L.275 13.5c-.18.31-.18.69 0 1 .19.31.52.5.87.5h13.7c.36 0 .69-.19.86-.5.17-.31.18-.69.01-1L8.865 1.52zM8.995 13h-2v-2h2v2zm0-3h-2V6h2v4z"/></svg>
    <button type="button" class="flash-close js-flash-close js-ajax-error-dismiss" aria-label="Dismiss error">
      <svg aria-hidden="true" class="octicon octicon-x" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"/></svg>
    </button>
    You can't perform that action at this time.
  </div>


    
    <script crossorigin="anonymous" integrity="sha256-ADlWtmO0Qfn/6JFR8DV8xKaQfuJQgDIYo/A0n82SxfQ=" src="https://assets-cdn.github.com/assets/frameworks-003956b663b441f9ffe89151f0357cc4a6907ee250803218a3f0349fcd92c5f4.js"></script>
    
    <script async="async" crossorigin="anonymous" integrity="sha256-MPSh3jBvoVPCMsiIExfnJPw7HK2nk4BuVM4pHCrAaRI=" src="https://assets-cdn.github.com/assets/github-30f4a1de306fa153c232c8881317e724fc3b1cada793806e54ce291c2ac06912.js"></script>
    
    
    
    
  <div class="js-stale-session-flash stale-session-flash flash flash-warn flash-banner d-none">
    <svg aria-hidden="true" class="octicon octicon-alert" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8.865 1.52c-.18-.31-.51-.5-.87-.5s-.69.19-.87.5L.275 13.5c-.18.31-.18.69 0 1 .19.31.52.5.87.5h13.7c.36 0 .69-.19.86-.5.17-.31.18-.69.01-1L8.865 1.52zM8.995 13h-2v-2h2v2zm0-3h-2V6h2v4z"/></svg>
    <span class="signed-in-tab-flash">You signed in with another tab or window. <a href="">Reload</a> to refresh your session.</span>
    <span class="signed-out-tab-flash">You signed out in another tab or window. <a href="">Reload</a> to refresh your session.</span>
  </div>
  <div class="facebox" id="facebox" style="display:none;">
  <div class="facebox-popup">
    <div class="facebox-content" role="dialog" aria-labelledby="facebox-header" aria-describedby="facebox-description">
    </div>
    <button type="button" class="facebox-close js-facebox-close" aria-label="Close modal">
      <svg aria-hidden="true" class="octicon octicon-x" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"/></svg>
    </button>
  </div>
</div>


  </body>
</html>

