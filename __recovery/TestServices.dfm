object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'TestServicesSW'
  ClientHeight = 567
  ClientWidth = 1116
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Label105: TLabel
    Left = 880
    Top = 480
    Width = 43
    Height = 13
    Caption = 'Label105'
  end
  object Label106: TLabel
    Left = 856
    Top = 472
    Width = 42
    Height = 13
    Caption = 'Message'
  end
  object Autenticación: TPageControl
    Left = -6
    Top = 0
    Width = 1121
    Height = 569
    ActivePage = TabSheet18
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Autenticaci'#243'n'
      object Label6: TLabel
        Left = 10
        Top = 3
        Width = 36
        Height = 13
        Caption = 'Usuario'
      end
      object Label4: TLabel
        Left = 9
        Top = 49
        Width = 56
        Height = 13
        Caption = 'Contrase'#241'a'
      end
      object Label5: TLabel
        Left = 8
        Top = 95
        Width = 19
        Height = 13
        Caption = 'URL'
      end
      object Label1: TLabel
        Left = 284
        Top = 176
        Width = 29
        Height = 13
        Caption = 'Token'
      end
      object Expiración: TLabel
        Left = 264
        Top = 149
        Width = 49
        Height = 13
        Caption = 'Expiraci'#243'n'
      end
      object Label2: TLabel
        Left = 246
        Top = 117
        Width = 67
        Height = 13
        Caption = 'Tipo de Token'
      end
      object Label7: TLabel
        Left = 264
        Top = 253
        Width = 42
        Height = 13
        Caption = 'Message'
      end
      object Label8: TLabel
        Left = 244
        Top = 293
        Width = 69
        Height = 13
        Caption = 'MessageDetail'
      end
      object Label9: TLabel
        Left = 275
        Top = 216
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object txtUser: TEdit
        Left = 8
        Top = 22
        Width = 169
        Height = 21
        TabOrder = 0
        Text = 'Usuario'
      end
      object txtPassword: TEdit
        Left = 8
        Top = 68
        Width = 169
        Height = 21
        TabOrder = 1
        Text = 'Contrase'#241'a'
      end
      object txtURL: TEdit
        Left = 8
        Top = 114
        Width = 169
        Height = 21
        TabOrder = 2
        Text = 'http://services.test.sw.com.mx'
      end
      object txtToken: TEdit
        Left = 319
        Top = 173
        Width = 714
        Height = 21
        TabOrder = 3
      end
      object txtCaducidad: TEdit
        Left = 319
        Top = 146
        Width = 169
        Height = 21
        TabOrder = 4
      end
      object txtTokenTipo: TEdit
        Left = 319
        Top = 119
        Width = 169
        Height = 21
        TabOrder = 5
      end
      object Button1: TButton
        Left = 7
        Top = 159
        Width = 166
        Height = 49
        Caption = 'Generar Token'
        TabOrder = 6
        OnClick = Button1Click
      end
      object txtMessageAuth: TEdit
        Left = 319
        Top = 250
        Width = 274
        Height = 21
        TabOrder = 7
      end
      object txtMessageDetailAuth: TEdit
        Left = 319
        Top = 290
        Width = 274
        Height = 21
        TabOrder = 8
      end
      object txtStatus: TEdit
        Left = 319
        Top = 213
        Width = 146
        Height = 21
        TabOrder = 9
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Timbrado'
      ImageIndex = 1
      object Label3: TLabel
        Left = 477
        Top = 298
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'message'
      end
      object Label10: TLabel
        Left = 450
        Top = 325
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Caption = 'messageDetail'
      end
      object Label12: TLabel
        Left = 143
        Top = 268
        Width = 19
        Height = 13
        Caption = 'TFD'
      end
      object Label13: TLabel
        Left = 138
        Top = 295
        Width = 24
        Height = 13
        Caption = 'CFDI'
      end
      object Label14: TLabel
        Left = 64
        Top = 322
        Width = 98
        Height = 13
        Caption = 'Cadena Original SAT'
      end
      object Label15: TLabel
        Left = 76
        Top = 349
        Width = 86
        Height = 13
        Caption = 'noCertificado SAT'
      end
      object Label16: TLabel
        Left = 71
        Top = 376
        Width = 91
        Height = 13
        Caption = 'noCertificado CFDI'
      end
      object Label17: TLabel
        Left = 137
        Top = 403
        Width = 25
        Height = 13
        Caption = 'UUID'
      end
      object Label18: TLabel
        Left = 118
        Top = 430
        Width = 44
        Height = 13
        Caption = 'Sello SAT'
      end
      object Label19: TLabel
        Left = 113
        Top = 457
        Width = 49
        Height = 13
        Caption = 'Sello CFDI'
      end
      object Label20: TLabel
        Left = 71
        Top = 484
        Width = 91
        Height = 13
        Caption = 'Fecha de Timbrado'
      end
      object Label21: TLabel
        Left = 111
        Top = 509
        Width = 51
        Height = 13
        Caption = 'C'#243'digo QR'
      end
      object stampXmlIn: TMemo
        Left = 16
        Top = 96
        Width = 1097
        Height = 153
        TabOrder = 0
      end
      object btnTimbrarV1: TButton
        Left = 16
        Top = 18
        Width = 137
        Height = 37
        Caption = 'Timbrar V1'
        TabOrder = 1
        OnClick = btnTimbrarV1Click
      end
      object Button3: TButton
        Left = 965
        Top = 65
        Width = 145
        Height = 25
        Caption = 'Cargar XML'
        TabOrder = 2
        OnClick = Button3Click
      end
      object btnTimbrarV2: TButton
        Left = 176
        Top = 18
        Width = 137
        Height = 37
        Caption = 'Timbrar V2'
        TabOrder = 3
        OnClick = btnTimbrarV2Click
      end
      object btnTimbrarV3: TButton
        Left = 336
        Top = 18
        Width = 137
        Height = 37
        Caption = 'Timbrar V3'
        TabOrder = 4
        OnClick = btnTimbrarV3Click
      end
      object btnTimbrarV4: TButton
        Left = 496
        Top = 18
        Width = 137
        Height = 37
        Caption = 'Timbrar V4'
        TabOrder = 5
        OnClick = btnTimbrarV4Click
      end
      object txtMessageDetailStamp: TEdit
        Left = 536
        Top = 322
        Width = 233
        Height = 21
        TabOrder = 6
      end
      object txtTfd: TEdit
        Left = 168
        Top = 260
        Width = 249
        Height = 21
        TabOrder = 7
      end
      object txtMessageStamp: TEdit
        Left = 536
        Top = 295
        Width = 233
        Height = 21
        TabOrder = 8
      end
      object txtCfdi: TEdit
        Left = 168
        Top = 287
        Width = 249
        Height = 21
        TabOrder = 9
      end
      object txtCadenaOriginalSat: TEdit
        Left = 168
        Top = 314
        Width = 249
        Height = 21
        TabOrder = 10
      end
      object txtNoCertificadoSat: TEdit
        Left = 168
        Top = 341
        Width = 249
        Height = 21
        TabOrder = 11
      end
      object txtNoCertificadoCfdi: TEdit
        Left = 168
        Top = 368
        Width = 249
        Height = 21
        TabOrder = 12
      end
      object txtUuid: TEdit
        Left = 168
        Top = 395
        Width = 249
        Height = 21
        TabOrder = 13
      end
      object txtSelloSat: TEdit
        Left = 168
        Top = 422
        Width = 249
        Height = 21
        TabOrder = 14
      end
      object txtSelloCfdi: TEdit
        Left = 168
        Top = 449
        Width = 249
        Height = 21
        TabOrder = 15
      end
      object txtFechaTimbrado: TEdit
        Left = 168
        Top = 476
        Width = 249
        Height = 21
        TabOrder = 16
      end
      object txtQrCode: TEdit
        Left = 168
        Top = 503
        Width = 249
        Height = 21
        TabOrder = 17
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Emisi'#243'n-Timbrado'
      ImageIndex = 2
      object TFD: TLabel
        Left = 111
        Top = 287
        Width = 19
        Height = 13
        Caption = 'TFD'
      end
      object adadsad: TLabel
        Left = 106
        Top = 314
        Width = 24
        Height = 13
        Caption = 'CFDI'
      end
      object Label24: TLabel
        Left = 32
        Top = 341
        Width = 98
        Height = 13
        Caption = 'Cadena Original SAT'
      end
      object Label25: TLabel
        Left = 44
        Top = 368
        Width = 86
        Height = 13
        Caption = 'noCertificado SAT'
      end
      object Label26: TLabel
        Left = 39
        Top = 395
        Width = 91
        Height = 13
        Caption = 'noCertificado CFDI'
      end
      object Label27: TLabel
        Left = 105
        Top = 422
        Width = 25
        Height = 13
        Caption = 'UUID'
      end
      object Label28: TLabel
        Left = 86
        Top = 449
        Width = 44
        Height = 13
        Caption = 'Sello SAT'
      end
      object Label29: TLabel
        Left = 81
        Top = 474
        Width = 49
        Height = 13
        Caption = 'Sello CFDI'
      end
      object Label30: TLabel
        Left = 39
        Top = 501
        Width = 91
        Height = 13
        Caption = 'Fecha de Timbrado'
      end
      object Label31: TLabel
        Left = 520
        Top = 287
        Width = 42
        Height = 13
        Caption = 'message'
      end
      object Label32: TLabel
        Left = 493
        Top = 309
        Width = 69
        Height = 13
        Caption = 'messageDetail'
      end
      object Label22: TLabel
        Left = 79
        Top = 525
        Width = 51
        Height = 13
        Caption = 'C'#243'digo QR'
      end
      object txtIssue: TMemo
        Left = 16
        Top = 120
        Width = 1097
        Height = 153
        TabOrder = 0
      end
      object Button2: TButton
        Left = 992
        Top = 72
        Width = 105
        Height = 33
        Caption = 'Cargar XML'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button4: TButton
        Left = 32
        Top = 24
        Width = 113
        Height = 33
        Caption = 'Issue V1'
        TabOrder = 2
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 176
        Top = 24
        Width = 113
        Height = 33
        Caption = 'Issue V2'
        TabOrder = 3
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 319
        Top = 24
        Width = 113
        Height = 33
        Caption = 'Issue V3'
        TabOrder = 4
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 470
        Top = 24
        Width = 113
        Height = 33
        Caption = 'Issue V4'
        TabOrder = 5
        OnClick = Button7Click
      end
      object txtIssueTFD: TEdit
        Left = 136
        Top = 279
        Width = 313
        Height = 21
        TabOrder = 6
      end
      object txtIssueCFDI: TEdit
        Left = 136
        Top = 306
        Width = 313
        Height = 21
        TabOrder = 7
      end
      object txtIssueCadOriSAT: TEdit
        Left = 136
        Top = 333
        Width = 313
        Height = 21
        TabOrder = 8
      end
      object txtIssueNoCertSAT: TEdit
        Left = 136
        Top = 360
        Width = 313
        Height = 21
        TabOrder = 9
      end
      object txtIssueNoCertCFDI: TEdit
        Left = 136
        Top = 387
        Width = 313
        Height = 21
        TabOrder = 10
      end
      object txtIssueUUID: TEdit
        Left = 136
        Top = 414
        Width = 313
        Height = 21
        TabOrder = 11
      end
      object txtIssueSelloSAT: TEdit
        Left = 136
        Top = 441
        Width = 313
        Height = 21
        TabOrder = 12
      end
      object txtIssueSelloCFDI: TEdit
        Left = 136
        Top = 468
        Width = 313
        Height = 21
        TabOrder = 13
      end
      object txtIssueFechaTimbrado: TEdit
        Left = 136
        Top = 493
        Width = 313
        Height = 21
        TabOrder = 14
      end
      object txtIssueMessage: TEdit
        Left = 568
        Top = 279
        Width = 233
        Height = 21
        TabOrder = 15
      end
      object txtIssueMessageDetail: TEdit
        Left = 568
        Top = 306
        Width = 233
        Height = 21
        TabOrder = 16
      end
      object txtIssueQr: TEdit
        Left = 136
        Top = 520
        Width = 313
        Height = 21
        TabOrder = 17
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Emisi'#243'n Timbrado JSON'
      ImageIndex = 3
      object Label52: TLabel
        Left = 95
        Top = 263
        Width = 19
        Height = 13
        Caption = 'TFD'
      end
      object Label53: TLabel
        Left = 90
        Top = 290
        Width = 24
        Height = 13
        Caption = 'CFDI'
      end
      object Label54: TLabel
        Left = 16
        Top = 317
        Width = 98
        Height = 13
        Caption = 'Cadena Original SAT'
      end
      object Label55: TLabel
        Left = 28
        Top = 344
        Width = 86
        Height = 13
        Caption = 'noCertificado SAT'
      end
      object Label56: TLabel
        Left = 23
        Top = 371
        Width = 91
        Height = 13
        Caption = 'noCertificado CFDI'
      end
      object Label57: TLabel
        Left = 89
        Top = 398
        Width = 25
        Height = 13
        Caption = 'UUID'
      end
      object Label58: TLabel
        Left = 70
        Top = 425
        Width = 44
        Height = 13
        Caption = 'Sello SAT'
      end
      object Label59: TLabel
        Left = 65
        Top = 452
        Width = 49
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Sello CFDI'
        ParentBiDiMode = False
      end
      object Label60: TLabel
        Left = 23
        Top = 479
        Width = 91
        Height = 13
        Caption = 'Fecha de Timbrado'
      end
      object Label61: TLabel
        Left = 63
        Top = 506
        Width = 51
        Height = 13
        Caption = 'C'#243'digo QR'
      end
      object Label62: TLabel
        Left = 464
        Top = 271
        Width = 42
        Height = 13
        Caption = 'message'
      end
      object Label63: TLabel
        Left = 437
        Top = 298
        Width = 69
        Height = 13
        Caption = 'messageDetail'
      end
      object memoJson: TMemo
        Left = 16
        Top = 104
        Width = 1097
        Height = 153
        TabOrder = 0
        OnChange = memoJsonChange
      end
      object Button12: TButton
        Left = 24
        Top = 16
        Width = 161
        Height = 41
        Caption = 'Emisi'#243'n timbrado-Json V1'
        TabOrder = 1
        OnClick = Button12Click
      end
      object Button13: TButton
        Left = 208
        Top = 16
        Width = 161
        Height = 41
        Caption = 'Emisi'#243'n timbrado-Json V2'
        TabOrder = 2
        OnClick = Button13Click
      end
      object Button14: TButton
        Left = 392
        Top = 16
        Width = 161
        Height = 41
        Caption = 'Emisi'#243'n timbrado-Json V3'
        TabOrder = 3
        OnClick = Button14Click
      end
      object Button15: TButton
        Left = 576
        Top = 16
        Width = 161
        Height = 41
        Caption = 'Emisi'#243'n timbrado-Json V4'
        TabOrder = 4
        OnClick = Button15Click
      end
      object Button16: TButton
        Left = 1008
        Top = 56
        Width = 89
        Height = 33
        Caption = 'Cargar JSON'
        TabOrder = 5
        OnClick = Button16Click
      end
      object txtJsonTfd: TEdit
        Left = 120
        Top = 263
        Width = 265
        Height = 21
        TabOrder = 6
      end
      object txtJsonCfdi: TEdit
        Left = 120
        Top = 290
        Width = 265
        Height = 21
        TabOrder = 7
      end
      object txtJsonCadenaOriginalSAT: TEdit
        Left = 120
        Top = 317
        Width = 265
        Height = 21
        TabOrder = 8
      end
      object txtJsonNoCertificadoSAT: TEdit
        Left = 120
        Top = 344
        Width = 265
        Height = 21
        TabOrder = 9
      end
      object txtJsonNoCertificadoCFDI: TEdit
        Left = 120
        Top = 371
        Width = 265
        Height = 21
        TabOrder = 10
      end
      object txtJsonUUID: TEdit
        Left = 120
        Top = 398
        Width = 265
        Height = 21
        TabOrder = 11
      end
      object txtJsonSelloSAT: TEdit
        Left = 120
        Top = 425
        Width = 265
        Height = 21
        TabOrder = 12
      end
      object txtJsonSelloCFDI: TEdit
        Left = 120
        Top = 452
        Width = 265
        Height = 21
        TabOrder = 13
      end
      object txtJsonFechaDeTimbrado: TEdit
        Left = 120
        Top = 479
        Width = 265
        Height = 21
        TabOrder = 14
      end
      object txtJsonCodigoQr: TEdit
        Left = 120
        Top = 506
        Width = 265
        Height = 21
        TabOrder = 15
      end
      object txtJsonMessage: TEdit
        Left = 512
        Top = 263
        Width = 265
        Height = 21
        TabOrder = 16
      end
      object txtJsonMessageDetail: TEdit
        Left = 512
        Top = 290
        Width = 265
        Height = 21
        TabOrder = 17
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Cancelaci'#243'n'
      ImageIndex = 4
      object Label71: TLabel
        Left = 0
        Top = 224
        Width = 37
        Height = 13
        Caption = 'Label71'
      end
      object TabCancelacion: TPageControl
        Left = 0
        Top = 0
        Width = 1113
        Height = 545
        ActivePage = TabSheet13
        TabOrder = 0
        object TabSheet10: TTabSheet
          Caption = 'Cancelaci'#243'n'
          object Label104: TLabel
            Left = 792
            Top = 387
            Width = 42
            Height = 13
            Caption = 'Message'
          end
          object Cancelación: TPageControl
            Left = 0
            Top = 3
            Width = 1105
            Height = 510
            ActivePage = TabSheet17
            TabOrder = 0
            object TabSheet14: TTabSheet
              Caption = 'Cancelaci'#243'n por CSD'
              object Label64: TLabel
                Left = 24
                Top = 218
                Width = 29
                Height = 13
                Caption = 'Acuse'
              end
              object Label65: TLabel
                Left = 160
                Top = 55
                Width = 25
                Height = 13
                Caption = 'UUID'
              end
              object Label66: TLabel
                Left = 118
                Top = 78
                Width = 67
                Height = 13
                BiDiMode = bdRightToLeft
                Caption = 'Password Key'
                ParentBiDiMode = False
              end
              object Label67: TLabel
                Left = 165
                Top = 24
                Width = 20
                Height = 13
                Caption = 'RFC'
              end
              object Label130: TLabel
                Left = 64
                Top = 370
                Width = 31
                Height = 13
                Caption = 'Status'
              end
              object Label131: TLabel
                Left = 53
                Top = 413
                Width = 42
                Height = 13
                Caption = 'message'
              end
              object Label132: TLabel
                Left = 26
                Top = 448
                Width = 69
                Height = 13
                Caption = 'messageDetail'
              end
              object Button17: TButton
                Left = 0
                Top = 3
                Width = 137
                Height = 41
                Caption = 'Cancelar Por CSD'
                TabOrder = 0
                OnClick = Button17Click
              end
              object Button20: TButton
                Left = 991
                Top = 114
                Width = 103
                Height = 33
                Caption = 'Buscar .Cer'
                TabOrder = 1
                OnClick = Button20Click
              end
              object Button18: TButton
                Left = 991
                Top = 3
                Width = 103
                Height = 33
                Caption = 'Buscar .Key'
                TabOrder = 2
                OnClick = Button18Click
              end
              object txtCsdCer: TMemo
                Left = 480
                Top = 114
                Width = 505
                Height = 105
                TabOrder = 3
              end
              object txtCsdKey: TMemo
                Left = 470
                Top = 3
                Width = 505
                Height = 105
                TabOrder = 4
              end
              object txtCsdAcuse: TMemo
                Left = 24
                Top = 237
                Width = 1060
                Height = 105
                Lines.Strings = (
                  '')
                TabOrder = 5
              end
              object txtCsdUuid: TEdit
                Left = 191
                Top = 48
                Width = 273
                Height = 21
                TabOrder = 6
              end
              object txtCsdPassword: TEdit
                Left = 191
                Top = 75
                Width = 273
                Height = 21
                TabOrder = 7
              end
              object txtCsdStatus: TEdit
                Left = 112
                Top = 367
                Width = 241
                Height = 21
                TabOrder = 8
              end
              object txtCsdMessage: TEdit
                Left = 112
                Top = 408
                Width = 241
                Height = 21
                TabOrder = 9
              end
              object txtCsdMessageDetail: TEdit
                Left = 112
                Top = 440
                Width = 241
                Height = 21
                TabOrder = 10
              end
              object txtCsdRfcEmisor: TEdit
                Left = 191
                Top = 21
                Width = 273
                Height = 21
                TabOrder = 11
              end
            end
            object TabSheet15: TTabSheet
              Caption = 'Cancelaci'#243'n por PFX'
              ImageIndex = 1
              object Label68: TLabel
                Left = 192
                Top = 16
                Width = 54
                Height = 13
                Caption = 'RFC Emisor'
              end
              object Label69: TLabel
                Left = 217
                Top = 67
                Width = 25
                Height = 13
                Caption = 'UUID'
              end
              object Label70: TLabel
                Left = 192
                Top = 112
                Width = 46
                Height = 13
                Caption = 'Password'
              end
              object Label127: TLabel
                Left = 96
                Top = 362
                Width = 31
                Height = 13
                Caption = 'Status'
              end
              object Label128: TLabel
                Left = 85
                Top = 405
                Width = 42
                Height = 13
                Caption = 'message'
              end
              object Label129: TLabel
                Left = 58
                Top = 440
                Width = 69
                Height = 13
                Caption = 'messageDetail'
              end
              object txtPfxAcuse: TMemo
                Left = 16
                Top = 224
                Width = 1057
                Height = 129
                TabOrder = 0
              end
              object txtPfxPfx: TMemo
                Left = 456
                Top = 13
                Width = 521
                Height = 109
                TabOrder = 1
              end
              object txtPfxStatus: TEdit
                Left = 144
                Top = 359
                Width = 281
                Height = 21
                TabOrder = 2
              end
              object txtPfxMessage: TEdit
                Left = 144
                Top = 402
                Width = 281
                Height = 21
                TabOrder = 3
              end
              object txtPfxMessageDetail: TEdit
                Left = 144
                Top = 437
                Width = 281
                Height = 21
                TabOrder = 4
              end
              object Button19: TButton
                Left = 8
                Top = 16
                Width = 169
                Height = 65
                Caption = 'Cancelar por PFX'
                TabOrder = 5
                OnClick = Button19Click
              end
              object txtPfxRfcEmisor: TEdit
                Left = 248
                Top = 16
                Width = 177
                Height = 21
                TabOrder = 6
              end
              object txtPfxUuid: TEdit
                Left = 248
                Top = 64
                Width = 177
                Height = 21
                TabOrder = 7
              end
              object txtPfxPassword: TEdit
                Left = 248
                Top = 104
                Width = 177
                Height = 21
                TabOrder = 8
              end
              object Button21: TButton
                Left = 1008
                Top = 24
                Width = 81
                Height = 41
                Caption = 'Abrir PFX'
                TabOrder = 9
                OnClick = Button21Click
              end
            end
            object TabSheet17: TTabSheet
              Caption = 'Cancelaci'#243'n por UUID'
              ImageIndex = 3
              object Label119: TLabel
                Left = 216
                Top = 43
                Width = 20
                Height = 13
                Caption = 'RFC'
              end
              object Label120: TLabel
                Left = 211
                Top = 83
                Width = 25
                Height = 13
                Caption = 'UUID'
              end
              object Label121: TLabel
                Left = 216
                Top = 331
                Width = 31
                Height = 13
                Caption = 'Status'
              end
              object Label122: TLabel
                Left = 204
                Top = 371
                Width = 42
                Height = 13
                Caption = 'message'
              end
              object Label123: TLabel
                Left = 178
                Top = 416
                Width = 69
                Height = 13
                Caption = 'messageDetail'
              end
              object Button24: TButton
                Left = 8
                Top = 32
                Width = 137
                Height = 57
                Caption = 'Cancelar por UUID'
                TabOrder = 0
                OnClick = Button24Click
              end
              object txtUuidRfc: TEdit
                Left = 256
                Top = 40
                Width = 241
                Height = 21
                TabOrder = 1
              end
              object txtUuidUuid: TEdit
                Left = 256
                Top = 80
                Width = 241
                Height = 21
                TabOrder = 2
              end
              object txtUuidAcuse: TMemo
                Left = 16
                Top = 184
                Width = 1065
                Height = 121
                TabOrder = 3
              end
              object txtUuidStatus: TEdit
                Left = 264
                Top = 328
                Width = 281
                Height = 21
                TabOrder = 4
              end
              object txtUuidMessage: TEdit
                Left = 264
                Top = 368
                Width = 281
                Height = 21
                TabOrder = 5
              end
              object txtUuidMessageDetail: TEdit
                Left = 264
                Top = 408
                Width = 281
                Height = 21
                TabOrder = 6
              end
            end
            object TabSheet16: TTabSheet
              Caption = 'Cancelaci'#243'n por XML'
              ImageIndex = 2
              object Label124: TLabel
                Left = 154
                Top = 371
                Width = 31
                Height = 13
                Caption = 'Status'
              end
              object Label125: TLabel
                Left = 143
                Top = 416
                Width = 42
                Height = 13
                Caption = 'message'
              end
              object Label126: TLabel
                Left = 116
                Top = 456
                Width = 69
                Height = 13
                Caption = 'messageDetail'
              end
              object txtXmlXml: TMemo
                Left = 240
                Top = 24
                Width = 713
                Height = 129
                TabOrder = 0
              end
              object txtXmlAcuse: TMemo
                Left = 48
                Top = 224
                Width = 905
                Height = 121
                TabOrder = 1
              end
              object txtXmlStatus: TEdit
                Left = 200
                Top = 368
                Width = 297
                Height = 21
                TabOrder = 2
              end
              object txtXmlMessage: TEdit
                Left = 200
                Top = 408
                Width = 297
                Height = 21
                TabOrder = 3
              end
              object txtXmlMessageDetail: TEdit
                Left = 200
                Top = 448
                Width = 297
                Height = 21
                TabOrder = 4
              end
              object Button22: TButton
                Left = 48
                Top = 24
                Width = 137
                Height = 57
                Caption = 'Cancelar por XML'
                TabOrder = 5
                OnClick = Button22Click
              end
            end
          end
        end
        object TabSheet11: TTabSheet
          Caption = 'Consultar Relacionados'
          ImageIndex = 1
          object Label72: TLabel
            Left = 45
            Top = 245
            Width = 53
            Height = 13
            Caption = 'Cod Status'
          end
          object Label73: TLabel
            Left = 16
            Top = 272
            Width = 82
            Height = 13
            Caption = 'UUID Consultado'
          end
          object Label74: TLabel
            Left = 50
            Top = 299
            Width = 48
            Height = 13
            Caption = 'Resultado'
          end
          object Label75: TLabel
            Left = 335
            Top = 19
            Width = 83
            Height = 13
            Caption = 'UUID a Consultar'
          end
          object Label76: TLabel
            Left = 364
            Top = 46
            Width = 54
            Height = 13
            Caption = 'RFC Emisor'
          end
          object Label77: TLabel
            Left = 351
            Top = 73
            Width = 67
            Height = 13
            Caption = 'Password Key'
          end
          object Label82: TLabel
            Left = 104
            Top = 352
            Width = 94
            Height = 13
            Caption = 'Relacionados Padre'
          end
          object Label83: TLabel
            Left = 504
            Top = 352
            Width = 89
            Height = 13
            Caption = 'Relacionados Hijos'
          end
          object Label86: TLabel
            Left = 784
            Top = 379
            Width = 42
            Height = 13
            Caption = 'Message'
          end
          object Label87: TLabel
            Left = 754
            Top = 406
            Width = 72
            Height = 13
            Caption = 'Message Detail'
          end
          object Label88: TLabel
            Left = 795
            Top = 433
            Width = 31
            Height = 13
            Caption = 'Status'
          end
          object Label89: TLabel
            Left = 256
            Top = 112
            Width = 130
            Height = 13
            Caption = 'XML Consulta Relacionados'
          end
          object Button25: TButton
            Left = 16
            Top = 16
            Width = 161
            Height = 41
            Caption = 'Consultar Relacionados CSD'
            TabOrder = 0
            OnClick = Button25Click
          end
          object txtRelationsUuid: TEdit
            Left = 424
            Top = 16
            Width = 257
            Height = 21
            TabOrder = 1
            Text = ' '
          end
          object txtRelationsCodStatus: TEdit
            Left = 104
            Top = 242
            Width = 225
            Height = 21
            TabOrder = 2
          end
          object txtRelationsUuidConsultado: TEdit
            Left = 104
            Top = 269
            Width = 225
            Height = 21
            TabOrder = 3
          end
          object txtRelationsResultado: TEdit
            Left = 104
            Top = 296
            Width = 225
            Height = 21
            TabOrder = 4
          end
          object txtRelationsMessage: TEdit
            Left = 832
            Top = 376
            Width = 270
            Height = 21
            TabOrder = 5
          end
          object txtRelationsMessageDetail: TEdit
            Left = 832
            Top = 403
            Width = 270
            Height = 21
            TabOrder = 6
          end
          object txtRelationsRfcEmisor: TEdit
            Left = 424
            Top = 43
            Width = 257
            Height = 21
            TabOrder = 7
          end
          object txtRelationsPassword: TEdit
            Left = 424
            Top = 70
            Width = 257
            Height = 21
            TabOrder = 8
          end
          object txtRelationsB64Cer: TMemo
            Left = 757
            Top = 43
            Width = 345
            Height = 81
            TabOrder = 9
          end
          object txtRelationsB64Key: TMemo
            Left = 757
            Top = 158
            Width = 345
            Height = 81
            TabOrder = 10
          end
          object txtRelationsB64Pfx: TMemo
            Left = 757
            Top = 274
            Width = 345
            Height = 73
            TabOrder = 11
          end
          object Button26: TButton
            Left = 16
            Top = 63
            Width = 161
            Height = 42
            Caption = 'Consulta Relacionados PFX'
            TabOrder = 12
            OnClick = Button26Click
          end
          object txtRelationsStatus: TEdit
            Left = 832
            Top = 430
            Width = 270
            Height = 21
            TabOrder = 13
          end
          object Button27: TButton
            Left = 16
            Top = 111
            Width = 161
            Height = 41
            Caption = 'Consulta Relacionados XML'
            TabOrder = 14
            OnClick = Button27Click
          end
          object txtRelationsXml: TMemo
            Left = 400
            Top = 112
            Width = 281
            Height = 205
            TabOrder = 15
          end
          object Button28: TButton
            Left = 329
            Top = 131
            Width = 65
            Height = 41
            Caption = 'Cargar XML'
            TabOrder = 16
            OnClick = Button28Click
          end
          object Button29: TButton
            Left = 16
            Top = 158
            Width = 161
            Height = 41
            Caption = 'Consulta Relacionados UUID'
            TabOrder = 17
            OnClick = Button29Click
          end
          object Button30: TButton
            Left = 757
            Top = 14
            Width = 121
            Height = 23
            Caption = 'Cargar CSD en base64'
            TabOrder = 18
            OnClick = Button30Click
          end
          object Button31: TButton
            Left = 757
            Top = 129
            Width = 116
            Height = 23
            Caption = 'Cargar KEY en base64'
            TabOrder = 19
            OnClick = Button31Click
          end
          object Button32: TButton
            Left = 757
            Top = 245
            Width = 116
            Height = 23
            Caption = 'Cargar PFX en base64'
            TabOrder = 20
            OnClick = Button32Click
          end
          object RelacionadosPadre: TListBox
            Left = 104
            Top = 371
            Width = 225
            Height = 140
            ItemHeight = 13
            TabOrder = 21
          end
          object RelacionadosHijo: TListBox
            Left = 440
            Top = 371
            Width = 225
            Height = 140
            ItemHeight = 13
            TabOrder = 22
          end
        end
        object TabSheet12: TTabSheet
          Caption = 'Pendientes Aceptaci'#243'n  Rechazo'
          ImageIndex = 2
          object Label90: TLabel
            Left = 83
            Top = 203
            Width = 31
            Height = 13
            Caption = 'Status'
          end
          object Label91: TLabel
            Left = 61
            Top = 227
            Width = 53
            Height = 13
            Caption = 'Cod Status'
          end
          object Label92: TLabel
            Left = 72
            Top = 257
            Width = 42
            Height = 13
            Caption = 'Message'
          end
          object Label93: TLabel
            Left = 42
            Top = 284
            Width = 72
            Height = 13
            Caption = 'Message Detail'
          end
          object Label94: TLabel
            Left = 336
            Top = 24
            Width = 32
            Height = 13
            Caption = 'UUID'#39's'
          end
          object Label95: TLabel
            Left = 36
            Top = 107
            Width = 78
            Height = 13
            Caption = 'RFC a Consultar'
          end
          object Button33: TButton
            Left = 36
            Top = 65
            Width = 113
            Height = 33
            Caption = 'Consultar Pendientes'
            TabOrder = 0
            OnClick = Button33Click
          end
          object txtPendingsStatus: TEdit
            Left = 120
            Top = 200
            Width = 153
            Height = 21
            TabOrder = 1
          end
          object txtPendingsUuids: TListBox
            Left = 336
            Top = 56
            Width = 265
            Height = 289
            ItemHeight = 13
            TabOrder = 2
          end
          object txtPendingsCodEstatus: TEdit
            Left = 120
            Top = 227
            Width = 153
            Height = 21
            TabOrder = 3
          end
          object txtPendingsMessage: TEdit
            Left = 120
            Top = 254
            Width = 153
            Height = 21
            TabOrder = 4
          end
          object txtPendingsMessageDetail: TEdit
            Left = 120
            Top = 281
            Width = 153
            Height = 21
            TabOrder = 5
          end
          object txtPendingsRFC: TEdit
            Left = 120
            Top = 104
            Width = 153
            Height = 21
            TabOrder = 6
            Text = 'LAN7008173R5'
          end
        end
        object TabSheet13: TTabSheet
          Caption = 'Aceptar o Rechazar Cancelaci'#243'n'
          ImageIndex = 3
          object Label96: TLabel
            Left = 151
            Top = 16
            Width = 54
            Height = 13
            Caption = 'RFC Emisor'
          end
          object Label97: TLabel
            Left = 138
            Top = 40
            Width = 67
            Height = 13
            Caption = 'Password Key'
          end
          object Label98: TLabel
            Left = 177
            Top = 70
            Width = 25
            Height = 13
            Caption = 'UUID'
          end
          object Label99: TLabel
            Left = 171
            Top = 99
            Width = 31
            Height = 13
            Caption = 'Acci'#243'n'
          end
          object Label100: TLabel
            Left = 216
            Top = 123
            Width = 98
            Height = 13
            Caption = 'Aceptacion/Rechazo'
          end
          object Label101: TLabel
            Left = 32
            Top = 304
            Width = 50
            Height = 13
            Caption = 'CodStatus'
          end
          object Label102: TLabel
            Left = 440
            Top = 288
            Width = 29
            Height = 13
            Caption = 'Acuse'
          end
          object Label103: TLabel
            Left = 40
            Top = 360
            Width = 66
            Height = 13
            Caption = 'Status UUID'#39's'
          end
          object Label107: TLabel
            Left = 779
            Top = 396
            Width = 42
            Height = 13
            Caption = 'message'
          end
          object Label108: TLabel
            Left = 779
            Top = 424
            Width = 69
            Height = 13
            Caption = 'messageDetail'
          end
          object Status: TLabel
            Left = 779
            Top = 453
            Width = 31
            Height = 13
            Caption = 'Status'
          end
          object txtAcceptRejectCer: TMemo
            Left = 765
            Top = 57
            Width = 337
            Height = 81
            TabOrder = 0
          end
          object txtAcceptRejectKey: TMemo
            Left = 765
            Top = 183
            Width = 337
            Height = 81
            TabOrder = 1
          end
          object txtAcceptRejectPfx: TMemo
            Left = 765
            Top = 309
            Width = 337
            Height = 81
            TabOrder = 2
          end
          object Button34: TButton
            Left = 765
            Top = 144
            Width = 129
            Height = 33
            Caption = 'Importar Key a base64'
            TabOrder = 3
            OnClick = Button34Click
          end
          object Button35: TButton
            Left = 765
            Top = 18
            Width = 129
            Height = 33
            Caption = 'Importar CSD a base64'
            TabOrder = 4
            OnClick = Button35Click
          end
          object Button36: TButton
            Left = 765
            Top = 270
            Width = 129
            Height = 33
            Caption = 'Importar PFX a base64'
            TabOrder = 5
            OnClick = Button36Click
          end
          object Button37: TButton
            Left = 3
            Top = 16
            Width = 129
            Height = 41
            Caption = 'Cancelaci'#243'n por CSD'
            TabOrder = 6
            OnClick = Button37Click
          end
          object Button38: TButton
            Left = 3
            Top = 63
            Width = 129
            Height = 41
            Caption = 'Cancelaci'#243'n por PFX'
            TabOrder = 7
            OnClick = Button38Click
          end
          object Button39: TButton
            Left = 3
            Top = 110
            Width = 129
            Height = 41
            Caption = 'Cancelaci'#243'n por XML'
            TabOrder = 8
            OnClick = Button39Click
          end
          object Button40: TButton
            Left = 3
            Top = 157
            Width = 129
            Height = 41
            Caption = 'Cancelaci'#243'n por UUID'
            TabOrder = 9
            OnClick = Button40Click
          end
          object Memo5: TMemo
            Left = 422
            Top = 55
            Width = 337
            Height = 207
            TabOrder = 10
          end
          object Button41: TButton
            Left = 422
            Top = 16
            Width = 337
            Height = 33
            Caption = 'Importar XML de tipo SolicitudAceptacionRechazo'
            TabOrder = 11
            OnClick = Button41Click
          end
          object txtAcceptRejectRFC: TEdit
            Left = 208
            Top = 13
            Width = 208
            Height = 21
            TabOrder = 12
            Text = 'LAN7008173R5'
          end
          object txtAcceptRejectPassword: TEdit
            Left = 208
            Top = 40
            Width = 208
            Height = 21
            TabOrder = 13
            Text = '12345678a'
          end
          object txtAcceptRejectUUID: TEdit
            Left = 208
            Top = 67
            Width = 208
            Height = 21
            TabOrder = 14
            Text = ' '
          end
          object txtAcceptRejectAccion: TEdit
            Left = 208
            Top = 96
            Width = 209
            Height = 21
            TabOrder = 15
            Text = 'Aceptacion'
          end
          object txtAcceptRejectCodStatus: TEdit
            Left = 104
            Top = 301
            Width = 177
            Height = 21
            TabOrder = 16
          end
          object txtAcceptRejectAcuse: TMemo
            Left = 422
            Top = 307
            Width = 337
            Height = 174
            TabOrder = 17
          end
          object txtAcceptRejectFolios: TListBox
            Left = 32
            Top = 384
            Width = 384
            Height = 97
            ItemHeight = 13
            TabOrder = 18
          end
          object txtAcceptRejectMessage: TEdit
            Left = 878
            Top = 396
            Width = 224
            Height = 21
            TabOrder = 19
          end
          object txtAcceptRejectMessageDetail: TEdit
            Left = 878
            Top = 423
            Width = 224
            Height = 21
            TabOrder = 20
          end
          object txtAcceptRejectStatus: TEdit
            Left = 878
            Top = 450
            Width = 224
            Height = 21
            TabOrder = 21
          end
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Validaci'#243'n de XML'
      ImageIndex = 5
      object Label11: TLabel
        Left = 129
        Top = 312
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object Label45: TLabel
        Left = 64
        Top = 339
        Width = 96
        Height = 13
        Caption = 'cadena Original SAT'
      end
      object Label46: TLabel
        Left = 16
        Top = 366
        Width = 144
        Height = 13
        Caption = 'Cadena Original Comprobante'
      end
      object Label47: TLabel
        Left = 135
        Top = 388
        Width = 25
        Height = 13
        Caption = 'UUID'
      end
      object Label48: TLabel
        Left = 107
        Top = 420
        Width = 53
        Height = 13
        Caption = 'Status SAT'
      end
      object Label49: TLabel
        Left = 79
        Top = 447
        Width = 81
        Height = 13
        Caption = 'Status Code SAT'
      end
      object Label50: TLabel
        Left = 118
        Top = 474
        Width = 42
        Height = 13
        Caption = 'message'
      end
      object Label51: TLabel
        Left = 91
        Top = 501
        Width = 69
        Height = 13
        Caption = 'messageDetail'
      end
      object validateCfdiMemo: TMemo
        Left = 16
        Top = 112
        Width = 1097
        Height = 153
        TabOrder = 0
      end
      object txtValidaXmlStatus: TEdit
        Left = 166
        Top = 304
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object txtValidaXmlCadenaOriginalSAT: TEdit
        Left = 166
        Top = 331
        Width = 921
        Height = 21
        TabOrder = 2
      end
      object txtValidaXmlCadenaOriginalComprobante: TEdit
        Left = 166
        Top = 358
        Width = 921
        Height = 21
        TabOrder = 3
      end
      object txtValidaXmlUuid: TEdit
        Left = 166
        Top = 385
        Width = 145
        Height = 21
        TabOrder = 4
      end
      object txtValidaXmlStatusSat: TEdit
        Left = 166
        Top = 412
        Width = 145
        Height = 21
        TabOrder = 5
      end
      object txtValidaXmlStatusCodeSAT: TEdit
        Left = 166
        Top = 439
        Width = 145
        Height = 21
        TabOrder = 6
      end
      object txtValidaXmlMessage: TEdit
        Left = 166
        Top = 466
        Width = 529
        Height = 21
        TabOrder = 7
      end
      object txtValidaXmlMessageDetail: TEdit
        Left = 166
        Top = 493
        Width = 529
        Height = 21
        TabOrder = 8
      end
      object Button10: TButton
        Left = 1024
        Top = 56
        Width = 81
        Height = 41
        Caption = 'Abrir CFDI'
        TabOrder = 9
        OnClick = Button10Click
      end
      object Button11: TButton
        Left = 8
        Top = 16
        Width = 145
        Height = 41
        Caption = 'Validar CFDI'
        TabOrder = 10
        OnClick = Button11Click
      end
    end
    object TabSheet18: TTabSheet
      Caption = 'AccountBalance'
      ImageIndex = 9
      object Label109: TLabel
        Left = 280
        Top = 40
        Width = 67
        Height = 13
        Caption = 'idSaldoCliente'
      end
      object Label110: TLabel
        Left = 280
        Top = 72
        Width = 77
        Height = 13
        Caption = 'idClienteUsuario'
      end
      object Label111: TLabel
        Left = 280
        Top = 109
        Width = 62
        Height = 13
        Caption = 'saldoTimbres'
      end
      object Label112: TLabel
        Left = 280
        Top = 144
        Width = 80
        Height = 13
        Caption = 'timbresUtilizados'
      end
      object Label113: TLabel
        Left = 280
        Top = 183
        Width = 76
        Height = 13
        Caption = 'fechaExpiracion'
      end
      object Label114: TLabel
        Left = 280
        Top = 224
        Width = 42
        Height = 13
        Caption = 'unlimited'
      end
      object Label115: TLabel
        Left = 280
        Top = 264
        Width = 84
        Height = 13
        Caption = 'timbresAsignados'
      end
      object Label116: TLabel
        Left = 280
        Top = 304
        Width = 30
        Height = 13
        Caption = 'status'
      end
      object Label117: TLabel
        Left = 280
        Top = 344
        Width = 42
        Height = 13
        Caption = 'message'
      end
      object Label118: TLabel
        Left = 280
        Top = 384
        Width = 69
        Height = 13
        Caption = 'messageDetail'
      end
      object btnBalance: TButton
        Left = 40
        Top = 155
        Width = 145
        Height = 41
        Caption = 'Obtener Estado Cuenta'
        TabOrder = 0
        OnClick = btnBalanceClick
      end
      object txtIdSaldoCliente: TEdit
        Left = 424
        Top = 37
        Width = 273
        Height = 21
        TabOrder = 1
      end
      object txtIdClienteUsuario: TEdit
        Left = 424
        Top = 69
        Width = 273
        Height = 21
        TabOrder = 2
      end
      object txtSaldoTimbres: TEdit
        Left = 424
        Top = 106
        Width = 273
        Height = 21
        TabOrder = 3
      end
      object txtTimbresUtilizados: TEdit
        Left = 424
        Top = 141
        Width = 273
        Height = 21
        TabOrder = 4
      end
      object txtFechaExpiracion: TEdit
        Left = 424
        Top = 180
        Width = 273
        Height = 21
        TabOrder = 5
      end
      object txtUnlimited: TEdit
        Left = 424
        Top = 221
        Width = 273
        Height = 21
        TabOrder = 6
      end
      object txtTimbresAsignados: TEdit
        Left = 424
        Top = 261
        Width = 273
        Height = 21
        TabOrder = 7
      end
      object txtStatusBalance: TEdit
        Left = 424
        Top = 301
        Width = 273
        Height = 21
        TabOrder = 8
      end
      object txtMessageBalance: TEdit
        Left = 424
        Top = 341
        Width = 273
        Height = 21
        TabOrder = 9
      end
      object txtMessageDetailBalance: TEdit
        Left = 424
        Top = 381
        Width = 273
        Height = 21
        TabOrder = 10
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 1088
  end
end
