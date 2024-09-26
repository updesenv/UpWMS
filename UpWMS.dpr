program UpWMS;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  U_UpConnectionConfig in 'Tools\U_UpConnectionConfig.pas',
  Biblio in 'Tools\Biblio.pas',
  Biblio_LOG in 'Tools\Biblio_LOG.pas',
  U_frmConfigBD in 'Data\U_frmConfigBD.pas' {frmConfigBD: TUniForm},
  U_frmLogin in 'Forms\U_frmLogin.pas' {frmLogin: TUnimLoginForm},
  U_frmMainm in 'Forms\U_frmMainm.pas' {frmMainm: TUnimForm},
  dm_WMS in 'Data\dm_WMS.pas' {dmWMS: TDataModule},
  U_frmWMS in 'Forms\U_frmWMS.pas' {frmWMS: TUnimForm};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Title := 'Up WMS';
  Application.Run;
end.
