unit dm_WMS;

interface

uses
  SysUtils, Classes, Data.DB, Data.Win.ADODB;

type
  TdmWMS = class(TDataModule)
    dtsUsuario: TDataSource;
    adodtsUsuario: TADODataSet;
    adodtsUsuarioID: TAutoIncField;
    adodtsUsuarioNOME: TStringField;
    adodtsUsuarioSENHA: TStringField;
    adodtsUsuarioATIVO: TStringField;
    adodtsEtiqueta: TADODataSet;
    dtsEtiqueta: TDataSource;
    adodtsEtiquetaDESCRICAO: TStringField;
    adodtsEtiquetaQTD: TBCDField;
    adodtsEtiquetaPESO: TBCDField;
    adodtsEtiquetaDT_FABRIC: TDateTimeField;
    adodtsEtiquetaDT_VALIDADE: TDateTimeField;
    adodtsEtiquetaLOTE_FORN: TStringField;
    adoprcAlteracaoEtiquetaDinamica: TADOStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function dmWMS: TdmWMS;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, MainModule;

function dmWMS: TdmWMS;
begin
  Result := TdmWMS(UniMainModule.GetModuleInstance(TdmWMS));
end;

initialization
  RegisterModuleClass(TdmWMS);

end.
