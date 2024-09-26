unit U_frmMainm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIRegClasses, uniGUIForm, uniGUImForm,
  uniGUImJSForm,
  Data.DB, Data.Win.ADODB, uniGUIBaseClasses, uniBasicGrid, uniDBGrid,
  unimDBListGrid, unimDBGrid, uniEdit, uniDBEdit, unimDBEdit, uniButton,
  unimButton, unimEdit, uniMultiItem, unimList, unimDBList, uniLabel, unimLabel,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  uniCheckBox, unimCheckBox, unimPanel , System.JSON, Vcl.Imaging.jpeg,
  uniImage, unimImage, Vcl.Imaging.pngimage, uniBitBtn, UniFSButton, unimBitBtn,
  uniScreenMask, uniThreadTimer, uniTimer, unimTimer,
  ACBrBase, Vcl.ExtCtrls , IdBaseComponent, IdComponent, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL;

type
  TfrmMainm = class(TUnimForm)
    uniPanelPrincipal: TUnimContainerPanel;
    uniPanelCima: TUnimContainerPanel;
    uniPanelBaixo: TUnimContainerPanel;
    uniPanelCentral: TUnimContainerPanel;
    btnWMS: TUnimBitBtn;
    btnOutro: TUnimBitBtn;
    uniPanelDireita: TUnimContainerPanel;
    uniPanelEsquerda: TUnimContainerPanel;
    lblSeparador1: TUnimLabel;
    procedure btnWMSClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    StatusLink , provedor , TxIdGlobal , ClientId , ClientSecret , Module : String;
    valor : Double;
    Filial : Integer;
    DataCriacao : TDateTime;
  end;

function frmMainm: TfrmMainm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, ServerModule ,
  TypInfo, Clipbrd, IniFiles, DateUtils, synacode, synautil, pcnConversao,U_frmWMS;

function frmMainm: TfrmMainm;
begin
  Result := TfrmMainm(UniMainModule.GetFormInstance(TfrmMainm));
end;



procedure TfrmMainm.btnWMSClick(Sender: TObject);
begin
  U_frmWMS.frmWMS.Show(nil);
end;

initialization

RegisterAppFormClass(TfrmMainm);

end.
