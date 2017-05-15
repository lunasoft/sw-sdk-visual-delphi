<p align="center">
    <img src="http://szintezis-net.hu/wp-content/uploads/2016/08/delphi.jpg">
</p>
<p align="center">
  <img src="http://sw.com.mx/images/logo.png">
</p>


Para utilizar los servicios de SW con Delphi se debe tener primeramente el fichero DLL correspondiente a **sw-sdk-cpp.dll** y su dependencia **cpprest140d_2_9.dll**.

Dependencias
------------
* [SW-SDK-CPP](https://github.com/lunasoft/sw-sdk-cpp)
* [CPPREST SDK](https://github.com/Microsoft/cpprestsdk)


Pasos Previos
---------


* Ambos archivos se pueden encontrar en el repositorio de github correspondiente al proyecto **sw-sdk-visual-delphi**  https://github.com/lunasoft/sw-sdk-visual-delphi en la carpeta **Release** (https://github.com/lunasoft/sw-sdk-visual-delphi/releases).

* Otra alternativa seria clonar el proyecto y compilarlo para generar ambas DLL.

Interfaz
---------
El proyecto de ejemplo cuenta con un formulario principal el cual tiene dos pestañas la primera prueba el servicio de **Autenticar** y la segunda pestaña prueba el servicio de **Timbrado**

#### Pesta&ntilde;a de Autenticacion #####

<p align="center">
    <img src="http://developers.sw.com.mx/wp-content/uploads/2017/05/ResultAuthenticacion.png">
</p>

* El primer TEdit recibe la **Url** a donde apuntara el servicio la cual en nuestro ambiente de prueba seria 'http://services.test.sw.com.mx/security/authenticate'
* El segundo TEdit recibe el **Usuario** que se utilizara para autenticarse el cual en nuestro ambiente de pruebas seria 'demo'
* El tercer TEdit recibe la **Contrase&ntilde;a** que necesita para poder obtener el token el cual seria '123456789'
* El Memo1 arroja el resultado del servicio de autenticacion

#### Pesta&ntilde;a de Timbrado #####

<p align="center">
    <img src="http://developers.sw.com.mx/wp-content/uploads/2017/05/ResultStamp.png">
</p>

* Aquí tenemos dos formas para poder consumir el servicio utilizando solamente un token o facilitando las credenciales necesarias (url, usuario y contrase&ntilde;a) **ambos metodos necesitan de un XML ya selllado**.


* El primer TEdit recibe la **Url** a donde apuntara el servicio la cual en nuestro ambiente de prueba seria 'http://services.test.sw.com.mx/security/authenticate'
* El segundo TEdit recibe el **Usuario** que se utilizara para autenticarse el cual en nuestro ambiente de pruebas seria 'demo'
* El tercer TEdit recibe la **Contrase&ntilde;a** que necesita para poder obtener el token el cual seria '123456789'
* El cuarto TEdit recibe un **Token** 
* En el TButton Buscar se busca el archivo **XML** el cual se desea utilizar para timbrar 
* El Memo1 se utiliza para imprimir el contenido del archivo XML
* El Memo2 arroja el resultado del servicio de timbrado


Codigo del Ejemplo de la Pestaña de Autenticar
---------
Nuestro Bot&oacute;n Obtener Token tiene lo siguiente 

**Obtener Token**
```delphi
//Declaramos los metodos que importaremos de la DLL
//El fichero DLL debe estar en el mismo directorio en donde esta el fichero .exe de la aplicación de Delphi.
//Creamos la depependencia a nuestra libreria antes de nuestros procedures para poder llamarla mas tarde
//La forma en como se hace la referencia es la siguiente:
//Nombre de la funcion (Paramentros que resive) tipo de respesta, ruta de la DLL y por ultimo el nombre de la funcion que se expone en la DLL

Function Authentication(url, user, password : PAnsiChar): PAnsiChar; stdcall; external 'sw-sdk-cpp.dll' name 'Authentication';
 
procedure TForm1.BtnAuthenticationClick(Sender: TObject);
  var
      result : string;
      _url : PAnsiChar;
      _user : PAnsiChar;
      _password : PAnsiChar;
  begin
      with TbControl do
        _url:= PAnsiChar(AnsiString(TxtUrl.Text));
        _user:= PAnsiChar(AnsiString(TxtUser.Text));
        _password := PAnsiChar(AnsiString(TxtPassword.Text));
      if (_url <> '') And (_user <> '' ) And (_password <> '')
        then
          begin
            result := Authentication(_url, _user , _password);
            MemoResult.Lines.Text := result;
          end
      else
        ShowMessage('Los campos Url, Usuario y Contraseña se necesitan para obtener el token');
  end;
```

El ejemplo anterior la respuesta es un objeto tipo **JSON** y dentro de el se encuentra el **Token**

```json
{"data":{"token":"T2lYQ0t4L0RHVkR4dHZ5Nkk1VHNEakZ3Y0J4Nk9GODZuRyt4cE1wVm5tbXB3..."},"status":"success"}
```

Codigo del Ejemplo de la Pestaña de TimbrarV1
---------

**Stamp** Recibe el contenido de un **XML** ya emitido (sellado) en formato **String** si la factura y el token son correctos devuelve el complemento timbre en un string (**TFD**), en caso contrario lanza una excepción.

**Timbrar XML en formato string utilizando usuario y contraseña**

```delphi
//Declaramos los metodos que importaremos de la DLL
//El fichero DLL debe estar en el mismo directorio en donde esta el fichero .exe de la aplicación de Delphi.
//Creamos la depependencia a nuestra libreria antes de nuestros procedures para poder llamarla mas tarde
//La forma en como se hace la referencia es la siguiente:
//Nombre de la funcion (Paramentros que resive) tipo de respesta, ruta de la DLL y por ultimo el nombre de la funcion que se expone en la DLL

Function Stamp(url, user, password : PAnsiChar): PAnsiChar; stdcall; external 'sw-sdk-cpp.dll' name 'Stamp';
 
procedure TForm1.BtnStampOutTokenClick(Sender: TObject);
  var
    result : PAnsiChar;
    _url : PAnsiChar;
    _user : PAnsiChar;
    _password : PAnsiChar;
    _token : PAnsiChar;
    _Xml : PAnsiChar;
  begin
    with TbControl do
      _url := PAnsiChar(AnsiString(TxtUrlStamp.Text));
      _user := PAnsiChar(AnsiString(TxtUserStamp.Text));
      _password := PAnsiChar(AnsiString(TxtPassword.Text));
      _Xml := PAnsiChar(AnsiString(MemoXML.Text));
    if (_url <> '') And (_user <> '' ) And (_password <> '') And (_Xml <> '')
      then
        begin
          result := Stamp(_url,_user, _password, _Xml);

          MemoResultStamp.Lines.Text := result;
        end
    else
      ShowMessage('Los campos Url, Usuario, Contraseña y la Ruta del XML deben estar llenos antes de timbrar');
  end;
```

El ejemplo anterior la respuesta es un objeto tipo **JSON** y dentro de el se encuentra el **TFD** 

```json
{"data":{"tfd":"<tfd:TimbreFiscalDigital xsi:schemaLocation=\"http://www.sat.gob.mx/TimbreFiscalDigital http://www.sat.gob.mx/sitio_internet/cfd/TimbreFiscalDigital/TimbreFiscalDigitalv11.xsd..."},"status":"success"}
```

Es posible que si usted utiliza un xml con fecha anterior a 3 dias a la actual obtenga el siguiente mensaje lo cual tambien indica que usted pudo consumir el servicio solo que su xml ya vencio

```json
{"message":"T401. El rango de la fecha de generacion no debe de ser mayor a 72 horas para la emision del timbre...","status":"error"}
```

**Timbrar XML en formato string utilizando token**

```delphi

Function StampByToken(url, token, xml : PAnsiChar): PAnsiChar; stdcall; external 'sw-sdk-cpp.dll' name 'StampByToken';
 
procedure TForm1.BtnStampTokenClick(Sender: TObject);
  var
    result : PAnsiChar;
    _url : PAnsiChar;
    _token : PAnsiChar;
    _Xml : PAnsiChar;
  begin
    with TbControl do
      _url := PAnsiChar(AnsiString(TxtUrlStamp.Text));
      _token := PAnsiChar(AnsiString(TxtToken.Text));
      _Xml := PAnsiChar(AnsiString(MemoXML.Text));

    if (_url <> '') And (_token <> '' ) And (_Xml <> '')
      then
        begin
          result := StampByToken(_url,_token, _Xml);

          MemoResultStamp.Lines.Text := result;
        end
    else
        ShowMessage('Los campos Url, Token y la Ruta del XML deben estar llenos antes de timbrar');
  end;
```

El ejemplo anterior la respuesta es un objeto tipo **JSON** y dentro de el se encuentra el **TFD**

```json
{"data":{"tfd":"<tfd:TimbreFiscalDigital xsi:schemaLocation=\"http://www.sat.gob.mx/TimbreFiscalDigital http://www.sat.gob.mx/sitio_internet/cfd/TimbreFiscalDigital/TimbreFiscalDigitalv11.xsd..."},"status":"success"}
```

Es posible que si usted utiliza un xml con fecha anterior a 3 dias a la actual obtenga el siguiente mensaje lo cual tambien indica que usted pudo consumir el servicio solo que su xml ya vencio

```json
{"message":"T401. El rango de la fecha de generacion no debe de ser mayor a 72 horas para la emision del timbre...","status":"error"}
```
