unit UNIT_TEST;

interface

uses
  ShareMem, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
     User : String = 'demo';
     Password : String = '123456789';
     URL : String = 'http://services.test.sw.com.mx';

var
  Form1: TForm1;
  function Authentication(User, Password, URL: String):String; stdcall external 'SWServices.dll';
  function StampV1(URL, XML, Token: String):String; stdcall external 'SWServices.dll';
  function StampV2(URL, XML, Token: String):String; stdcall external 'SWServices.dll';
  function StampV3(URL, XML, Token: String):String; stdcall external 'SWServices.dll';
  function StampV4(URL, XML, Token: String):String; stdcall external 'SWServices.dll';
  function CancelByPFX (Token, URL, PFX, UUID, PasswordKey, RFC: String):String; stdcall external 'SWServices.dll';
  function CancelByXML (Token, URL, XML: String):String; stdcall external 'SWServices.dll';
  function CancelByCSD (Token, URL, UUID, PasswordKey, RFC, Cer, Key: String):String; stdcall external 'SWServices.dll';
  function AccountBalance(Token, URL: String):String; stdcall external 'SWServices.dll';

implementation

{$R *.dfm}

procedure TForm1.Button10Click(Sender: TObject);
var
  XML, UUID, PasswordKey, RFC, Cer, Key: String;
begin


ShowMessage(CancelByCSD(Authentication(User, Password, URL), URL, UUID, PasswordKey, RFC, Cer, Key));
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  XML: String;
begin


ShowMessage(StampV1(URL, XML, Authentication(User, Password, URL)) );
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  XML: String;
begin


ShowMessage(StampV2(URL, XML, Authentication(User, Password, URL)) );
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  XML: String;
begin


ShowMessage(StampV3(URL, XML, Authentication(User, Password, URL)) );
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  XML: String;
begin


ShowMessage(StampV4(URL, XML, Authentication(User, Password, URL)) );
end;

procedure TForm1.Button5Click(Sender: TObject);
begin

ShowMessage(Authentication(User, Password, URL) );
end;

procedure TForm1.Button6Click(Sender: TObject);
begin

ShowMessage(AccountBalance(Authentication(User, Password, URL),URL));
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  XML: String;
begin


ShowMessage(CancelByXML(Authentication(User, Password, URL),URL, XML));
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  XML, PFX, UUID, PasswordKey, RFC: String;
begin


ShowMessage(CancelByPFX(Authentication(User, Password, URL), URL, PFX, UUID, PasswordKey, RFC));
end;

end.
