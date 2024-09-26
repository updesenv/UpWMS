unit Biblio_REPORT;

interface

uses
  ppReport, frxClass, Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, Math, StrUtils;
procedure ExibeRelatorio(const ppReport: TppReport; const iTipo : Integer; const sNome : String = '');
procedure ExibeRelatorioPDF(const ppReport: TppReport; const sNome : String = '');
procedure ExibeRelatorioXLSX(const ppReport: TppReport; const sNome : String = '');
function CriaRelatorioPDF(const ppReport: TppReport; const sNome : String = '') : String;
procedure ExibeRelatorioBrowser(const ppReport: TppReport;const sNome : String = '');
procedure ExibeRelatorioPDFFrx(const frxReport: TfrxReport; const sNome : String = '');




implementation



uses
  ServerModule, UF_frmRelatorioWeb, uf_scva, Biblio , UF_frmRelatorioWebFrx ;
procedure ExibeRelatorio(const ppReport: TppReport; const iTipo : Integer; const sNome : String = '');
begin
  if iTipo = 0 then
    ExibeRelatorioPDF(ppReport,sNome)
  else if iTipo = 99 then
    ExibeRelatorioBrowser(ppReport,sNome)
  else
    ExibeRelatorioXLSX(ppReport,sNome);
end;

procedure ExibeRelatorioPDF(const ppReport: TppReport; const sNome : String = '');
begin
  frmRelatorioWeb.ppReport := ppReport;
  frmRelatorioWeb.sNomeRelatorio := sNome;
  frmRelatorioWeb.ShowModal();
end;

procedure ExibeRelatorioXLSX(const ppReport: TppReport; const sNome : String = '');
const sCaracterEsp : array of String = ['"', '\','/',':','*','<','>','|',' '];
var sNomeArquivo,sCaracter : String;
    i : integer;
begin

  if trim(sNome) <> '' then
  begin
    sNomeArquivo := UpperCase(sNome);

    for I := Low(sCaracterEsp) to High(sCaracterEsp) do
    begin
      sCaracter := ifthen((sCaracterEsp[i] = ' '), '_', '');
      sNomeArquivo := StringReplace(sNomeArquivo, sCaracterEsp[i], sCaracter, [rfReplaceAll, rfIgnoreCase]);
    end;
  end;

  ppReport.DeviceType := 'XlsxReport';
  ppReport.XLSSettings.Title := sNome;
  ppReport.XLSSettings.WorksheetName := sNomeArquivo;
  ppReport.TextFileName := UniServerModule.LocalCachePath + sNomeArquivo + '.xlsx';
  ppReport.ShowPrintDialog := False;
  ppReport.Print;

  F_scva.UniSession.SendFile(UniServerModule.LocalCachePath + sNomeArquivo + '.xlsx');
end;

function CriaRelatorioPDF(const ppReport: TppReport; const sNome : String = '') : String;
var
  iRandom : Integer;
  sDirCompleto : String;
begin

  //cria numero aleatorio para concatenar no nome do arquivo
  Randomize;
  iRandom := Random(999999);

  sDirCompleto := UniServerModule.LocalCachePath + sNome +  '_' + IntToStr(iRandom) + '.pdf';

  ppReport.DeviceType := 'PDF';
  ppReport.TextFileName := sDirCompleto;
  ppReport.ShowPrintDialog := False;
  ppReport.Print;

  if FileExists(sDirCompleto) then
    Result := sDirCompleto
  else
    Result := '';
end;

procedure ExibeRelatorioBrowser(const ppReport: TppReport;const sNome : String = '');
const sCaracterEsp : array of String = ['"', '\','/',':','*','<','>','|',' '];
var sNamePDF, sCaminhoArquivo, sCaracter : String;
    i : integer;
begin

  Randomize;
  sNamePDF := InttoStr(Random(999999999999));

  if trim(sNome) <> '' then
  begin
    sNamePDF := UpperCase(sNome) + '_' + sNamePDF;

    for I := Low(sCaracterEsp) to High(sCaracterEsp) do
    begin
      sCaracter := ifthen((sCaracterEsp[i] = ' '), '_', '');
      sNamePDF := StringReplace(sNamePDF, sCaracterEsp[i], sCaracter, [rfReplaceAll, rfIgnoreCase]);
    end;
  end;

  sNamePDF := sNamePDF + '.pdf';

  sCaminhoArquivo := UniServerModule.LocalCachePath + sNamePDF;

  ppReport.ShowPrintDialog := False;
  ppReport.DeviceType := 'PDF';
  ppReport.TextFileName := sCaminhoArquivo;
  ppReport.Print;

  sCaminhoArquivo := StringReplace(sCaminhoArquivo, UniServerModule.CacheFolderPath, '',[rfReplaceAll, rfIgnoreCase]);

  BrowserURL(UniServerModule.UrlPath + sCaminhoArquivo);
end;

procedure ExibeRelatorioPDFFrx(const frxReport: TfrxReport; const sNome : String = '');
var
AUrl :String;
begin
  AUrl := 'report_'+FormatDateTime('hhmmss.zzz',Now)+'.pdf';
  frxReport.EngineOptions.SilentMode := True;
  frxReport.EngineOptions.EnableThreadSafe := True;
  frxReport.EngineOptions.DestroyForms := False;
  frxReport.EngineOptions.UseGlobalDataSetList := False;
  frxReport.PrintOptions.ShowDialog := False;
  frxReport.ShowProgress := False;
  frxReport.PreviewOptions.AllowEdit := False;
  frmRelatorioWebFrx.PDFExport.Background := True;
  frmRelatorioWebFrx.PDFExport.ShowProgress := False;
  frmRelatorioWebFrx.PDFExport.ShowDialog := False;
  frmRelatorioWebFrx.PDFExport.FileName := UniServerModule.NewCacheFileUrl(False,'pdf',sNome,'',AUrl);
  frmRelatorioWebFrx.PDFExport.DefaultPath := '';
  frxReport.PrepareReport;
  frxReport.Export(frmRelatorioWebFrx.PDFExport);

  frmRelatorioWebFrx.URLFrame.URL := AUrl;
  frmRelatorioWebFrx.WindowState := wsMaximized;
  frmRelatorioWebFrx.ShowModal();
end;end.
