unit U_frmConfigBD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniRadioButton,
  uniGroupBox, uniEdit, uniGUIBaseClasses, uniLabel, U_UpConnectionConfig , Biblio,
  uniScreenMask;

type
  TfrmConfigBD = class(TUniForm)
    lbServer: TUniLabel;
    edtServer: TUniEdit;
    lbDataBase: TUniLabel;
    edtDataBase: TUniEdit;
    grpLogin: TUniGroupBox;
    lbUser: TUniLabel;
    lbPassword: TUniLabel;
    rbOsAuthentication: TUniRadioButton;
    rbDBAuthentication: TUniRadioButton;
    edtUser: TUniEdit;
    edtPassword: TUniEdit;
    btnPassword: TUniBitBtn;
    pnlBotoes: TUniPanel;
    btnGravar: TUniBitBtn;
    btnCancelar: TUniBitBtn;
    pnlTestarConexao: TUniPanel;
    btnTestarConexao: TUniBitBtn;
    grpGeral: TUniGroupBox;
    lblProvider: TUniLabel;
    edtProvider: TUniEdit;
    btnDefautlProvider: TUniBitBtn;
    procedure btnTestarConexaoClick(Sender: TObject);
    procedure EditResetColor(Sender: TObject);
    procedure edtExit(Sender: TObject);
    procedure rbOsAuthenticationClick(Sender: TObject);
    procedure rbDBAuthenticationClick(Sender: TObject);
    procedure btnDefautlProviderClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnPasswordClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FTested: Boolean;
    function ObtemParametrosConexao : TUpParametrosIni;
    function ValidaCamposObrigatorios : Boolean;
    function TestaCampo(Campo : TUniEdit) : Boolean;
    procedure PreencheCampos (Parametros : TUpParametrosIni);
  public
    { Public declarations }
    FFinalizarAplicacao : Boolean;
  end;

function frmConfigBD: TfrmConfigBD;

implementation

{$R *.dfm}

uses
  MainModule,
  uniGUIApplication;

const
  _ERROR_COLOR = $008080FF;
  _SUCCESS_COLOR = clMoneyGreen;
  _DEFAULT_COLOR = clWhite;

function frmConfigBD: TfrmConfigBD;
begin
  Result := TfrmConfigBD(UniMainModule.GetFormInstance(TfrmConfigBD));
end;

procedure TfrmConfigBD.btnCancelarClick(Sender: TObject);
begin
  //if //Conf('Deseja realmente cancelar a Parametrização?') then
 // begin
    //if (FFinalizarAplicacao = True) then
      //UniApplication.Terminate('Aplicação Encerrada');
  //end
  //else
    Exit;

  FFinalizarAplicacao := False;
  Close;
end;

procedure TfrmConfigBD.btnDefautlProviderClick(Sender: TObject);
begin
  edtProvider.Text := _DEFAULT_VALUE_PROVIDER;
  edtProvider.Color := _DEFAULT_COLOR;
end;

procedure TfrmConfigBD.btnGravarClick(Sender: TObject);
var
  Parametros : TUpParametrosIni;
begin
  if not ValidaCamposObrigatorios then
  begin
    ShowMessage('É necessário que todos os campos estejam preenchidos!');
    Exit;
  end;

  if not FTested then
  begin
    //if not Conf('A parametrização não teve teste positivo de conexão!' + #13 +
      //'Deseja salvar assim mesmo?') then
      Exit;
  end;

  Parametros := ObtemParametrosConexao;
  EscreveArquivoIni(Parametros,Sender);

  if (FFinalizarAplicacao = True) then
    UniApplication.Restart;

  FFinalizarAplicacao := False;
  Close;

end;

procedure TfrmConfigBD.btnPasswordClick(Sender: TObject);
begin
  if Trim(edtPassword.PasswordChar) = EmptyStr then
    edtPassword.PasswordChar := '*'
  else
    edtPassword.PasswordChar := #0;
