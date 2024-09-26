unit U_UpConnectionConfig;

interface

uses
  //UniGUI Uses
  uniGUITypes, IniFiles,

  //Delphi Uses
  Controls, SysUtils, Forms, Data.Win.ADODB, Data.SqlExpr,

  //Custom Uses
  Biblio, Biblio_LOG;

type
  TUpParametrosIni = record
    Host : String;
    Ip: String;
    Path: String;
    OsAuthentication: Boolean;
    UserName: string;
    Password: string;
    Provider: string;
    MessageDelay: Integer;
    TimerParamsEnabled: Boolean;
    TimerParamsDelay: Integer;
    Loaded: Boolean;
    Linguagem: Integer;
  end;

function TestaConexaoADO (ADOConnection : TADOConnection) : Boolean;
function TestaConexaoDBEx (SQLConnection : TSQLConnection) : Boolean;

function AbreConexoes(ADOConnection : TADOConnection; SQLConnection : TSQLConnection; Sender : TObject) : Boolean;
function AbreConexaoADO (ADOConnection : TADOConnection; Sender : TObject) : Boolean;
function AbreConexaoDBEx (SQLConnection : TSQLConnection; Sender : TObject) : Boolean;

procedure FechaConexaoADO (ADOConnection : TADOConnection; Sender : TObject);
procedure FechaConexaoDBEx (SQLConnection : TSQLConnection; Sender : TObject);

function IniciaConexaoADO(ADOConnection : TADOConnection; Sender : TObject) : Boolean;
function IniciaConexaoDBEx(SQLConnection : TSQLConnection; Sender : TObject) : Boolean;

function AtribuiParametrosDefault : TUpParametrosIni;
function ObtemNomeArquivoIni: string;
function VerifExistArquivoIni(Sender : TObject) : Boolean;
function LerParametrosConexaoIni : TUpParametrosIni;
procedure EscreveArquivoIni (Parametros : TUpParametrosIni; Sender : TObject);

function TestaADOConnection (Parametros : TUpParametrosIni; Sender : TObject) : Boolean;
function CriaConectionString (Parametros : TUpParametrosIni) : String;

function TestaDBExConnection (Parametros : TUpParametrosIni; Sender : TObject) : Boolean;
procedure AtribuiParametrosDBEx (Parametros : TUpParametrosIni; SQLConnection : TSQLConnection);


const
  _DEFAULT_MESSAGE_DELAY = 5000;
  _DEFAULT_TIMER_PARAM_ENABLED = False;
  _DEFAULT_TIMER_PARAM_DELAY = 15000;
  _DEFAULT_VALUE_PROVIDER = 'SQLOLEDB.1';
  _INI_START_VERSION = 0;
  _DEFAULT_LINGUAGEM = 1;
  _VERSAO_MINIMA_ERP = '11.16.21.0';

implementation

uses
  U_frmConfigBD;

Const

  _INI_FILE = 'UpPagamentos.INI';

  //Const SECTIONS Arquvio .Ini
  _SECTION_DATA_BASE = 'BANCO DE DADOS';
  _SECTION_PRINT = 'IMPRESSAO';

  //Const ATRIBUTOS Arquvio .Ini
  _KEY_HOST = 'HOST';
  _KEY_IP = 'IP';
  _KEY_PATH = 'PATH';
  _KEY_OS_AUTH = 'OS_AUTHENTICATION';
  _KEY_USER_NAME = 'USERNAME';
  _KEY_PASSWORD = 'PASSWORD';
  _KEY_PROVIDER = 'Provider';
  _KEY_DELAY_LOST_CONNECTION = 'DelayLostConnection';
  _KEY_TIMER_PARAM_ENABLED = 'TimerParamEnabled';
  _KEY_TIMER_PARAM_DELAY = 'TimerParamDelay';

  _KEY_UDL_PROVIDER = _KEY_PROVIDER;
  _KEY_UDL_OS_AUTH = 'Integrated Security';
  _KEY_UDL_PERSIST_SECURITY_INFO = 'Persist Security Info';
  _KEY_UDL_USER_NAME = 'User ID';
  _KEY_UDL_PASSWORD = 'Password';
  _KEY_UDL_INITIAL_CATALOG = 'Initial Catalog';
  _KEY_UDL_DATA_SOURCE = 'Data Source';

  _VALUE_PROVIDER = _DEFAULT_VALUE_PROVIDER;

  _UDL_FIELD_DELIM = ';';
  _UDL_VALUE_DELIM = '=';

  _VALUE_UDL_PERSIST_SECURITY_INFO = 'True';
  _VALUE_UDL_OS_AUTH = 'SSPI';

  _NOUSER = 'Não logado';

  _LINGUAGEM = 'Linguagem';


