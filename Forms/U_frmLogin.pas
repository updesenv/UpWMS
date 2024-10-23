unit U_frmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIRegClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniGUIBaseClasses, uniButton, unimButton, uniLabel, unimLabel, uniEdit,
  unimEdit, Vcl.Imaging.pngimage, uniImage, unimImage, uniBitBtn, UniSFButton,
  UniFSButton, unimBitBtn, uniSweetAlert;

type
  TfrmLogin = class(TUnimLoginForm)
    uniPanelPrincipal: TUnimContainerPanel;
    uniPanelCima: TUnimContainerPanel;
    uniPanelBaixo: TUnimContainerPanel;
    uniPanelDireita: TUnimContainerPanel;
    uniPanelEsquerda: TUnimContainerPanel;
    uniPanelCentral: TUnimContainerPanel;
    lblUsuario: TUnimLabel;
    lblSenha: TUnimLabel;
    edtUsuario: TUnimEdit;
    edtSenha: TUnimEdit;
    btnLogin: TUnimBitBtn;
    c: TUnimLabel;
    swtAlerta: TUniSweetAlert;
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var

  usuarioSessao : String;

function frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication , U_frmMainm  ,ServerModule , dm_WMS;

function frmLogin: TfrmLogin;
begin
  Result := TfrmLogin(UniMainModule.GetFormInstance(TfrmLogin));
end;



procedure TfrmLogin.btnLoginClick(Sender: TObject);

var
usuario , senha : String ;
begin

  with dmWMS.adodtsUsuario do
  begin
    Open;
    usuario := dmWMS.adodtsUsuarioNOME.AsString;
    senha := dmWMS.adodtsUsuarioSENHA.AsString;
    Close;
  end;


  if (UpperCase(edtUsuario.Text) = usuario) and (UpperCase(edtSenha.Text)= senha) then
  begin
    usuarioSessao := usuario;
    U_frmMainm.frmMainm.Show(nil);
  end;

  if (UpperCase(edtUsuario.Text) <> usuario) or (UpperCase(edtSenha.Text) <> senha) then
  begin
    swtAlerta.Title            := 'Atenção';
    swtAlerta.InputType        := ItNone;
    swtAlerta.AlertType        := atInfo;
    swtAlerta.ShowCancelButton := False;
    swtAlerta.Show('Usuário ou senha incorretos!') ;
  end;


end;

initialization
  RegisterAppFormClass(TfrmLogin);

end.