end;

procedure TfrmConfigBD.btnTestarConexaoClick(Sender: TObject);
var
  Parametros : TUpParametrosIni;
begin

  try

    if not ValidaCamposObrigatorios then
    begin
      ShowMessage('É necessário que todos os campos estejam preenchidos!');
      Exit;
    end;

    Parametros := ObtemParametrosConexao;

    if TestaADOConnection(Parametros,Sender) then
    begin

      if TestaDBExConnection(Parametros,Sender) then
      begin

        FTested := True;
        ShowMessage('Configuração testada com sucesso!'+#13
            + 'Conexão com o Banco de Dados estabelecida com sucesso usando a parametrização atual.');
      end
      else
        ShowMessage('Não foi possível estabelecer Conexão com o Banco de Dados usando a parametrização atual.');

    end
    else
      ShowMessage('Não foi possível estabelecer Conexão com o Banco de Dados usando a parametrização atual.');
  finally
    btnTestarConexao.ScreenMask.HideMask;
  end;
end;

procedure TfrmConfigBD.EditResetColor(Sender: TObject);
begin
  (Sender as TUniEdit).Color := _DEFAULT_COLOR;
end;

procedure TfrmConfigBD.edtExit(Sender: TObject);
begin
  TestaCampo((Sender as TUniEdit));
end;

function TfrmConfigBD.ObtemParametrosConexao: TUpParametrosIni;
begin
  Result.Host                := edtServer.Text;
  Result.Ip                  := EmptyStr;
  Result.Path                := edtDataBase.Text;
  Result.OsAuthentication    := rbOsAuthentication.Checked;
  Result.UserName            := edtUser.Text;
  Result.Password            := UTF8toAnsi(edtPassword.Text);
  Result.Provider            := edtProvider.Text;
  Result.Loaded              := True;
end;

procedure TfrmConfigBD.PreencheCampos(Parametros: TUpParametrosIni);
begin
  edtServer.Text := Parametros.Host;
  edtDataBase.Text := Parametros.Path;

  if not Parametros.OsAuthentication then
    rbDBAuthentication.Checked;

  edtUser.Text := Parametros.UserName;
  edtPassword.Text := Parametros.Password;
  edtProvider.Text := Parametros.Provider;

end;

procedure TfrmConfigBD.rbDBAuthenticationClick(Sender: TObject);
begin
  edtUser.Enabled := True;
  edtPassword.Enabled := True;
end;

procedure TfrmConfigBD.rbOsAuthenticationClick(Sender: TObject);
begin
  edtUser.Enabled := False;
  edtUser.Color := _DEFAULT_COLOR;
  edtPassword.Enabled := False;
  edtPassword.Color := _DEFAULT_COLOR;
end;

function TfrmConfigBD.TestaCampo(Campo: TUniEdit): Boolean;
begin
  Result := True;
  if Campo.Text = EmptyStr then
  begin
    Result := False;
    Campo.Color := _ERROR_COLOR;
  end
  else
    Campo.Color := _SUCCESS_COLOR;
end;


procedure TfrmConfigBD.UniFormShow(Sender: TObject);
var
  Parametros : TUpParametrosIni;
begin

  if  VerifExistArquivoIni(Sender) then
    Parametros := LerParametrosConexaoIni
  else
    Parametros := AtribuiParametrosDefault;

  PreencheCampos(Parametros);

  FTested := False;
end;

function TfrmConfigBD.ValidaCamposObrigatorios: Boolean;
begin
  Result := True;

  if not TestaCampo(edtServer) then
    Result := False;

  if not TestaCampo(edtDataBase) then
    Result := False;

  if rbDBAuthentication.Checked then
  begin

    if not TestaCampo(edtUser) then
      Result := False;

    if not TestaCampo(edtPassword) then
      Result := False;

  end;

  if not TestaCampo(edtProvider) then
    Result := False;

end;

end.
