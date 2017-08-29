library SWServices;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  ShareMem,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  MSXML2_TLB,
  MSXML,
  COMObj,
  ActiveX,
  System.Json,
  EncdDecd,
  Vcl.StdCtrls;

{$R *.res}

function Authentication(User, Password, URL: String):String; stdcall;
var
  xmlHttp : OleVariant;
  FResponseText, st: String;
  JSonObject : TJSonObject;
  JSonValue : TJSonValue;
begin

     URL := URL+'/security/authenticate';
      xmlHttp := CreateOleObject('MSXML2.ServerXMLHTTP.6.0');

      try
          xmlHttp.Open('POST', URL, False);
          xmlHttp.setRequestHeader('user', User);
          xmlHttp.setRequestHeader('password', Password);
          xmlHttp.send((FResponseText));

          st := xmlHttp.ResponseText;

          JsonValue:=JSonObject.ParseJSONValue(st);
          JsonValue:=(JsonValue as TJSONObject).Get('data').JSONValue;
          JsonValue:=(JsonValue as TJSONObject).Get('token').JSONValue;
          Result := PChar(JsonValue.Value);
      except
        on E:  Exception do
         Writeln(E.ClassName, ': ', E.Message);
      end;
end;

function StampV1(URL, XML, Token: String): String; stdcall;
var
  xmlHttp: OleVariant;
  cService, sp, _bound, sURL, body: String;

