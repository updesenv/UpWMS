unit Biblio;

interface

uses
  uniGUITypes, Classes, Controls, SysUtils, Data.Win.ADODB,
  Windows, Datasnap.DBClient, Data.DB, StrUtils, Math, uniDBGrid,
  DateUtils, Graphics, UniGUIForm, uniDBLookupCombobox,
  UniGUIClasses,
  UniSFComboMultiple, UniSFCombobox, UniDateTimePicker, UniComboBox, Registry,
  UniDBComboBox, uniLabel, UniGuiDialogs,UniEdit,UniDBDateTimePicker, Variants,
  unidbedit, types, uniFileUpload, uniGUIJSInterface, unidbmemo,
  uniListBox; //uniGUIClasses {, siComp, U_UpTranslate};

type
  TUniControlDyn = Array of TUniControl;

//function Crypto(Texto: String; Modo: Char; Chave: Char): String;
function Crypto(Texto: AnsiString; Modo: AnsiChar; Chave: AnsiChar): AnsiString;
function RetornaPuro(Numero: Integer): Integer;

implementation

uses
  MainModule, uniGUIApplication, ServerModule;

function RetornaPuro(Numero: Integer): Integer;
var
  // Texto: String;
  Texto: AnsiString;
  I, AuxNum, TMPResult: Integer;
begin
  TMPResult := Numero;
  while TMPResult > 9 do
  begin
    AuxNum := 0;
    Texto := IntToStr(TMPResult);
    for I := 1 to Length(Texto) do
    begin
      AuxNum := AuxNum + StrToInt(Texto[I]);
    end;
    TMPResult := AuxNum;
  end;
  RetornaPuro := TMPResult;
end;
{ function Crypto(Texto: String; Modo: Char; Chave: Char): String;
  var
  Numero, I: Integer;
  TMPText: String;
  begin
  if Length(Trim(Texto)) > 0 then
  begin
  if Modo = 'E' then
  begin
  if Length(Trim(Chave)) <> 1 then
  begin
  Randomize;
  Numero := 0;
  while (Numero < 100) do
  Numero := Random(256);
  Chave := Chr(Numero);
  end;
  SetLength(TMPText, Length(Trim(Texto)) + 1);
  TMPText[1] := Chave;
  for I := 1 to Length(Trim(Texto)) do
  TMPText[I + 1] := Chr(Ord(Texto[I]) + RetornaPuro(Ord(Chave)) + 10);
  Crypto := Trim(TMPText);
  end
  else
  begin
  if Modo = 'D' then
  begin
  if Length(Trim(Chave)) <> 1 then
  Chave := Texto[1];
  if Chave = Texto[1] then
  begin
  SetLength(TMPText, Length(Trim(Texto)) - 1);
  for I := 2 to Length(Trim(Texto)) do
  TMPText[I - 1] := Chr(Ord(Texto[I]) - RetornaPuro(Ord(Chave)) - 10);
  Crypto := Trim(TMPText);
  end
  else
  begin
  Mens('Chave de Descriptografia inválida!', 'E');
  Crypto := '';
  end;
  end
  else
  begin
  Mens('Modo de Criptografia deve ser "E" ou "D"!', 'E');
  Crypto := '';
  end;
  end;
  end
  else
  Crypto := '';
  end; }

// Alte.: Por conta de compatibilidade entre o D7 e o DXE8 foram necessárias
// as seguintes alterações na função:
// - String por AnsiString
// - Char por AnsiChar
// - Chr por() AnsiChar()
// obs.: a função original está comentada logo acima
// Resp.: Sara  Data: 27/07/2020
function Crypto(Texto: AnsiString; Modo, Chave: AnsiChar): AnsiString;
var
  Numero, I: Integer;
  TMPText: AnsiString;
begin
  if Length(Trim(Texto)) > 0 then
  begin
    if Modo = 'E' then
    begin
      if Length(Trim(Chave)) <> 1 then
      begin
        Randomize;
        Numero := 0;
        while (Numero < 100) do
          Numero := Random(256);
        Chave := AnsiChar(Numero);
      end;
      SetLength(TMPText, Length(Trim(Texto)) + 1);
      TMPText[1] := Chave;
      for I := 1 to Length(Trim(Texto)) do
        TMPText[I + 1] :=
          AnsiChar(Ord(Texto[I]) + RetornaPuro(Ord(Chave)) + 10);
      Crypto := Trim(TMPText);
    end
    else
    begin
      if Modo = 'D' then
      begin
        if Length(Trim(Chave)) <> 1 then
          Chave := Texto[1];
        if Chave = Texto[1] then
        begin
          SetLength(TMPText, Length(Trim(Texto)) - 1);
          for I := 2 to Length(Trim(Texto)) do
            TMPText[I - 1] :=
              AnsiChar(Ord(Texto[I]) - RetornaPuro(Ord(Chave)) - 10);
          Crypto := Trim(TMPText);
        end
        else
        begin
          ShowMessage('Chave de Descriptografia inválida!');
          Crypto := '';
        end;
      end
      else
      begin
        ShowMessage('Modo de Criptografia deve ser "E" ou "D"!');
        Crypto := '';
      end;
    end;
  end
  else
    Crypto := '';
end;

end.
