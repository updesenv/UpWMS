unit Biblio_LOG;

interface

uses
  Data.Win.ADODB, SysUtils, Datasnap.DBClient, UniGUIApplication;

procedure GravaLogWEB(sUsuario,sInstrucao,sInfo : String; Sender : TObject);

implementation

uses
  Biblio, DB, Variants;

procedure GravaLogWEB(sUsuario,sInstrucao,sInfo : String; Sender : TObject);
var
  nomeSender : String;
  S1log, S2log : String;
begin

  S1log := '';
  S2log := '';
  nomeSender := '';

  nomeSender := TObject(Sender).UnitName;

  S1log := 'Origem: '+ nomeSender + ',' + ' Usuário: ' + sUsuario + ',' + ' IP: '+  UniSession.RemoteIP;
  S2log := 'Instrução: ' + sInstrucao + ',' + 'Info: ' + sInfo;
  UniSession.Log(S1log,S2log,nomeSender);

end;

end.
