object SW_Test: TSW_Test
  Left = 0
  Top = 0
  Caption = 'SW Test'
  ClientHeight = 640
  ClientWidth = 1048
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Token_Generado: TMemo
    Left = 240
    Top = 8
    Width = 249
    Height = 67
    Lines.Strings = (
      'Token_Generado')
    TabOrder = 0
  end
  object User: TEdit
    Left = 8
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'demo'
  end
  object Password: TEdit
    Left = 8
    Top = 62
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '123456789'
  end
  object Generar_Token: TButton
    Left = 135
    Top = 8
    Width = 99
    Height = 34
    Caption = 'Generar Token'
    TabOrder = 3
    OnClick = Generar_TokenClick
  end
  object ValidateLCO: TButton
    Left = 519
    Top = 8
    Width = 82
    Height = 25
    Caption = 'Validar LCO'
    TabOrder = 4
    OnClick = ValidateLCOClick
  end
  object ValidarLRFC: TButton
    Left = 656
    Top = 8
    Width = 106
    Height = 25
    Caption = 'Validar LRFC'
    TabOrder = 5
    OnClick = ValidarLRFCClick
  end
  object Lco_In: TEdit
    Left = 495
    Top = 54
    Width = 130
    Height = 21
    TabOrder = 6
    Text = '20001000000300022815'
  end
  object Lrfc_In: TEdit
    Left = 640
    Top = 54
    Width = 129
    Height = 21
    TabOrder = 7
    Text = 'LAN7008173R5'
  end
  object Lco_Out: TMemo
    Left = 784
    Top = 8
    Width = 233
    Height = 67
    Lines.Strings = (
      'Lco_Out')
    TabOrder = 8
  end
  object Url: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 9
    Text = 'http://services.test.sw.com.mx'
  end
  object Abrir_PFX: TButton
    Left = 966
    Top = 81
    Width = 75
    Height = 57
    Caption = 'Abrir PFX'
    TabOrder = 10
    OnClick = Abrir_PFXClick
  end
  object Abrir_Cer: TButton
    Left = 965
    Top = 144
    Width = 75
    Height = 65
    Caption = 'Abrir Cer'
    TabOrder = 11
    OnClick = Abrir_CerClick
  end
  object Abrir_Key: TButton
    Left = 965
    Top = 215
    Width = 75
    Height = 57
    Caption = 'Abrir Key'
    TabOrder = 12
    OnClick = Abrir_KeyClick
  end
  object PFX_In: TMemo
    Left = 775
    Top = 81
    Width = 185
    Height = 57
    Lines.Strings = (
      'PFX_In')
    TabOrder = 13
  end
  object CER_In: TMemo
    Left = 775
    Top = 144
    Width = 185
    Height = 65
    Lines.Strings = (
      'CER_In')
    TabOrder = 14
  end
  object Key_In: TMemo
    Left = 775
    Top = 215
    Width = 185
    Height = 57
    Lines.Strings = (
      'Key_In')
    TabOrder = 15
  end
  object Password_csd: TEdit
    Left = 775
    Top = 296
    Width = 265
    Height = 21
    TabOrder = 16
    Text = '12345678a'
  end
  object StaticText2: TStaticText
    Left = 712
    Top = 300
    Width = 50
    Height = 17
    Caption = 'Password'
    TabOrder = 17
  end
  object UUID: TEdit
    Left = 775
    Top = 323
    Width = 265
    Height = 21
    TabOrder = 18
    Text = 'f784a223-a73d-429c-aa10-3f64a3d86dee'
  end
  object StaticText3: TStaticText
    Left = 720
    Top = 327
    Width = 29
    Height = 17
    Caption = 'UUID'
    TabOrder = 19
  end
  object RfcEmisor: TEdit
    Left = 775
    Top = 350
    Width = 265
    Height = 21
    TabOrder = 20
    Text = 'LAN7008173R5'
  end
  object StaticText4: TStaticText
    Left = 711
    Top = 354
    Width = 58
    Height = 17
    Caption = 'RFC Emisor'
    TabOrder = 21
  end
  object BCancelCSD: TButton
    Left = 640
    Top = 81
    Width = 129
    Height = 32
    Caption = 'Cancelar por CSD'
    TabOrder = 22
    OnClick = BCancelCSDClick
  end
  object BCancelPFX: TButton
    Left = 640
    Top = 144
    Width = 129
    Height = 33
    Caption = 'Cancelar por PFX'
    TabOrder = 23
    OnClick = BCancelPFXClick
  end
  object BCancelXML: TButton
    Left = 640
    Top = 192
    Width = 129
    Height = 33
    Caption = 'Cancelar por XML'
    TabOrder = 24
    OnClick = BCancelXMLClick
  end
  object BCancelUUID: TButton
    Left = 640
    Top = 240
    Width = 129
    Height = 32
    Caption = 'Cancelar por UUID'
    TabOrder = 25
    OnClick = BCancelUUIDClick
  end
  object text_In: TMemo
    Left = 8
    Top = 119
    Width = 626
    Height = 153
    Lines.Strings = (
      'text_In')
    TabOrder = 26
  end
  object StaticText1: TStaticText
    Left = 264
    Top = 96
    Width = 115
    Height = 17
    Caption = 'XML / JSON de entrada'
    TabOrder = 27
  end
  object BTimbrar: TButton
    Left = 8
    Top = 278
    Width = 169
    Height = 41
    Caption = 'Timbrar'
    TabOrder = 28
    OnClick = BTimbrarClick
  end
  object BTimbrarByEmision: TButton
    Left = 183
    Top = 278
    Width = 169
    Height = 41
    Caption = 'Timbrar Emision Timbrado'
    TabOrder = 29
    OnClick = BTimbrarByEmisionClick
  end
  object BTimbrarByJson: TButton
    Left = 358
    Top = 278
    Width = 169
    Height = 41
    Caption = 'Timbrar Emision Timbrado JSON'
    TabOrder = 30
    OnClick = BTimbrarByJsonClick
  end
  object BValidarXml: TButton
    Left = 533
    Top = 278
    Width = 169
    Height = 41
    Caption = 'Validar XML'
    TabOrder = 31
    OnClick = BValidarXmlClick
  end
  object txt_Out: TMemo
    Left = 8
    Top = 384
    Width = 1032
    Height = 248
    Lines.Strings = (
      'txt_Out')
    TabOrder = 32
  end
  object StaticText5: TStaticText
    Left = 434
    Top = 361
    Width = 55
    Height = 17
    Caption = 'Respuesta'
    TabOrder = 33
  end
  object BEstadoCuenta: TButton
    Left = 135
    Top = 48
    Width = 99
    Height = 34
    Caption = 'Estado Cuenta'
    TabOrder = 34
    OnClick = BEstadoCuentaClick
  end
  object BOpenFile: TButton
    Left = 8
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Open File'
    TabOrder = 35
    OnClick = BOpenFileClick
  end
  object OpenDialog1: TOpenDialog
    Left = 1016
    Top = 608
  end
end
