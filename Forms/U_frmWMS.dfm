object frmWMS: TfrmWMS
  AlignWithMargins = True
  Left = 0
  Top = 0
  ClientHeight = 593
  ClientWidth = 343
  Caption = 'CodeBar - Etiqueta din'#226'mica'
  OnShow = UnimFormShow
  Color = clTeal
  AlignmentControl = uniAlignmentClient
  AutoHeight = False
  Scrollable = True
  TitleColor = clTeal
  TitleFontColor = clWhite
  TitleButtons = <>
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 50
  ScrollHeight = 947
  PlatformData = {}
  object uniPanelPrincipal: TUnimContainerPanel
    Left = 0
    Top = -50
    Width = 343
    Height = 900
    Hint = ''
    Align = alClient
    object uniPanelCima: TUnimContainerPanel
      Left = 0
      Top = 0
      Width = 343
      Height = 73
      Hint = ''
      Align = alTop
      Color = clTeal
    end
    object uniPanelEsquerda: TUnimContainerPanel
      Left = 0
      Top = 73
      Width = 65
      Height = 827
      Hint = ''
      Align = alLeft
      Color = clTeal
    end
    object uniPanelDireita: TUnimContainerPanel
      Left = 279
      Top = 73
      Width = 64
      Height = 827
      Hint = ''
      Align = alRight
      Color = clTeal
    end
    object uniPanelCentral: TUnimContainerPanel
      AlignWithMargins = True
      Left = 68
      Top = 76
      Width = 208
      Height = 821
      Hint = ''
      Align = alClient
      object edtCodBarras: TUnimEdit
        Left = 0
        Top = 0
        Width = 208
        Height = 47
        Hint = ''
        Align = alTop
        Text = ''
        ParentFont = False
        TabOrder = 0
        OnExit = edtCodBarrasExit
      end
      object lblSeparador1: TUnimLabel
        Left = 0
        Top = 47
        Width = 208
        Height = 26
        Hint = ''
        AutoSize = False
        Caption = ''
        Align = alTop
        ParentFont = False
        Font.Color = clBtnFace
        Font.Style = [fsBold]
      end
      object lblProduto: TUnimLabel
        Left = 0
        Top = 73
        Width = 208
        Height = 23
        Hint = ''
        AutoSize = False
        Caption = 'Produto:'
        Align = alTop
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
      end
      object edtProduto: TUnimEdit
        Tag = 1
        Left = 0
        Top = 96
        Width = 208
        Height = 47
        Hint = ''
        Enabled = False
        Align = alTop
        Text = ''
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object UnimLabel1: TUnimLabel
        Left = 0
        Top = 143
        Width = 208
        Height = 18
        Hint = ''
        AutoSize = False
        Caption = ''
        Align = alTop
        ParentFont = False
        Font.Color = clBtnFace
        Font.Style = [fsBold]
      end
      object lblQtd: TUnimLabel
        Left = 0
        Top = 161
        Width = 208
        Height = 23
        Hint = ''
        AutoSize = False
        Caption = 'Quantidade:'
        Align = alTop
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
      end
      object edtQtd: TUnimEdit
        Left = 0
        Top = 184
        Width = 208
        Height = 47
        Hint = ''
        Align = alTop
        Text = ''
        ParentFont = False
        TabOrder = 2
      end
      object lblSeparador2: TUnimLabel
        Left = 0
        Top = 231
        Width = 208
        Height = 20
        Hint = ''
        AutoSize = False
        Caption = ''
        Align = alTop
        ParentFont = False
        Font.Color = clBtnFace
        Font.Style = [fsBold]
      end
      object lblPesoBruto: TUnimLabel
        Left = 0
        Top = 251
        Width = 208
        Height = 23
        Hint = ''
        AutoSize = False
        Caption = 'Peso Bruto:'
        Align = alTop
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
      end
      object edtPesoBruto: TUnimEdit
        Left = 0
        Top = 274
        Width = 208
        Height = 47
        Hint = ''
        Align = alTop
        Text = ''
        ParentFont = False
        TabOrder = 3
      end
      object lblSeparador3: TUnimLabel
        Left = 0
        Top = 321
        Width = 208
        Height = 20
        Hint = ''
        AutoSize = False
        Caption = ''
        Align = alTop
        ParentFont = False
        Font.Color = clBtnFace
        Font.Style = [fsBold]
      end
      object lblFabricacao: TUnimLabel
        Left = 0
        Top = 341
        Width = 208
        Height = 23
        Hint = ''
        AutoSize = False
        Caption = 'Fabrica'#231#227'o:'
        Align = alTop
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
      end
      object dtFabricacao: TUnimDatePicker
        Left = 0
        Top = 364
        Width = 208
        Height = 47
        Hint = ''
        Align = alTop
        DateFormat = 'dd/MM/yyyy'
        Date = 45561.000000000000000000
      end
      object lblSeparador4: TUnimLabel
        Left = 0
        Top = 411
        Width = 208
        Height = 20
        Hint = ''
        AutoSize = False
        Caption = ''
        Align = alTop
        ParentFont = False
        Font.Color = clBtnFace
        Font.Style = [fsBold]
      end
      object lblValidade: TUnimLabel
        Left = 0
        Top = 431
        Width = 208
        Height = 23
        Hint = ''
        AutoSize = False
        Caption = 'Validade:'
        Align = alTop
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
      end
      object dtValidade: TUnimDatePicker
        Left = 0
        Top = 454
        Width = 208
        Height = 47
        Hint = ''
        Align = alTop
        DateFormat = 'dd/MM/yyyy'
        Date = 45561.000000000000000000
      end
      object lblSeparador5: TUnimLabel
        Left = 0
        Top = 501
        Width = 208
        Height = 20
        Hint = ''
        AutoSize = False
        Caption = ''
        Align = alTop
        ParentFont = False
        Font.Color = clBtnFace
        Font.Style = [fsBold]
      end
      object lblLoteFornecedor: TUnimLabel
        Left = 0
        Top = 521
        Width = 208
        Height = 23
        Hint = ''
        AutoSize = False
        Caption = 'Lote Fornecedor:'
        Align = alTop
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
      end
      object edtLoteFornecedor: TUnimEdit
        Left = 0
        Top = 544
        Width = 208
        Height = 47
        Hint = ''
        Align = alTop
        Text = ''
        ParentFont = False
        TabOrder = 4
      end
      object lblSeparador6: TUnimLabel
        Left = 0
        Top = 591
        Width = 208
        Height = 19
        Hint = ''
        AutoSize = False
        Caption = ''
        Align = alTop
        ParentFont = False
        Font.Color = clBtnFace
        Font.Style = [fsBold]
      end
      object btnValidar: TUnimBitBtn
        Left = 0
        Top = 610
        Width = 208
        Height = 47
        Hint = ''
        Align = alTop
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00EAF6EA00A6D6A30077C1740061B75E0061B75E0077C1
          7400A6D6A300EAF6EA00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00C4E3C2005FB65B0050AF4C0050AF4C0050AF4C0050AF4C0050AF
          4C0050AF4C005FB65B00C4E3C200FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00C4E3C30050AF4B0050AF4C0050AF4C004FAE4A004FAE4A0050AF4C0050AF
          4C0050AF4C0050AF4C0050AF4B00C4E3C300FF00FF00FF00FF00FF00FF00ECF6
          EB005CB5590050AF4C0050AF4C004EAD490052B2510052B251004EAD490050AF
          4C0050AF4C0050AF4C0050AF4C005CB55900ECF6EB00FF00FF00FF00FF00A6D6
          A30050AF4C0050AF4C004EAD480051B14E0081ECAE0081ECAE0051B14E004EAD
          480050AF4C0050AF4C0050AF4C0050AF4C00A6D6A300FF00FF00FF00FF0075C0
          720050AF4C004FAE4A0053B3520080EAAD008EFBC9008EFBC90080EAAD0051B0
          4E004EAD480050AF4C0050AF4C0050AF4C0075C07200FF00FF00FF00FF0061B7
          5E0050AF4C004DAB460073DB930090FDCD005BBD61005BBD610090FCCB0081EA
          AD0051B04E004EAD480050AF4C0050AF4C0061B75E00FF00FF00FF00FF0061B7
          5E0050AF4C004FAE4A0058B95C005BBD62004DAB46004CAB45005CBF640090FC
          CB0081EAAD0051B04E004EAD480050AF4C0061B75E00FF00FF00FF00FF0075C0
          720050AF4C0050AF4C004FAD49004EAD480050AF4C0050AF4C004CAB44005CBF
          640090FCCB0082ECAF0054B454004FAE4A0075C07200FF00FF00FF00FF00A6D6
          A30050AF4C0050AF4C0050AF4C0050AF4C0050AF4C0050AF4C0050AF4C004CAB
          44005DC0670088F2BC005EC066004EAC4800A6D6A300FF00FF00FF00FF00ECF6
          EB005CB5590050AF4C0050AF4C0050AF4C0050AF4C0050AF4C0050AF4C0050AF
          4C004EAD490052B14F004FAE4B005CB55A00ECF6EB00FF00FF00FF00FF00FF00
          FF00C4E3C30050AF4B0050AF4C0050AF4C0050AF4C0050AF4C0050AF4C0050AF
          4C0050AF4C004FAE4A0050AF4B00C4E3C300FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00C4E3C2005FB65B0050AF4C0050AF4C0050AF4C0050AF4C0050AF
          4C0050AF4C005FB65B00C4E3C200FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00EAF6EA00A6D6A30077C1740061B75E0061B75E0077C1
          7400A6D6A300EAF6EA00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        Caption = 'Validar'
        OnClick = btnValidarClick
      end
      object lblSeparador7: TUnimLabel
        Left = 0
        Top = 657
        Width = 208
        Height = 19
        Hint = ''
        AutoSize = False
        Caption = ''
        Align = alTop
        ParentFont = False
        Font.Color = clBtnFace
        Font.Style = [fsBold]
      end
      object btnNovaBusca: TUnimBitBtn
        Left = 0
        Top = 676
        Width = 208
        Height = 47
        Hint = ''
        Align = alTop
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000C40E0000C40E00000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFAEA507FFFFFFFFFFFFFFFFFFFFFFFFA6276FAEFFFFFFFFFFFF
          FFFFFFFFFFA627BFBFB7FFFFFFFFFFFFFFFFFFF6A627BFBFB7FFFFFFFFFFFFFF
          FFFFFFAE27BFBFB7FFFFFFFFF607F7F7ED08F6A56FBFB7FFFFFFFF089BA3F507
          F5F7A4ECAEB7FFFFFFFFF69BEC09FFFFFF09EDEDF6FFFFFFFFFFF7DB0909FFFF
          FF0909EDF6FFFFFFFFFF9BEB09090909090909EC07FFFFFFFFFF9BEB09090909
          090909EC07FFFFFFFFFF9BE3090909090909090907FFFFFFFFFFF7EC09090909
          090909F508FFFFFFFFFF07A40909FFFFFFFF0907FFFFFFFFFFFFFF07E409F6FF
          F60907F6FFFFFFFFFFFFFFFF08EDED070707F6FFFFFFFFFFFFFF}
        Caption = 'Nova Consulta'
        OnClick = btnNovaBuscaClick
      end
    end
  end
  object swtAlerta: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'OK'
    CancelButtonText = 'Cancel'
    Padding = 20
    Left = 359
    Top = 553
  end
end
