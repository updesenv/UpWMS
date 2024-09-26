object frmLogin: TfrmLogin
  AlignWithMargins = True
  Left = 0
  Top = 0
  ClientHeight = 900
  ClientWidth = 406
  Caption = 'UpSoftware WMS'
  Color = clTeal
  AlignmentControl = uniAlignmentClient
  AutoHeight = False
  TitleColor = clTeal
  TitleFontColor = clWhite
  CloseButton.Visible = False
  CloseButton.DefaultIcon = False
  CloseButton.ShowIcon = False
  TitleButtons = <>
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 47
  PlatformData = {}
  object uniPanelPrincipal: TUnimContainerPanel
    Left = 0
    Top = 0
    Width = 406
    Height = 900
    Hint = ''
    Align = alClient
    Color = clTeal
    object uniPanelCima: TUnimContainerPanel
      Left = 0
      Top = 0
      Width = 406
      Height = 49
      Hint = ''
      Align = alTop
      Color = clTeal
    end
    object uniPanelDireita: TUnimContainerPanel
      Left = 350
      Top = 49
      Width = 56
      Height = 706
      Hint = ''
      Align = alRight
      Color = clTeal
    end
    object uniPanelCentral: TUnimContainerPanel
      Left = 49
      Top = 49
      Width = 301
      Height = 706
      Hint = ''
      Align = alClient
      object lblUsuario: TUnimLabel
        Left = 0
        Top = 0
        Width = 301
        Height = 23
        Hint = ''
        AutoSize = False
        Caption = 'Usuario:'
        Align = alTop
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
      end
      object edtUsuario: TUnimEdit
        Left = 0
        Top = 23
        Width = 301
        Height = 38
        Hint = ''
        Align = alTop
        Text = ''
        ParentFont = False
        TabOrder = 1
      end
      object c: TUnimLabel
        Left = 0
        Top = 61
        Width = 301
        Height = 33
        Hint = ''
        AutoSize = False
        Caption = ''
        Align = alTop
        ParentFont = False
        Font.Color = clBtnFace
        Font.Style = [fsBold]
      end
      object lblSenha: TUnimLabel
        Left = 0
        Top = 94
        Width = 301
        Height = 27
        Hint = ''
        AutoSize = False
        Caption = 'Senha:'
        Align = alTop
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
      end
      object edtSenha: TUnimEdit
        Left = 0
        Top = 121
        Width = 301
        Height = 38
        Hint = ''
        Align = alTop
        Text = ''
        ParentFont = False
        TabOrder = 2
      end
      object btnLogin: TUnimBitBtn
        Left = 0
        Top = 659
        Width = 301
        Height = 47
        Hint = ''
        Align = alBottom
        UI = 'round'
        Caption = 'Entrar'
        OnClick = btnLoginClick
      end
    end
    object uniPanelEsquerda: TUnimContainerPanel
      Left = 0
      Top = 49
      Width = 49
      Height = 706
      Hint = ''
      Align = alLeft
      Color = clTeal
    end
    object uniPanelBaixo: TUnimContainerPanel
      Left = 0
      Top = 755
      Width = 406
      Height = 145
      Hint = ''
      Align = alBottom
      Color = clTeal
    end
  end
  object swtAlerta: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'OK'
    CancelButtonText = 'Cancel'
    Padding = 20
    Left = 265
    Top = 345
  end
end