begin

	cService := '/cfdi33/stamp/v1';

	  sp := (#13+#10);
  	_bound := 'AaB03x';
    sUrl := URL + cService;
    body := '--' + _bound + sp + 'Content-Disposition: form-data; name=xml; filename=xml' + sp + 'Content-Transfer-Encoding: binary'+ sp+sp+XML+sp +'--'+ _bound + '--' + sp;
    xmlHttp := CreateOleObject('MSXML2.ServerXMLHTTP.6.0');

  	TRY
          xmlHttp.open('POST', sUrl, False);
          xmlHttp.setRequestHeader ('Authorization', 'bearer '+ Token);
          xmlHttp.setRequestHeader ('Content-Type', 'multipart/form-data; boundary=' + _bound);
          xmlHttp.setRequestHeader ('Content-Length', IntToStr(length(body)));
          xmlHttp.send (body);

  		  Result := xmlHttp.responseText;
    EXCEPT
        on E:  Exception do
          Writeln(E.ClassName, ': ', E.Message);
    END;

end;

function StampV2(URL, XML, Token: String): String; stdcall;
var
  xmlHttp: OleVariant;
  cService, sp, _bound, sURL, body: String;

begin

	cService := '/cfdi33/stamp/v2';

	  sp := (#13+#10);
  	_bound := 'AaB03x';
    sUrl := URL + cService;
    body := '--' + _bound + sp + 'Content-Disposition: form-data; name=xml; filename=xml' + sp + 'Content-Transfer-Encoding: binary'+ sp+sp+XML+sp +'--'+ _bound + '--' + sp;
    xmlHttp := CreateOleObject('MSXML2.ServerXMLHTTP.6.0');


  	TRY
          xmlHttp.open('POST', sUrl, False);
          xmlHttp.setRequestHeader ('Authorization', 'bearer '+ Token);
          xmlHttp.setRequestHeader ('Content-Type', 'multipart/form-data; boundary=' + _bound);
          xmlHttp.setRequestHeader ('Content-Length', IntToStr(length(body)));
          xmlHttp.send (body);

  		  Result := xmlHttp.responseText;
    EXCEPT
        on E:  Exception do
          Writeln(E.ClassName, ': ', E.Message);
    END;

end;

function StampV3(URL, XML, Token: String): String; stdcall;
var
  xmlHttp: OleVariant;
  cService, sp, _bound, sURL, body: String;

begin

	cService := '/cfdi33/stamp/v3';

	  sp := (#13+#10);
  	_bound := 'AaB03x';
    sUrl := URL + cService;
    body := '--' + _bound + sp + 'Content-Disposition: form-data; name=xml; filename=xml' + sp + 'Content-Transfer-Encoding: binary'+ sp+sp+XML+sp +'--'+ _bound + '--' + sp;
    xmlHttp := CreateOleObject('MSXML2.ServerXMLHTTP.6.0');

  	TRY
          xmlHttp.open('POST', sUrl, False);
          xmlHttp.setRequestHeader ('Authorization', 'bearer '+ Token);
          xmlHttp.setRequestHeader ('Content-Type', 'multipart/form-data; boundary=' + _bound);
          xmlHttp.setRequestHeader ('Content-Length', IntToStr(length(body)));
          xmlHttp.send (body);

  		  Result := xmlHttp.responseText;
    EXCEPT
        on E:  Exception do
          Writeln(E.ClassName, ': ', E.Message);
    END;

end;

function StampV4(URL, XML, Token: String): String; stdcall;
var
  xmlHttp: OleVariant;
  cService, sp, _bound, sURL, body: String;

begin

	cService := '/cfdi33/stamp/v4';

	  sp := (#13+#10);
  	_bound := 'AaB03x';
    sUrl := URL + cService;
    body := '--' + _bound + sp + 'Content-Disposition: form-data; name=xml; filename=xml' + sp + 'Content-Transfer-Encoding: binary'+ sp+sp+XML+sp +'--'+ _bound + '--' + sp;
    xmlHttp := CreateOleObject('MSXML2.ServerXMLHTTP.6.0');

  	TRY
          xmlHttp.open('POST', sUrl, False);
          xmlHttp.setRequestHeader ('Authorization', 'bearer '+ Token);
          xmlHttp.setRequestHeader ('Content-Type', 'multipart/form-data; boundary=' + _bound);
          xmlHttp.setRequestHeader ('Content-Length', IntToStr(length(body)));
          xmlHttp.send (body);

  		  Result := xmlHttp.responseText;
    EXCEPT
        on E:  Exception do
          Writeln(E.ClassName, ': ', E.Message);
    END;

end;

function CancelXML(Token, URL, XML: String): String; stdcall;
const
  Version = '/cfdi33/cancel/xml';
var
   oHTTP: OleVariant;
  sURL, boundary, sp, cToken, body: String;
begin

  sURL := URL + Version;

	sp := (#13+#10);
  cToken := Token;
  boundary :=  '----WebKitFormBoundary7MA4YWxkTrZu0gW';

  body := '--' + boundary + sp + 'Content-Disposition: form-data; name=xml; filename=xml' + sp + 'Content-Transfer-Encoding: binary'+ sp+sp+XML+sp +'--'+ boundary + '--' + sp;

	TRY
    oHTTP := CreateOleObject('MSXML2.ServerXMLHTTP.6.0');
		oHTTP.open('POST', sUrl, False);
		oHTTP.setRequestHeader('Authorization', 'bearer '+ cToken);
		oHTTP.setRequestHeader('Content-Type',  ' multipart/form-data; boundary='+boundary);
		oHTTP.send(body);
		Result := (oHTTP.responseText);
  EXCEPT
        on E:  Exception do
          Writeln(E.ClassName, ': ', E.Message);
  END;
end;

function CancelPFX(Token, URL, PFX, UUID, Password, RFC: String): String; stdcall;
const
  Version = '/cfdi33/cancel/pfx';
var
  oHTTP: OleVariant;
  sURL, sp, cToken, body: String;
begin

  sURL := URL + Version;
	sp := (#13+#10);
  cToken := Token;

  body := sp+'{"uuid": "'+ UUID +'","password": "'+ Password +'","rfc": "'+ RFC +'","b64Pfx": "' + PFX+'"}';

	TRY
    oHTTP := CreateOleObject('MSXML2.ServerXMLHTTP.6.0');
		oHTTP.open('POST', sUrl, False);
		oHTTP.setRequestHeader('Authorization', 'bearer '+ cToken);
		oHTTP.setRequestHeader('Content-Type',  'application/json');
		oHTTP.send(body);
		Result := (oHTTP.responseText);
  EXCEPT
        on E:  Exception do
          Writeln(E.ClassName, ': ', E.Message);
  END;
end;


function CancelCSD(Token, URL, UUID, Password, RFC, Cer, Key: String): String; stdcall;
const
  s_Version = '/cfdi33/cancel/csd';
var
   sp, sURL, body, cToken: String;
   oHTTP: OleVariant;

begin
	sURL := URL + s_Version;

	sp := (#13+#10);
  cToken := Token;

  body := sp+'{"uuid": "'+ UUID +'","password": "'+ Password +'","rfc": "'+ RFC +'","b64Cer": "' + Cer+'","b64Key": "' + Key+'"}';

	TRY
    oHTTP := CreateOleObject('MSXML2.ServerXMLHTTP.6.0');
		oHTTP.open('POST', sUrl, False);
		oHTTP.setRequestHeader('Authorization', 'bearer '+ cToken);
		oHTTP.setRequestHeader('Content-Type',  'application/json');
		oHTTP.send(body);
		Result := (oHTTP.responseText);
  EXCEPT
        on E:  Exception do
          Writeln(E.ClassName, ': ', E.Message);
  END;

end;

function AccountBalance(Token, URL: String): String; stdcall;
const
  sVersion : String = '/account/balance';

var
  cToken, sURL,  sp: String;
  oHTTP: OleVariant;
begin

  cToken := Token;
	sURL := URL + sVersion;
	sp := (#13+#10);

	TRY
	 	  oHTTP := CreateOleObject('MSXML2.ServerXMLHTTP.6.0');
		 	oHTTP.open ('GET', sUrl, False);
		  oHTTP.setRequestHeader ('Authorization', 'bearer '+ cToken);
			oHTTP.setRequestHeader ('Content-Type',  'application/json');
		  oHTTP.send();

		  Result := oHTTP.responseText;

  EXCEPT
        on E:  Exception do
          Writeln(E.ClassName, ': ', E.Message);
  END;
end;

 exports
  Authentication,
  StampV1,
  StampV2,
  StampV3,
  StampV4,
  CancelCSD,
  CancelXML,
  CancelPFX,
  AccountBalance;

begin


end.