function TestaConexaoADO (ADOConnection : TADOConnection) : Boolean;
begin
  Result := False;

  if ADOConnection.Connected then
    Result := True
  else
    Result := False;
end;

function TestaConexaoDBEx (SQLConnection : TSQLConnection) : Boolean;
begin
  Result := False;

  if SQLConnection.Connected then
    Result := True
  else
    Result := False;
end;

function AbreConexoes(ADOConnection : TADOConnection; SQLConnection : TSQLConnection; Sender : TObject) : Boolean;
begin
  Result := False;

  if VerifExistArquivoIni(Sender) then
  begin
    if AbreConexaoADO(ADOConnection,Sender) then
      if AbreConexaoDBEx(SQLConnection,Sender) then
        Result := True;
  end;
end;

function AbreConexaoADO(ADOConnection : TADOConnection; Sender : TObject) : Boolean;
begin
  Result := False;

  ADOConnection.Close;

  if IniciaConexaoADO(ADOConnection,Sender) then
    Result := True;
  end;

function AbreConexaoDBEx (SQLConnection : TSQLConnection; Sender : TObject) : Boolean;
begin
  Result := False;

  SQLConnection.Close;

  if IniciaConexaoDBEx(SQLConnection,Sender) then
    Result := True;

end;

procedure FechaConexaoADO(ADOConnection : TADOConnection; Sender : TObject);
begin
  ADOConnection.Close;
  try
    ADOConnection.Connected := False;
  except on E: Exception do
    begin
      GravaLogWEB(_NOUSER,'FechaConexaoADO','Erro ao fechar conexão com Banco de Dados! MSG.Original:'+E.Message, Sender);
    end;
  end;
end;

procedure FechaConexaoDBEx(SQLConnection : TSQLConnection; Sender : TObject);
begin
  SQLConnection.Close;
  try
    SQLConnection.Connected := False;
  except on E: Exception do
    begin
      GravaLogWEB(_NOUSER,'FechaConexaoDBEx','Erro ao fechar conexão com Banco de Dados! MSG.Original:'+E.Message, Sender);
    end;
  end;
end;

function IniciaConexaoADO(ADOConnection : TADOConnection; Sender : TObject) : Boolean;
var
  Parametros : TUpParametrosIni;
begin
  Result := False;

  Parametros := LerParametrosConexaoIni;

  ADOConnection.ConnectionString := CriaConectionString(Parametros);

  try
    ADOConnection.Connected := True;
    Result := True;
  except on E: Exception do
    begin
      Result := False;
      GravaLogWEB(_NOUSER,'IniciaConexaoADO','Conexão não estabelicida! MSG.Original:'+E.Message, Sender);
    end;
  end;
end;

function IniciaConexaoDBEx(SQLConnection : TSQLConnection; Sender : TObject) : Boolean;
var
  Parametros : TUpParametrosIni;
begin
  Result := False;

  Parametros := LerParametrosConexaoIni;
  //UniMainModule.FLinguagem := Parametros.Linguagem;

  AtribuiParametrosDBEx(Parametros,SQLConnection);

  try
    SQLConnection.Connected := True;
    Result := True;
  except on E: Exception do
    begin
      Result := False;
      GravaLogWEB(_NOUSER,'IniciaConexaoDBEx','Conexão não estabelicida! MSG.Original:'+E.Message, Sender);
    end;
  end;
end;

function AtribuiParametrosDefault : TUpParametrosIni;
begin

  Result.Host              := EmptyStr;
  Result.Ip                := EmptyStr;
  Result.Path              := EmptyStr;
  Result.OsAuthentication  := False;
  Result.UserName          := 'sa';
  Result.Password          := EmptyStr;
  Result.Provider          := _DEFAULT_VALUE_PROVIDER;
  Result.Loaded            := True;

end;

function ObtemNomeArquivoIni: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + _INI_FILE;
end;

function VerifExistArquivoIni(Sender : TObject) : Boolean;
begin
  Result := False;

  if FileExists(ObtemNomeArquivoIni) then
    Result := True
  else
    GravaLogWEB(_NOUSER,'VerifExistArquivoIni','Arquivo .INI não encontrado', Sender);
end;

function LerParametrosConexaoIni : TUpParametrosIni;
var
  lIni: TIniFile;
