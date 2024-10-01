object frmLogin: TfrmLogin
  AlignWithMargins = True
  Left = 0
  Top = 0
  ClientHeight = 593
  ClientWidth = 360
  Caption = 'MyUp Mobile'
  Color = clTeal
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
    Width = 360
    Height = 593
    Hint = ''
    Align = alClient
    Color = clTeal
    object uniPanelCima: TUnimContainerPanel
      Left = 0
      Top = 0
      Width = 360
      Height = 49
      Hint = ''
      Align = alTop
      Color = clTeal
    end
    object uniPanelDireita: TUnimContainerPanel
      Left = 304
      Top = 49
      Width = 56
      Height = 398
      Hint = ''
      Align = alRight
      Color = clTeal
    end
    object uniPanelCentral: TUnimContainerPanel
      Left = 49
      Top = 49
      Width = 255
      Height = 398
      Hint = ''
      Align = alClient
      Color = clTeal
      object lblUsuario: TUnimLabel
        Left = 0
        Top = 0
        Width = 255
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
        Width = 255
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
        Width = 255
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
        Width = 255
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
        Width = 255
        Height = 38
        Hint = ''
        Align = alTop
        Text = ''
        ParentFont = False
        TabOrder = 2
      end
      object btnLogin: TUnimBitBtn
        Left = 0
        Top = 351
        Width = 255
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
      Height = 398
      Hint = ''
      Align = alLeft
      Color = clTeal
    end
    object uniPanelBaixo: TUnimContainerPanel
      Left = 0
      Top = 447
      Width = 360
      Height = 146
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
