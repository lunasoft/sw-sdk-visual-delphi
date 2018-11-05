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
    ActivePage = TabSheet5
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Autenticaci'#243'n'
      object Label6: TLabel
        Left = 3
        Top = 3
        Width = 36
        Height = 13
        Caption = 'Usuario'
      end
      object Label4: TLabel
        Left = 3
        Top = 49
        Width = 56
        Height = 13
        Caption = 'Contrase'#241'a'
      end
      object Label5: TLabel
        Left = 3
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
        Left = 3
        Top = 22
        Width = 169
        Height = 21
        TabOrder = 0
        Text = 'demo'
      end
      object txtPassword: TEdit
        Left = 0
        Top = 68
        Width = 169
        Height = 21
        TabOrder = 1
        Text = '123456789'
      end
      object txtURL: TEdit
        Left = 3
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
        Left = 3
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
        Lines.Strings = (
          ' {'
          '    "Version": "3.3",'
          '    "Serie": "PAGOS",'
          '    "Folio": "1",'
          '    "Fecha": "2018-09-05T16:25:25",'
          '    "NoCertificado": "",'
          '    "SubTotal": "0",'
          '    "Moneda": "XXX",'
          '    "Total": "0",'
          '    "TipoDeComprobante": "P",'
          '    "LugarExpedicion": "32630",'
          '    "Emisor": {'
          '      "Rfc": "LAN7008173R5",'
          '      "Nombre": "TestEmisor",'
          '      "RegimenFiscal": "601"'
          '    },'
          '    "Receptor": {'
          '      "Rfc": "XEXX010101000",'
          '      "Nombre": "TestReceptor",'
          '      "UsoCFDI": "P01"'
          '    },'
          '    "Conceptos": [{'
          '        "ClaveProdServ": "84111506",'
          '        "Cantidad": "1.000000",'
          '        "ClaveUnidad": "ACT",'
          '        "Descripcion": "Pago",'
          '        "ValorUnitario": "0.000000",'
          '        "Importe": "0.00"'
          '    }],'
          '    "Complemento": '
          '['
          '        {'
          '            "HasElements": true,'
          '            "Any": ['
          '                {'
          '                    "Pago10:Pagos": {'
          '                        "Pago": [{'
          '                           "FechaPago": "2018-09-01T01:00:00",'
          '                            "FormaDePagoP": "03",'
          '                            "MonedaP": "USD",'
          '                            "TipoCambioP": "20.0000",'
          '                            "Monto": "2100.00",'
          '                            "NumOperacion": "125423",'
          '                            "DoctoRelacionado": ['
          '                              {'
          
            '              "IdDocumento": "65112e58-8cbc-46e3-8923-408b382933' +
            'e7",'
          '              "Serie": "FACTURA",'
          '              "Folio": "201948000022000100",'
          '              "MonedaDR": "MXN",'
          '              "TipoCambioDR": "0.0500",'
          '              "MetodoDePagoDR": "PPD",'
          '              "NumParcialidad": "2",'
          '              "ImpSaldoAnt": "10000.00",'
          '              "ImpPagado": "10000.00",'
          '              "ImpSaldoInsoluto": "0.00"'
          '            },'
          '            {'
          
            '              "IdDocumento": "65112e58-8cbc-46e3-8923-408b382933' +
            'e9",'
          '              "Serie": "FACTURA",'
          '              "Folio": "5189891",'
          '              "MonedaDR": "USD",'
          '              "MetodoDePagoDR": "PPD",'
          '              "NumParcialidad": "4",'
          '              "ImpSaldoAnt": "1000.00",'
          '              "ImpPagado": "500.00",'
          '              "ImpSaldoInsoluto": "500.00"'
          '            },'
          '            {'
          
            '              "IdDocumento": "65112e58-8cbc-46e3-8923-408b382933' +
            'e8",'
          '              "Serie": "FACTURA",'
          '              "Folio": "251781551",'
          '              "MonedaDR": "EUR",'
          '              "TipoCambioDR": "1.1000",'
          '              "MetodoDePagoDR": "PPD",'
          '              "NumParcialidad": "1",'
          '              "ImpSaldoAnt": "20000.00",'
          '              "ImpPagado": "1000.00",'
          '              "ImpSaldoInsoluto": "19000.00"'
          '            }]'
          '                        }]'
          '                     }'
          '                }'
          '            ]'
          '        }'
          '    ]'
          '  }')
        TabOrder = 0
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
        ActivePage = TabSheet11
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
            Text = '51BADE4D-8285-4597-A092-7DB1D50E5EFD'
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
            Text = 'LAN7008173R5'
          end
          object txtRelationsPassword: TEdit
            Left = 424
            Top = 70
            Width = 257
            Height = 21
            TabOrder = 8
            Text = '12345678a'
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
            Lines.Strings = (
              'MIIFxTCCA62gAwIBAgIUMjAwMDEwMDAwMDAzMDAwMjI4MTUwD'
              'QYJKoZIhvcNAQELBQAwggFmMSAwHgYDVQQDDBdBLkMuIDIgZGU'
              'gcHJ1ZWJhcyg0MDk2KTEvMC0GA1UECgwmU2VydmljaW8gZGUgQ'
              'WRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExODA2BgNVBAsML0'
              'FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEgSW5mb3J'
              'tYWNpw7NuMSkwJwYJKoZIhvcNAQkBFhphc2lzbmV0QHBydWViYXM'
              'uc2F0LmdvYi5teDEmMCQGA1UECQwdQXYuIEhpZGFsZ28gNzcsIENv'
              'bC4gR3VlcnJlcm8xDjAMBgNVBBEMBTA2MzAwMQswCQYDVQQGEwJ'
              'NWDEZMBcGA1UECAwQRGlzdHJpdG8gRmVkZXJhbDESMBAGA1UEB'
              'wwJQ295b2Fjw6FuMRUwEwYDVQQtEwxTQVQ5NzA3MDFOTjMxITA'
              'fBgkqhkiG9w0BCQIMElJlc3BvbnNhYmxlOiBBQ0RNQTAeFw0xNjEwMj'
              'UyMTUyMTFaFw0yMDEwMjUyMTUyMTFaMIGxMRowGAYDVQQDEx'
              'FDSU5ERU1FWCBTQSBERSBDVjEaMBgGA1UEKRMRQ0lOREVNRVgg'
              'U0EgREUgQ1YxGjAYBgNVBAoTEUNJTkRFTUVYIFNBIERFIENWMSU'
              'wIwYDVQQtExxMQU43MDA4MTczUjUgLyBGVUFCNzcwMTE3QlhBMR'
              '4wHAYDVQQFExUgLyBGVUFCNzcwMTE3TURGUk5OMDkxFDASBgNV'
              'BAsUC1BydWViYV9DRkRJMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A'
              'MIIBCgKCAQEAgvvCiCFDFVaYX7xdVRhp/38ULWto/LKDSZy1yrXKpa'
              'qFXqERJWF78YHKf3N5GBoXgzwFPuDX'
              '+5kvY5wtYNxx/Owu2shNZqFFh6EKsysQMeP5rz6kE1gFYenaPEUP9'
              'zj'
              '+h0bL3xR5aqoTsqGF24mKBLoiaK44pXBzGzgsxZishVJVM6XbzNJVon'
              'EUNbI25DhgWAd86f2aU3BmOH2K1RZx41dtTT56UsszJls4tPFODr/c'
              'aWuZEuUvLp1M3nj7Dyu88mhD2f'
              '+1fA/g7kzcU/1tcpFXF/rIy93APvkU72jwvkrnprzs'
              '+SnG81+/F16ahuGsb2EZ88dKHwqxEkwzhMyTbQIDAQABox0wGzA'
              'MBgNVHRMBAf8EAjAAMAsGA1UdDwQEAwIGwDANBgkqhkiG9w0BA'
              'QsFAAOCAgEAJ/xkL8I+fpilZP+9aO8n93+20XxVomLJjeSL'
              '+Ng2ErL2GgatpLuN5JknFBkZAhxVIgMaTS23zzk1RLtRaYvH83lBH5E'
              '+M'
              '+kEjFGp14Fne1iV2Pm3vL4jeLmzHgY1Kf5HmeVrrp4PU7WQg16VpyH'
              'aJ/eonPNiEBUjcyQ1iFfkzJmnSJvDGtfQK2TiEolDJApYv0OWdm4is9Bs'
              'fi9j6lI9/T6MNZ'
              '+/LM2L/t72Vau4r7m94JDEzaO3A0wHAtQ97fjBfBiO5M8AEISAV7eZi'
              'dIl3iaJJHkQbBYiiW2gikreUZKPUX0HmlnIqqQcBJhWKRu6Nqk6aZBTET'
              'LLpGrvF9OArV1JSsbdw/ZH+P88RAt5em5/gjwwtFlNHyiKG5w'
              '+UFpaZOK3gZP0su0sa6dlPeQ9EL4JlFkGqQCgSQ'
              '+NOsXqaOavgoP5VLykLwuGnwIUnuhBTVeDbzpgrg9LuF5dYp/zs'
              '+Y9ScJqe5VMAagLSYTShNtN8luV7LvxF9pgWwZdcM7lUwqJmUddCi'
              'Zqdngg3vzTactMToG16gZA4CWnMgbU4E'
              '+r541+FNMpgAZNvs2CiW/eApfaaQojsZEAHDsDv4L5n3M1CC7fYjE/'
              'd61aSng1LaO6T1mh+dEfPvLzp7zyzz'
              '+UgWMhi5Cs4pcXx1eic5r7uxPoBwcCTt3YI1jKVVnV7/w=')
            TabOrder = 0
          end
          object txtAcceptRejectKey: TMemo
            Left = 765
            Top = 183
            Width = 337
            Height = 81
            Lines.Strings = (
              'MIIFDjBABgkqhkiG9w0BBQ0wMzAbBgkqhkiG9w0BBQwwDgQIAgEAA'
              'oIBAQACAggAMBQGCCqGSIb3DQMHBAgwggS9AgEAMASCBMh4EHl'
              '7aNSCaMDA1VlRoXCZ5UUmqErAbucRBAKNQXH8t1GNfLDIQejtcocS'
              '39VvWnpNXjZJeCg65Y2wI36UGn78gvnU0NOmyUkXksPVrkz7hqNtA'
              'VojPUtN65l+MVAsIRVD6OLJeKZ2bLx5z78zrx6Tp1zCGT/NpxL'
              '+CJSy5iY6TKqbJcK/9198noOvT2p8rKVqUUF3wLRvD6R/b3BC5wCo'
              'n/exp3BUTZeiWJqGRRgaW4rn49ZbJPVIcDmUO8mojPesFHjJDSnA0'
              'nBnWaUvTYXi0srT'
              '+dLZOewsBR8d5GdSWh9ZkM29wJbjYHCMsXkObZjaap3YM8fU29zR'
              'yZ8KAqaCnBHCfYjbib56m+Lmnk+ScqMkQQ+S/'
              '+2pzn2LzauvBI4p/OjQgBDeblo22X7sX9OA9YaqB3q6CCjQ5tkDNrz3'
              'HOgTm'
              '+amh/kI8TEn9rcKf4Ru7mC1T7VMaFgBqpIS8YJNbcgegF0IF1FpCS0'
              '5wjdU5CktYAnPnvC+Pj+MFDeH'
              '+184kIHBWqPNG6dAzALxRgtKTlGdJ1l5Do+4EWI'
              '+0mvKojREnKoDczFnDeCFnM51u3I9Vce3rkf0djRQKFomPVUnPDqxl'
              'R5lDAssYAYNcECAkvGxKcBDbjWi/6NHlwjS1r28+0Jhvfxjx9O6hi4AW'
              '82Q2/kBE5P/eOwln/jKSbLgi7Iyim1FFHxkQH1FY5kcKhAzFcIq85rGFlz'
              'HRfPF9OIQSmONI9kcWQCxkk8aG1u1zwbjZRYLTxlwmZvynOgaWR'
              'pTN8Y4ReBDIG1klhva7nqqoM416oXBG71IKaCtjAwRlE6pgaqnIz/WQ'
              'Ab2FR541pqynX6dB6DB1nIWnatsWZJZlu'
              '+Bnhf9DBlUsO9ZSAf9Fa9nJAzwFCzaKIsvGJIeKSZ/h'
              '+vInkjaO/rxswErVROTfZy1lO2CJ/xnAgzFGrpDxNJPliv3McO9TGwYy'
              '/zHhE6Pdo8Xu6NsMisNU6TB8Bc26uLNv/7kWhNmNnBA1qt5akln6hO'
              'HrPBXGBiTNUL0IoFVPNdCbS0834zAYXfgtZLDzVpeLqmeMpqXbIYK0/'
              'NXe9etxuOcN40O'
              '+B/fTHHmO7dMgBZ4vAApVQUPr7ilumVHsWSMRP/0p5R9q4qr1bDm'
              '9S5YCPevdyYWTSceGSrXHmjYzJLBtpc/s77mynNqZEYjhnKk2XRNp6k'
              'p/FYRu'
              '+QdsX9vaDJbLKR2EnSC4fU6UOTO03IZU15j3wOsg30QrXoKntSJ/b'
              'eF99cvFHuPrQPWxCtws0lLwkkHNVOm6XNO948Moy1w1pL4i68Cwm'
              'ceYZaYrYhmHGdLuescFQrZQaULDWhpK2Stys8Vs/XwwxNi9MHAFSX'
              'pdy/b+Aro5n87w'
              '+0MHRcllF8ZKbtQ/ym4oG7aREuo7o71JXJQPjZKTOtVM1EQx/FLM/5'
              'brnDSoyvLtoYtv9/tTnIC'
              '+8gR6eErkzaGmn8pftPhGNuz6yzx8JeLFoMD7VWbGTefj46KS'
              '+yMweFJnpReHEqwnukXpEYq19EWVyQa/Sb7navtKt80y/vRs0aNZp'
              '3iL23AOs0u1kQ1CFNY2y12Gor1koaH2FUd5jAQnaSKmgarLy0H/QVv'
              'R2g8B3+Fh49QhKYrd8N6LvvI80cwbEoqYWn5DWA=')
            TabOrder = 1
          end
          object txtAcceptRejectPfx: TMemo
            Left = 765
            Top = 309
            Width = 337
            Height = 81
            Lines.Strings = (
              'MIIL9QIBAzCCC68GCSqGSIb3DQEHAaCCC6AEggucMIILmDCCBl8G'
              'CSqGSIb3DQEHBqCCBlAwggZMAgEAMIIGRQYJKoZIhvcNAQcBMBw'
              'GCiqGSIb3DQEMAQMwDgQIAJiax9IhjeACAgfQgIIGGOo46VyRkBXp'
              '/SaC8u0FWBIQXI/UVYfXF4WavWWn77ncZkpaaBDRqmAttVowCBKD'
              'Tb4iGvLvD65IqKJaPSO8lNesBis5gSDZ+tEChdHYS+jnPoGzkuC0T'
              '+U1nhXwoPAJK'
              '+2I/yGBwnCdjJyiQ6KIsp/BRAh7cRcKwT3fxhBi3Hhukub7kIavzAgY9'
              'NZWdWVJ5tcG'
              '+fAKRUJTzd1a5NXvgtTf/TDFpRACYVXeDMABrKgWgK/A83zHMlC7//'
              'Jq7LQZrApmi6h4r6F8SNPTHskdBSFeuIF/ceI2y1e88qZ0U8MvpWvD'
              '2GhKSAJD1jXY1HYfVMq61eYvZHxl1m8QJBb9Mw'
              '+N8kbyGaS7ULE5neExo0YXiE9GVfRN7Xk3UYrbSWOeHJgHtt'
              '+BrWVnBqF9C8vnwKxxNpcuGNO5Z//BVEuIwAJjhPc2uFadCqmNTxS'
              '5PcC1DnQzdn2ubVLWFGN/dvOYdPLu7w22P6aFzflCGyKRqFZ5kX'
              '+hpeNuvFVHHUMjbVUteys56AFSTGDbHZseSyQiT40W0YSb7hV'
              '+gFZpPtQWFuNQKYwh4IwkhWsEhHp5vLI9wf983R9qEm8RGxRaua'
              'CBz4Xs5ZlWi3rk5hkXryxqiv7c/vFItJFnyfkY7JSJ/LwzoEMg1liVN/4dpI'
              'RRXzNm'
              '+pTRqvIs8we3mwURITYNw/BOYBu1BOC3MNbK5U8v2+xS/2g72vb'
              '5QYR4bQ4eqbzhdoG2bog3z3QMTcb1t46r6vzLjzqBV3/BQOW6mnLw'
              'IBWtUDMhkJKllF2wnT82bUMfvQq2wQD0siloeuqMrKRoro1uyVrRafm'
              'L9/wxPUoiJNn5PhdpEyLykhVRKP0qaox3Lind5czu5zqy'
              '+MjvtIyVsReDEbd27xqz5SsyK6S/'
              '+Ij3DniGFXcfuoXbh361Fe1fIPV8l0wXQ8sm4ZgwMCNOEWI6mQHj4'
              'QDgd2rzuiIjApauW0MJ6SaaLktsutxO2Afzk/n'
              '+PGIJ7ip4bp/m9FoaEPURD5Rx8vCQa6BQlrsBizYjCgLxYcTRwDJUm'
              'AtADpBsO8yU4tpCuZToyc4J/QbGpgV2rlYkXStM/OOIAXcZRul0Uh0C'
              'jvsbVxNu/DIB7NBaxnrN5xcfhuLkaLY18zyNCNtNGtYEcL7vONpqOCN'
              'my7bEICpM7VggnkTmVEwQo+k'
              '+nrEFCUx03XZPysP7keUonjrnAczEYxbwfvvpq'
              '+WR4hUF5oGUouvmEFd/xd18uOBjfmRA6LDPQuE3Eq1wayzaEHUd'
              'Hbw8S+X4MtQ9sOZhEeTK8+TT5ifz9GzGLyWMHSr6O08dVSqG'
              '+HMKUF/oWGiyNMx7anZvzhkAywifWkPu9hhtZIypDA6Rei4u2SPBXS'
              'MlhsB2I98tZhV6QWlKJduZFPDs5f2rYjXsFZkYju19MPeJZTEfXFL9Xav'
              '0Ru1VALc7PiGgdI9vfPE6pk4/MDizuI3aJuiCdSJ489siWp1S3qKy8Sod'
              'rTbBK0yRR5IXgh2nH6BKr5fmt5iLrljZE9R7PcZJ488LMOCRPyza30AW'
              '6sDIkYdHOXRDztn34Nm52nNNM3Bof71LctRg5hIeA8vSItJ06B6oM8'
              'dYm2EimNeHD9vM4nSMXBTDxqHm1behRX4OoDm8wkuOlVBq6UuRD'
              'N6aDEa6MejFog0QKpCC7XpmluQqEp+v+X9DpUDxxek'
              '+2vypkabHejQ7pzyDfSHtDdghnsPgMRv0b2AmfN3NZVv/KcJqtrcmv'
              '5E1HfXIZegDb4yEww2fUmfAw3oU1ZDdFmLo/9ve2wNGJfvswh4CU'
              'GTAdNbAxW4zHrZZ50IIzVPkEDS0Ipk1W/ScYC8NWz8JGUIzeSQ5RX'
              '79RuoSueSHqI9lUTTqJcJnxoyWavSIIIBgcIlrvIAsPHjQ5almC51a5RO'
              'ojeP9Wgrqn3BEyePAIXpX/zKQMgs1UsDYXXNm4BdJuNnEbPpL65Z1ji'
              'IlPtciiEbkcn/YCn1rOUt1fS3uMY2YmUKdUJTsjt4MoG3l+ZgY31Frp'
              '+HoJBjr4SIFbbsK9xZtVlDZ952bv5PakqrQRM24qaNyIB1K0/bXNBj48'
              'Tz3JpSmlYjm27wK9rYZPDCCBTEGCSqGSIb3DQEHAaCCBSIEggUeMI'
              'IFGjCCBRYGCyqGSIb3DQEMCgECoIIE7jCCBOowHAYKKoZIhvcNAQ'
              'wBAzAOBAgzNxZtsW'
              '+CqQICB9AEggTIeBa9BWcG9YKUAVQG/POAsoxXsrMegkSwcNyf5s'
              'xz8hfvo3OyHsvZKYFaMIiiz8yy8lb'
              '+gCJrxQxUaWpLpnKdGuEDJXCqV5XnaS3Txue2NWtnG9eE5/CTKzA'
              'eBZFPfMAa43+nPziV/U/pWa0p8zXU9cU/hWwZ6Fbl0a1FAaX61lNYiZ'
              '5qPiS2t38ENI80FHg/Kyt8Ql79c2CrUe1jtnkFumGWbSxA3YQJK1+N1'
              'UWCEI3NsNW5aIZfrHtsvgJ6EX'
              '+6ZLbsmxLRm/yWeYqbAsPTpcE6DKbRMRj1klzKSFQ2NTXFKJ2M/e1'
              'G5I'
              '+QO7VuZBnKn4hIaJmbszux68rjJgqPqyHOVHqi6U3JiFWR9mzf54w'
              '+bzsIGoDzTUSveBFV4jm9atgT15MSxg1/+C+jtWlPMRHprmC'
              '+SEIvpkF4CsHRUBZXjhRR4DDauEVwWM8Y1IQXDZeYMvk3LBZlUh5'
              'Caei8D7OgO4D7huPkZWSSO/0cyAWjCW1lOFe2V3aCl6A'
              '+6jbfdgkD7NlicjFSk9DpWa13sdgFnIFee9XjP'
              '+E9xVOKqvHKc7FjSITYfSsLiXwkcwgnxi9tXYQ9XForyrPO6BW23qwO'
              'bp1RcUohBZkcy1f4ULRpsPSn3M7+BSmrb5idSpJchmR/qIdE9jkHY12'
              'AZS7YPouu3hhStt6TJqPBKodCnZq2d4yXeSR4EV3O1yAshJTD9eCop'
              'zCDcv6O1/UXA7Gag3uucTQHduYjRMrh/pZ6H3vk8xCsdPX'
              '+ZVXKLDZ9W3sbTqw4f7oezjIcVNoGuxJTAR36RtXib73usrpQp/grd/'
              'Ab5Z06YtRu'
              '+p5DLZc7ACf104Q5TqeCLUShifsgSFv/wU3iQIewbHcwp2+/A6CO2'
              'QzEtMSGiueZv3sMJ0XPoLOt0+StHnEl'
              '+c8vBWu3zxf0dvf2Eapu1K87BRjrNRMRyy4dsmKMPd+'
              '+1R26nBQVcSGg2DMuawPnNFd8YtsS7MyzTuYvJ0SOZFGX82oVA1C'
              'n+MlE3hi9sAJnnWF/i1ILu'
              '+o2EtEAI4R8AQzOUGzNAE1KhD4WFolsz84SBJmr'
              '+Zps7VEkz7eHczWYLdnVtaV6W3zdbPJzgFKl3Aic4TBEyBrwROJqkTX'
              'UPiR1eS3cuKX9BZXNto1AIVQDC'
              '+cSAd5/9+nPlorvE5fNAdXaLYt7RN8/EFP3/R/zx9jqXtK5yO9M'
              '+PFz3cmUTYMhzoUM3/c1qZMeVUJ38oKlLPng'
              '+avrYcjz5yBrYB6aQDUH7qxuXhPyTL3noipmluGr4dEAi0XbsU5zCvlJk'
              'S7vMgmBoD+XRW+k9o+5NIz1GUCHWqm653wOxxGDm+se'
              '+bL4rFQQAMthygJRxOH7FbZ/TOT8MqufxYqfdc5u66pGV4p4WvRK'
              'M3EYw/Uyhf0pztF5m7oNWzfj5+fIqLPsrAXt6DCwvnJTLQakn1w3zvJ'
              '7gt'
              '+lWfYfWIxCkUhE6rw5/aYOgWk9MyFWKDLcQa55mCaXIql6RHDyDH'
              'd35ZjV26r4m/kcmCYqmNZsJPyySQg6lkuUNTvA2VaclQWZlhK9D6B'
              '+3kZPeQzsHcPuOzp/ECUVg9Fmq4FBzF6MrhTx9sV1ygY3TUcyYQASl'
              'eUbuxqgxccmhxNi8RSohzqhL/E1PuXb7B9nMRUwEwYJKoZIhvcNAQ'
              'kVMQYEBAEAAAAwPTAhMAkGBSsOAwIaBQAEFMU/TwflQv4jd8U5Ci'
              'BRUpJAzqbqBBSnDNHQBP2HfzGmDHlUAjFiMcK5lQICB9A=')
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
            Lines.Strings = (
              '<?xml version="1.0" encoding="utf-8"?>'
              '<SolicitudAceptacionRechazo '
              'xmlns:xsd="http://www.w3.org/2001/XMLSchema" '
              ' xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" '
              'RfcReceptor="LAN7008173R5" '
              'RfcPacEnviaSolicitud="DAL050601L35" Fecha="2018-08-'
              '22T18:38:05" '
              ' xmlns="http://cancelacfd.sat.gob.mx">'
              ' <Folios>'
              ' <UUID>06a46e4b-b154-4c12-bb77-f9a63ed55ff2</UUID>'
              ' <Respuesta>Aceptacion</Respuesta>'
              ' </Folios>'
              ' <Signature xmlns="http://www.w3.org/2000/09/xmldsig#">'
              ' <SignedInfo>'
              ' <CanonicalizationMethod '
              'Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315" '
              '/>'
              ' <SignatureMethod '
              'Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1" />'
              ' <Reference URI="">'
              ' <Transforms>'
              ' <Transform '
              'Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-'
              'signature" />'
              ' </Transforms>'
              ' <DigestMethod '
              'Algorithm="http://www.w3.org/2000/09/xmldsig#sha1" />'
              ' '
              '<DigestValue>AQ36cbqKJKHy5vaS6GhDTWtwKE4=</DigestValue'
              '>'
              ' </Reference>'
              ' </SignedInfo>'
              ' <SignatureValue>HVlFUPmRLyxeztem827eaasDObRXi'
              '+oqedCNNvDyMsRizqsS99cHt5mJCEE4vWgpDGPGLrph/yd+'
              '+R4aN'
              '+V562DPp9qreFkisFpEvJy5Z8o/KzG7vc5qqaD8z9ohPpRERPHvxFrI'
              'm3ryEBqnSV6zqJG02PuxkWvYonVc'
              '+B7RdsO5iAiDTMs9guUhOvHBK8BVXQHKCbUAPCp/4YepZ4LUkcdlo'
              'CAMPsN0x9GaUty2RMtNJuwaRWy'
              '+5IIBUCeXXZmQhoQfS0QfPpCByt0ago5v'
              '+FocJQiYQrsUV/8mesmNw5JoOCmufQYliQFyZgsstV8+h76dU/rwLr6'
              'R8YlFOkTxKg==</SignatureValue>'
              ' <KeyInfo>'
              ' <X509Data>'
              ' <X509IssuerSerial>'
              ' <X509IssuerName>OID.1.2.840.113549.1.9.2=Responsable: '
              'ACDMA, OID.2.5.4.45=SAT970701NN3, L=Coyoac'#225'n, S=Distrito '
              'Federal, C=MX, PostalCode=06300, STREET="Av. Hidalgo 77, Col. '
              'Guerrero", E=asisnet@pruebas.sat.gob.mx, OU=Administraci'#243'n de '
              'Seguridad de la Informaci'#243'n, O=Servicio de Administraci'#243'n '
              'Tributaria, CN=A.C. 2 de pruebas(4096)</X509IssuerName>'
              ' '
              '<X509SerialNumber>3230303031303030303030333030303232383'
              '135</X509SerialNumber>'
              ' </X509IssuerSerial>'
              ' '
              '<X509Certificate>MIIFxTCCA62gAwIBAgIUMjAwMDEwMDAwMDAz'
              'MDAwMjI4MTUwDQYJKoZIhvcNAQELBQAwggFmMSAwHgYDVQQDD'
              'BdBLkMuIDIgZGUgcHJ1ZWJhcyg0MDk2KTEvMC0GA1UECgwmU2Vy'
              'dmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExO'
              'DA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZG'
              'UgbGEgSW5mb3JtYWNpw7NuMSkwJwYJKoZIhvcNAQkBFhphc2lzbm'
              'V0QHBydWViYXMuc2F0LmdvYi5teDEmMCQGA1UECQwdQXYuIEhpZ'
              'GFsZ28gNzcsIENvbC4gR3VlcnJlcm8xDjAMBgNVBBEMBTA2MzAwMQ'
              'swCQYDVQQGEwJNWDEZMBcGA1UECAwQRGlzdHJpdG8gRmVkZXJ'
              'hbDESMBAGA1UEBwwJQ295b2Fjw6FuMRUwEwYDVQQtEwxTQVQ5'
              'NzA3MDFOTjMxITAfBgkqhkiG9w0BCQIMElJlc3BvbnNhYmxlOiBBQ0R'
              'NQTAeFw0xNjEwMjUyMTUyMTFaFw0yMDEwMjUyMTUyMTFaMIGx'
              'MRowGAYDVQQDExFDSU5ERU1FWCBTQSBERSBDVjEaMBgGA1UEK'
              'RMRQ0lOREVNRVggU0EgREUgQ1YxGjAYBgNVBAoTEUNJTkRFTUVYI'
              'FNBIERFIENWMSUwIwYDVQQtExxMQU43MDA4MTczUjUgLyBGVUF'
              'CNzcwMTE3QlhBMR4wHAYDVQQFExUgLyBGVUFCNzcwMTE3TURGU'
              'k5OMDkxFDASBgNVBAsUC1BydWViYV9DRkRJMIIBIjANBgkqhkiG9w0'
              'BAQEFAAOCAQ8AMIIBCgKCAQEAgvvCiCFDFVaYX7xdVRhp/38ULW'
              'to/LKDSZy1yrXKpaqFXqERJWF78YHKf3N5GBoXgzwFPuDX'
              '+5kvY5wtYNxx/Owu2shNZqFFh6EKsysQMeP5rz6kE1gFYenaPEUP9'
              'zj'
              '+h0bL3xR5aqoTsqGF24mKBLoiaK44pXBzGzgsxZishVJVM6XbzNJVon'
              'EUNbI25DhgWAd86f2aU3BmOH2K1RZx41dtTT56UsszJls4tPFODr/c'
              'aWuZEuUvLp1M3nj7Dyu88mhD2f'
              '+1fA/g7kzcU/1tcpFXF/rIy93APvkU72jwvkrnprzs'
              '+SnG81+/F16ahuGsb2EZ88dKHwqxEkwzhMyTbQIDAQABox0wGzA'
              'MBgNVHRMBAf8EAjAAMAsGA1UdDwQEAwIGwDANBgkqhkiG9w0BA'
              'QsFAAOCAgEAJ/xkL8I+fpilZP+9aO8n93+20XxVomLJjeSL'
              '+Ng2ErL2GgatpLuN5JknFBkZAhxVIgMaTS23zzk1RLtRaYvH83lBH5E'
              '+M'
              '+kEjFGp14Fne1iV2Pm3vL4jeLmzHgY1Kf5HmeVrrp4PU7WQg16VpyH'
              'aJ/eonPNiEBUjcyQ1iFfkzJmnSJvDGtfQK2TiEolDJApYv0OWdm4is9Bs'
              'fi9j6lI9/T6MNZ'
              '+/LM2L/t72Vau4r7m94JDEzaO3A0wHAtQ97fjBfBiO5M8AEISAV7eZi'
              'dIl3iaJJHkQbBYiiW2gikreUZKPUX0HmlnIqqQcBJhWKRu6Nqk6aZBTET'
              'LLpGrvF9OArV1JSsbdw/ZH+P88RAt5em5/gjwwtFlNHyiKG5w'
              '+UFpaZOK3gZP0su0sa6dlPeQ9EL4JlFkGqQCgSQ'
              '+NOsXqaOavgoP5VLykLwuGnwIUnuhBTVeDbzpgrg9LuF5dYp/zs'
              '+Y9ScJqe5VMAagLSYTShNtN8luV7LvxF9pgWwZdcM7lUwqJmUddCi'
              'Zqdngg3vzTactMToG16gZA4CWnMgbU4E'
              '+r541+FNMpgAZNvs2CiW/eApfaaQojsZEAHDsDv4L5n3M1CC7fYjE/'
              'd61aSng1LaO6T1mh+dEfPvLzp7zyzz'
              '+UgWMhi5Cs4pcXx1eic5r7uxPoBwcCTt3YI1jKVVnV7/w=</X509Cer'
              'tificate>'
              ' </X509Data>'
              ' </KeyInfo>'
              ' </Signature>'
              '</SolicitudAceptacionRechazo>')
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
            Text = '703a8b88-0c4d-471f-b1eb-8185b0f2e1d9'
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
    object TabSheet7: TTabSheet
      Caption = 'Validaci'#243'n de LCO'
      ImageIndex = 6
      object Label23: TLabel
        Left = 162
        Top = 163
        Width = 64
        Height = 13
        Caption = 'noCertificado'
      end
      object Label33: TLabel
        Left = 210
        Top = 203
        Width = 16
        Height = 13
        Caption = 'Rfc'
      end
      object Label34: TLabel
        Left = 130
        Top = 243
        Width = 96
        Height = 13
        Caption = 'Validez Obligaciones'
      end
      object Label35: TLabel
        Left = 135
        Top = 283
        Width = 91
        Height = 13
        Caption = 'Estatus Certificado'
      end
      object Label37: TLabel
        Left = 169
        Top = 315
        Width = 57
        Height = 13
        Caption = 'Fecha Inicio'
      end
      object Label36: TLabel
        Left = 172
        Top = 355
        Width = 54
        Height = 13
        Caption = 'Fecha Final'
      end
      object Label38: TLabel
        Left = 195
        Top = 395
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object Button8: TButton
        Left = 56
        Top = 30
        Width = 121
        Height = 33
        Caption = 'Validar LCO'
        TabOrder = 0
        OnClick = Button8Click
      end
      object txtLcoAValidar: TEdit
        Left = 232
        Top = 30
        Width = 145
        Height = 21
        TabOrder = 1
        Text = '20001000000300022816'
      end
      object txtValidaLcoNoCertificado: TEdit
        Left = 232
        Top = 160
        Width = 257
        Height = 21
        TabOrder = 2
      end
      object txtValidaLcoRfc: TEdit
        Left = 232
        Top = 200
        Width = 257
        Height = 21
        TabOrder = 3
      end
      object txtValidacionLcoValidezObligaciones: TEdit
        Left = 232
        Top = 240
        Width = 257
        Height = 21
        TabOrder = 4
      end
      object txtValidacionLcoEstatusCertificado: TEdit
        Left = 232
        Top = 280
        Width = 257
        Height = 21
        TabOrder = 5
      end
      object txtValidacionLcoFechaInicio: TEdit
        Left = 232
        Top = 312
        Width = 257
        Height = 21
        TabOrder = 6
      end
      object txtValidacionLcoFechaFinal: TEdit
        Left = 232
        Top = 352
        Width = 257
        Height = 21
        TabOrder = 7
      end
      object txtValidaLcoStatus: TEdit
        Left = 232
        Top = 392
        Width = 257
        Height = 21
        TabOrder = 8
      end
      object txtValidaLcoMessage: TEdit
        Left = 712
        Top = 152
        Width = 217
        Height = 21
        TabOrder = 9
      end
      object txtValidaLcoMessageDetail: TEdit
        Left = 712
        Top = 192
        Width = 217
        Height = 21
        TabOrder = 10
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'Validaci'#243'n de LRFC'
      ImageIndex = 7
      object Label39: TLabel
        Left = 90
        Top = 197
        Width = 88
        Height = 13
        Caption = 'Contribuyente Rfc'
      end
      object Label40: TLabel
        Left = 157
        Top = 224
        Width = 21
        Height = 13
        Caption = 'Snfc'
      end
      object Label41: TLabel
        Left = 100
        Top = 251
        Width = 78
        Height = 13
        Caption = 'Subcontrataci'#243'n'
      end
      object Label42: TLabel
        Left = 147
        Top = 278
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object Label43: TLabel
        Left = 136
        Top = 305
        Width = 42
        Height = 13
        Caption = 'Message'
      end
      object Label44: TLabel
        Left = 109
        Top = 332
        Width = 69
        Height = 13
        Caption = 'MessageDetail'
      end
      object txtValidateLrfc: TEdit
        Left = 184
        Top = 98
        Width = 233
        Height = 21
        TabOrder = 0
        Text = 'LAN8507268IA'
      end
      object txtValidateContribuyenteRfc: TEdit
        Left = 184
        Top = 189
        Width = 233
        Height = 21
        TabOrder = 1
      end
      object txtValidateSnfc: TEdit
        Left = 184
        Top = 216
        Width = 233
        Height = 21
        TabOrder = 2
      end
      object txtValidateSubcontratacion: TEdit
        Left = 184
        Top = 243
        Width = 233
        Height = 21
        TabOrder = 3
      end
      object txtValidateStatus: TEdit
        Left = 184
        Top = 270
        Width = 233
        Height = 21
        TabOrder = 4
      end
      object txtValidateMessage: TEdit
        Left = 184
        Top = 297
        Width = 233
        Height = 21
        TabOrder = 5
      end
      object txtValidateMessageDetail: TEdit
        Left = 184
        Top = 324
        Width = 233
        Height = 21
        TabOrder = 6
      end
      object Button9: TButton
        Left = 32
        Top = 78
        Width = 129
        Height = 41
        Caption = 'Validar Lrfc'
        TabOrder = 7
        OnClick = Button9Click
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'Generaci'#243'n de PDF'
      ImageIndex = 8
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