begin
  lIni := TIniFile.Create(ObtemNomeArquivoIni);

  Result.Host                 := lIni.ReadString(_SECTION_DATA_BASE, _KEY_HOST, EmptyStr);
  Result.Ip                   := lIni.ReadString(_SECTION_DATA_BASE, _KEY_IP, EmptyStr);
  Result.Path                 := lIni.ReadString(_SECTION_DATA_BASE, _KEY_PATH, EmptyStr);
  Result.OsAuthentication     := lIni.ReadBool(_SECTION_DATA_BASE, _KEY_OS_AUTH, False) or (AnsiLowerCase(lIni.ReadString(_SECTION_DATA_BASE, _KEY_OS_AUTH, EmptyStr)) = 'true');
  Result.UserName             := lIni.ReadString(_SECTION_DATA_BASE, _KEY_USER_NAME, EmptyStr);
  Result.Password             := Crypto(lIni.ReadString(_SECTION_DATA_BASE, _KEY_PASSWORD, EmptyStr),'D','U');
//  Result.Password             := lIni.ReadString(_SECTION_DATA_BASE, _KEY_PASSWORD, EmptyStr);
  Result.Provider             := lIni.ReadString(_SECTION_DATA_BASE, _KEY_PROVIDER, _VALUE_PROVIDER);
  Result.MessageDelay         := lIni.ReadInteger(_SECTION_DATA_BASE, _KEY_DELAY_LOST_CONNECTION, _DEFAULT_MESSAGE_DELAY);
  Result.TimerParamsEnabled   := lIni.ReadBool(_SECTION_DATA_BASE, _KEY_TIMER_PARAM_ENABLED, _DEFAULT_TIMER_PARAM_ENABLED);
  Result.TimerParamsDelay     := lIni.ReadInteger(_SECTION_DATA_BASE, _KEY_TIMER_PARAM_DELAY, _DEFAULT_TIMER_PARAM_DELAY);
  Result.Linguagem            := lIni.ReadInteger(_SECTION_DATA_BASE, _LINGUAGEM, 1);
  Result.Loaded := True;

end;

procedure EscreveArquivoIni (Parametros : TUpParametrosIni; Sender : TObject);
var
  lIni: TIniFile;
begin
  try
    lIni := TIniFile.Create(ObtemNomeArquivoIni);
    lIni.WriteString(_SECTION_DATA_BASE, _KEY_HOST, Parametros.Host);
    lIni.WriteString(_SECTION_DATA_BASE, _KEY_IP, Parametros.Ip);
    lIni.WriteString(_SECTION_DATA_BASE, _KEY_PATH, Parametros.Path);
    lIni.WriteBool(_SECTION_DATA_BASE, _KEY_OS_AUTH, Parametros.OsAuthentication);
    lIni.WriteString(_SECTION_DATA_BASE, _KEY_USER_NAME, Parametros.UserName);
    lIni.WriteString(_SECTION_DATA_BASE, _KEY_PASSWORD, Crypto(Parametros.Password,'E','U'));
//    lIni.WriteString(_SECTION_DATA_BASE, _KEY_PASSWORD, Parametros.Password);
    lIni.WriteString(_SECTION_DATA_BASE, _KEY_PROVIDER, Parametros.Provider);
  except on E: Exception do
    begin
      GravaLogWEB(_NOUSER,'EscreveArquivoIni','Arquivo .INI não pode ser escrito. MSG.Original: ' + E.Message, Sender);
    end;

  end;

end;

function TestaADOConnection (Parametros : TUpParametrosIni; Sender : TObject) : Boolean;
var
  Conexao : TADOConnection;
  ConnectionString : String;
begin

  try
    Conexao := TADOConnection.Create(nil);

    Conexao.Name := 'Teste_'+ FormatDateTime('dd_mm_yyyy_hh_nn_ss_zzz', Now);
    Conexao.LoginPrompt := False;
    Conexao.CommandTimeout := 999;

    ConnectionString := CriaConectionString(Parametros);

    Conexao.ConnectionString := ConnectionString;

    try
      Conexao.Connected := True;
      Result := True;
    except on E: Exception do
      begin
        Result := False;
        GravaLogWEB(_NOUSER,'TestaADOConnection','A conexão com o Banco de Dados não foi estabelicida. MSG.Original: ' + E.Message, Sender);
      end;
    end;

  finally
    FreeAndNil(Conexao);
  end;

end;

function CriaConectionString (Parametros : TUpParametrosIni) : String;
var
  lProvider, lOsAuth, lPersistSecurityInfo, lUserName, lPassword, lInitialCatalog, lDataSource: string;
  lDelim, lEqual: string;
