object frmConfigBD: TfrmConfigBD
  Left = 0
  Top = 0
  ClientHeight = 234
  ClientWidth = 426
  Caption = 'Configura'#231#227'o da conex'#227'o com o Banco de Dados'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  Visible = True
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  ClientEvents.Enabled = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbServer: TUniLabel
    Left = 10
    Top = 9
    Width = 97
    Height = 13
    Hint = ''
    Caption = 'Servidor SQL Server'
    TabOrder = 0
  end
  object edtServer: TUniEdit
    Left = 112
    Top = 5
    Width = 184
    Height = 21
    Hint = ''
    ParentShowHint = False
    Text = ''
    TabOrder = 1
    Color = clWhite
    OnExit = edtExit
    OnEnter = EditResetColor
  end
  object lbDataBase: TUniLabel
    Left = 8
    Top = 35
    Width = 121
    Height = 13
    Hint = ''
    Caption = 'Nome do Banco de dados'
    TabOrder = 2
  end
  object edtDataBase: TUniEdit
    Left = 141
    Top = 31
    Width = 155
    Height = 21
    Hint = ''
    ParentShowHint = False
    Text = ''
    TabOrder = 3
    OnExit = edtExit
    OnEnter = EditResetColor
  end
  object grpLogin: TUniGroupBox
    Left = 8
    Top = 57
    Width = 289
    Height = 114
    Hint = ''
    Caption = ' Login no SQL Server '
    TabOrder = 4
    ParentFont = False
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    object lbUser: TUniLabel
      Left = 24
      Top = 61
      Width = 36
      Height = 13
      Hint = ''
      Caption = 'Usu'#225'rio'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 6
    end
    object lbPassword: TUniLabel
      Left = 29
      Top = 84
      Width = 31
      Height = 13
      Hint = ''
      Caption = 'Senha'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 7
    end
    object rbOsAuthentication: TUniRadioButton
      Left = 8
      Top = 18
      Width = 270
      Height = 17
      Hint = ''
      Caption = 'Fazer login com o usu'#225'rio do Windows'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 0
      OnClick = rbOsAuthenticationClick
    end
    object rbDBAuthentication: TUniRadioButton
      Left = 8
      Top = 37
      Width = 270
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Fazer login com usu'#225'rio do Banco de dados'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 1
      OnClick = rbDBAuthenticationClick
    end
    object edtUser: TUniEdit
      Left = 79
      Top = 61
      Width = 185
      Height = 21
      Hint = ''
      Text = ''
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 2
      OnExit = edtExit
      OnEnter = EditResetColor
    end
    object edtPassword: TUniEdit
      Left = 79
      Top = 84
      Width = 158
      Height = 21
      Hint = ''
      PasswordChar = '*'
      Text = ''
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 3
      OnExit = edtExit
      OnEnter = EditResetColor
    end
    object btnPassword: TUniBitBtn
      Left = 239
      Top = 83
      Width = 25
      Height = 23
      Hint = ''
      Glyph.Data = {
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F0030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF9292920F0F
        0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F757575FF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF7B7B7B00000000000000000000
        00000000000000000000000000000000000000005B5B5BFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFF7B7B7B0000000000000000000000003D3D3D555555
        0000000000000000000000005B5B5BFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFF7B7B7B0000000000000000000000004F4F4F6F6F6F0000000000000000
        000000005B5B5BFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF7B7B7B0000
        000000000000000000004F4F4F6F6F6F0000000000000000000000005B5B5BFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF7B7B7B00000000000000000000
        00007575759494940000000000000000000000005B5B5BFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFF7B7B7B000000000000000000000000EEEEEEFFFFFF
        0D0D0D0000000000000000005B5B5BFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFF7B7B7B0000000000000000000000005050505F5F5F0000000000000000
        000000005B5B5BFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF7B7B7B0000
        000000000000000000000000000000000000000000000000000000005B5B5BFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFB0B0B04B4B4B1B1B1B2525254B
        4B4B4B4B4B4B4B4B4B4B4B2F2F2F1111114B4B4B9A9A9AFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B7F7F7FFFFFFFFFFFFFFFFFFF
        FFFFFF9F9F9F3B3B3BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF5B5B5B7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F3B3B
        3BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF616161787878FFFFFFFFFFFFFFFFFFFFFFFF999999414141FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF949494303030FC
        FCFCFFFFFFFFFFFFFFFFFF4C4C4C747474FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F52828284E4E4EC6C6C6CECECE
        646464161616E6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE9E9E95E5E5E1010100909094D4D4DDBDBDBFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000}
      Caption = ''
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 4
      OnClick = btnPasswordClick
    end
  end
  object pnlBotoes: TUniPanel
    Left = 304
    Top = 4
    Width = 118
    Height = 65
    Hint = ''
    TabOrder = 5
    Caption = ''
    object btnGravar: TUniBitBtn
      Left = 4
      Top = 4
      Width = 111
      Height = 25
      Hint = ''
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000D60D0000D60D00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF6EAA6D6A377C17461
        B75E61B75E77C174A6D6A3EAF6EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC4E3C25FB65B50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C5FB65BC4E3
        C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4E3C350AF4B50AF4C50AF4C4FAE4A4F
        AE4A50AF4C50AF4C50AF4C50AF4C50AF4BC4E3C3FFFFFFFFFFFFFFFFFFECF6EB
        5CB55950AF4C50AF4C4EAD4952B25152B2514EAD4950AF4C50AF4C50AF4C50AF
        4C5CB559ECF6EBFFFFFFFFFFFFA6D6A350AF4C50AF4C4EAD4851B14E81ECAE81
        ECAE51B14E4EAD4850AF4C50AF4C50AF4C50AF4CA6D6A3FFFFFFFFFFFF75C072
        50AF4C4FAE4A53B35280EAAD8EFBC98EFBC980EAAD51B04E4EAD4850AF4C50AF
        4C50AF4C75C072FFFFFFFFFFFF61B75E50AF4C4DAB4673DB9390FDCD5BBD615B
        BD6190FCCB81EAAD51B04E4EAD4850AF4C50AF4C61B75EFFFFFFFFFFFF61B75E
        50AF4C4FAE4A58B95C5BBD624DAB464CAB455CBF6490FCCB81EAAD51B04E4EAD
        4850AF4C61B75EFFFFFFFFFFFF75C07250AF4C50AF4C4FAD494EAD4850AF4C50
        AF4C4CAB445CBF6490FCCB82ECAF54B4544FAE4A75C072FFFFFFFFFFFFA6D6A3
        50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C4CAB445DC06788F2BC5EC0
        664EAC48A6D6A3FFFFFFFFFFFFECF6EB5CB55950AF4C50AF4C50AF4C50AF4C50
        AF4C50AF4C50AF4C4EAD4952B14F4FAE4B5CB55AECF6EBFFFFFFFFFFFFFFFFFF
        C4E3C350AF4B50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C4FAE4A50AF
        4BC4E3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4E3C25FB65B50AF4C50AF4C50
        AF4C50AF4C50AF4C50AF4C5FB65BC4E3C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFEAF6EAA6D6A377C17461B75E61B75E77C174A6D6A3EAF6EAFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = '&Salvar'
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object btnCancelar: TUniBitBtn
      Left = 3
      Top = 35
      Width = 111
      Height = 25
      Hint = ''
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
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5656
        FFFFFFFF5656FFFFFFFFFFFFFF560E0E56FFFF560E0E56FFFFFFFFFF560E0E0E
        0E56560E0E0E0E4EFFFFFFFF4E0E0E0E0E0E0E0E0E0F0E56FFFFFFFFFF560E4F
        0E4F4F0E4F0E56FFFFFFFFFFFFFF564E570E0E570E56FFFFFFFFFFFFFFFF564E
        570E0E574E56FFFFFFFFFFFFFF5656570E57570E575656FFFFFFFFFF56565F0E
        575656570E5F564EFFFFFFFF4E569F5F565656565F9F5656FFFFFFFFFF565656
        56FFFF56565656FFFFFFFFFFFFFF5656FFFFFFFF5656FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = '&Cancelar'
      Cancel = True
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object pnlTestarConexao: TUniPanel
    Left = 304
    Top = 80
    Width = 118
    Height = 47
    Hint = ''
    TabOrder = 6
    Caption = ''
    object btnTestarConexao: TUniBitBtn
      Left = 4
      Top = 4
      Width = 111
      Height = 38
      Hint = ''
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF8F0E9F7DAC3F8CFAEFD
        CDA6FECEA7FED3B2FEE2CAFFF7F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEB87FFC8929FD7200F47004F36F04F47004FD7200FE7200FE7200FE7200FC88
        2AFEB981FFFFFFFFFFFFFFFFFFFD9745FC7C16FDA761FEC596FDD7B7F5DCC8F3
        E1D1F5E2D2FDE3CEFED7B8FEC494FDA65FFC7E15FD9B4AFFFFFFFFFFFFFECBA3
        FEFBF8FFE8D7FEC99DFDB376FCA55EF49C53F29A52F3A05CFCB377FEC99EFEE9
        D8FFFAF7FECBA3FFFFFFFFFFFFFEDCC2FC8B2DFE7200FE7200FC760BFC8221FB
        882BF2842CF08023F2750DFD7200FE7200FC8C2FFEDEC6FFFFFFFFFFFFF98E37
        FDA963FED5B3FEF1E8FFFEFEFFFFFFFFFFFFFDFDFDF5F5F5F3F3F3F5E8DDFDD3
        B0FDA761FC933BFFFFFFFFFFFFFBEADDF8E4D4FDBA84FD9B4CFC8625FC7A0EFC
        7403FC7403FB7A0EF38228F2974DF4B583FDEADAFFEDDFFFFFFFFFFFFFFBB881
        F47104F2750DFB903BFDA55CFDB174FDB77EFDB77EFDB173FCA45CF38D38F074
        0CF27105FDBC87FFFFFFFFFFFFFDA55CF8D1B1F3F0EEF5EEE7FDE2CCFED7B7FE
        D1ABFED1ABFED7B6FEE3CDFDF5EEF5F2EFF3CCACF7A25DFFFFFFFFFFFFFEF0E4
        FCB275F28227F36F04F47004FD7200FE7200FE7200FE7200FE7200FE7200FB86
        26F4AD73F7E9DEFFFFFFFFFFFFFC933EFE7200FD7200F47004F36F04F47004FD
        7200FE7200FE7200FE7200FE7200FE7200FD7200F59241FFFFFFFFFFFFFC9139
        FE7200FE7200FD7200F47004F36F04F47004FD7200FE7200FE7200FE7200FE72
        00FE7200FB933EFFFFFFFFFFFFFEF0E3FDAE6CFC801DFE7200FD7200F77002F6
        7003F77002FD7200FE7200FE7200FC831EFDAF6EFEF1E6FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEF1E8FEDEC4FED2AEFBCAA2FACAA2FBCFACFEDEC4FEF1E8FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = '&Testar'#13'Conex'#227'o'
      TabOrder = 0
      ScreenMask.Enabled = True
      ScreenMask.WaitData = True
      ScreenMask.Message = 'Aguardando Conex'#227'o com Banco de Dados!'
      OnClick = btnTestarConexaoClick
    end
  end
  object grpGeral: TUniGroupBox
    Left = 8
    Top = 175
    Width = 289
    Height = 47
    Hint = ''
    Caption = ''
    TabOrder = 7
    DesignSize = (
      289
      47)
    object lblProvider: TUniLabel
      Left = 9
      Top = 21
      Width = 40
      Height = 13
      Hint = ''
      Caption = 'Provider'
      Anchors = [akLeft, akTop, akRight, akBottom]
      ParentColor = False
      Color = clBtnFace
      Transparent = False
      TabOrder = 1
    end
    object edtProvider: TUniEdit
      Left = 57
      Top = 17
      Width = 192
      Height = 21
      Hint = 
        'Normalmente esse par'#226'metro n'#227'o precisa ser alterado,'#13#10'altere-o a' +
        'penas se estiver certo do que est'#225' fazendo.'
      ParentShowHint = False
      Text = ''
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      OnClick = rbDBAuthenticationClick
      OnExit = edtExit
      OnEnter = EditResetColor
    end
    object btnDefautlProvider: TUniBitBtn
      Left = 258
      Top = 16
      Width = 21
      Height = 21
      Hint = 'Restaura valor padr'#227'o'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF7D7D7D00000000000000000000000000000000
        0000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        7B7B7B000000000000000000000000000000000000000000FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF77777700000000000000000000
        0000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF4D4D4D000000000000000000000000000000000000FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF70707000000000000000000000000000
        0000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC9C9C9
        000000000000000000000000000000000000000000000000FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF55555500000000000000000000000039393970
        7070000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF111111
        000000000000000000363636FF00FFFF00FF7A7A7A000000FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF000000000000000000000000CDCDCDFF00FFFF
        00FFFF00FF7A7A7AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF242424
        000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF9A9A9AFF00FFFF00FF767676000000000000000000949494FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFDADADA4242428D8D8DFF00FFFF00FFFF00FF
        1111110000000000000808089B9B9BFF00FFFF00FFFF00FFB3B3B35B5B5B0303
        03494949FF00FFFF00FFFF00FFFF00FFC2C2C212121200000000000000000000
        00000000000000000000000000005A5A5AFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF7D7D7D2F2F2F050505000000000000101010505050BABABAFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 3
      OnClick = btnDefautlProviderClick
    end
  end
end