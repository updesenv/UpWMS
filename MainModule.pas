unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, DBXDevartSQLServer, Data.SqlExpr,
  Data.DB, Data.Win.ADODB, uniGUIBaseClasses, uniGUIClasses,
  uniImageList, Midas, uniThreadTimer, DateUtils, UniFSKeys;

type
  TUniMainModule = class(TUniGUIMainModule)
    ADOConnection: TADOConnection;
    SQLConnection1: TSQLConnection;
    imgList: TUniNativeImageList;
    UniThreadTimerLicencas: TUniThreadTimer;
    UniFSKeys: TUniFSKeys;
    procedure UniGUIMainModuleBeforeLogin(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    //Declarações de Uso Geral do Sistema - Necessário estar declarado no MainModule devido ao paradigma
    FStatusError : String;
    sChaveUp: String;
    iControle:Integer;
    sTipoChaveUp: String;
    sSequencia: String;
    ErpUpSoftware : Boolean;
    UsuarioUpsoftware : Boolean;
    FMinutosInativos : Integer;
    FMinutosPermitidos : Integer;
    left, top : Integer;
    FURLLogin : Boolean;
    FModuloVisivel : Integer;
    FRotinaVisivel : Integer;
    FLinguagem : Integer;
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication , U_UpConnectionConfig , Biblio_LOG , Biblio;


function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;




procedure TUniMainModule.UniGUIMainModuleBeforeLogin(Sender: TObject;
  var Handled: Boolean);
var
  Parametros : TUpParametrosIni;
begin
  FStatusError      := '';
  FURLLogin         := False;
  Handled           := False;
  FModuloVisivel    := 0;
  FRotinaVisivel    := 0;
  FLinguagem        := 1;


  //Abre Conexões com Banco de Dados
  if not AbreConexoes(ADOConnection,SQLConnection1,Sender) then
  begin
    FStatusError := 'Offline';
    //frmConfigDBMobile.FFinalizarAplicacao := True;
    //Exit;
  end;

  Parametros := LerParametrosConexaoIni;
  FLinguagem := Parametros.Linguagem;
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