begin
  lDelim := _UDL_FIELD_DELIM;
  lEqual := _UDL_VALUE_DELIM;

  lProvider := _KEY_UDL_PROVIDER + lEqual + Parametros.Provider + lDelim;

  lOsAuth := EmptyStr;
  lPassword := EmptyStr;
  lPersistSecurityInfo := EmptyStr;
  lUserName := EmptyStr;

  if Parametros.OsAuthentication then
  begin
    lOsAuth := _KEY_UDL_OS_AUTH + lEqual + _VALUE_UDL_OS_AUTH + lDelim;
  end
  else
  begin
    lPassword := _KEY_UDL_PASSWORD + lEqual + Parametros.Password + lDelim;
    lPersistSecurityInfo := _KEY_UDL_PERSIST_SECURITY_INFO + lEqual + _VALUE_UDL_PERSIST_SECURITY_INFO + lDelim;
    lUserName := _KEY_UDL_USER_NAME + lEqual + Parametros.UserName + lDelim;
  end;

  lInitialCatalog := _KEY_UDL_INITIAL_CATALOG + lEqual + Parametros.Path + lDelim;
  lDataSource := _KEY_UDL_DATA_SOURCE + lEqual + Parametros.Host;

  Result := lProvider + lOsAuth + lPassword + lPersistSecurityInfo + lUserName + lInitialCatalog + lDataSource;

end;

function TestaDBExConnection (Parametros : TUpParametrosIni; Sender : TObject) : Boolean;
var
  Conexao : TSQLConnection;
  ConnectionString : String;
begin

  try
    Conexao := TSQLConnection.Create(nil);

    Conexao.Name := 'Teste_'+ FormatDateTime('dd_mm_yyyy_hh_nn_ss_zzz', Now);
    Conexao.DriverName := 'DevartSQLServer';
    Conexao.LoginPrompt := False;

    AtribuiParametrosDBEx(Parametros,Conexao);

    try
      Conexao.Connected := True;
      Result := True;
    except on E: Exception do
      begin
        Result := False;
        GravaLogWEB(_NOUSER,'TestaDBExConnection','A conexão com o Banco de Dados não foi estabelicida. MSG.Original: ' + E.Message, Sender);
      end;
    end;

  finally
    FreeAndNil(Conexao);
  end;

end;

procedure AtribuiParametrosDBEx (Parametros : TUpParametrosIni; SQLConnection : TSQLConnection);
begin
  SQLConnection.Params.Values['SchemaOverride']         := '%.dbo';
  SQLConnection.Params.Values['DriverUnit']             := 'DBXDevartSQLServer';
  SQLConnection.Params.Values['DriverPackageLoader']    := 'TDBXDynalinkDriverLoader,DBXCommonDriver220.bpl';
  SQLConnection.Params.Values['MetaDataPackageLoader']  := 'TDBXDevartMSSQLMetaDataCommandFactory,DbxDevartSQLServerDriver220.bpl';
  SQLConnection.Params.Values['ProductName']   		      := 'DevartSQLServer';
  SQLConnection.Params.Values['GetDriverFunc']          := 'getSQLDriverSQLServer';
  SQLConnection.Params.Values['LibraryName']            := 'dbexpsda40.dll';
  SQLConnection.Params.Values['VendorLib']              := 'sqloledb.dll';
  SQLConnection.Params.Values['LibraryNameOsx']         := 'libdbexpsda40.dylib';
  SQLConnection.Params.Values['VendorLibOsx']           := 'sqloledb.dylib';
  SQLConnection.Params.Values['LocaleCode']             := '0000';
  SQLConnection.Params.Values['IsolationLevel']         := 'ReadCommitted';
  SQLConnection.Params.Values['MaxBlobSize']            := '-1';
  SQLConnection.Params.Values['LongStrings']            := 'True';
  SQLConnection.Params.Values['EnableBCD']              := 'True';
  SQLConnection.Params.Values['FetchAll']               := 'True';
  SQLConnection.Params.Values['ParamPrefix']            := 'False';
  SQLConnection.Params.Values['UseUnicode']             := 'True';
  SQLConnection.Params.Values['IPVersion']              := 'IPv4';
  SQLConnection.Params.Values['UseQuoteChar']           := 'True';
  SQLConnection.Params.Values['BlobSize']               := '-1';

  SQLConnection.Params.Values['HostName']               := Parametros.Host;
  SQLConnection.Params.Values['DataBase']               := Parametros.Path;
  SQLConnection.Params.Values['User_Name']              := Parametros.UserName;
  SQLConnection.Params.Values['Password']               := Parametros.Password;
end;

end.

