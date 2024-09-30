unit U_frmWMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniGUIBaseClasses, uniEdit, unimEdit, uniLabel, unimLabel, uniButton,
  uniBitBtn, unimBitBtn, uniDateTimePicker, unimDatePicker, uniSweetAlert;

type
  TfrmWMS = class(TUnimForm)
    uniPanelPrincipal: TUnimContainerPanel;
    uniPanelCima: TUnimContainerPanel;
    uniPanelDireita: TUnimContainerPanel;
    uniPanelEsquerda: TUnimContainerPanel;
    uniPanelCentral: TUnimContainerPanel;
    edtCodBarras: TUnimEdit;
    lblSeparador1: TUnimLabel;
    edtQtd: TUnimEdit;
    lblQtd: TUnimLabel;
    btnNovaBusca: TUnimBitBtn;
    lblPesoBruto: TUnimLabel;
    edtPesoBruto: TUnimEdit;
    lblSeparador2: TUnimLabel;
    lblFabricacao: TUnimLabel;
    lblSeparador3: TUnimLabel;
    lblSeparador4: TUnimLabel;
    lblValidade: TUnimLabel;
    dtValidade: TUnimDatePicker;
    edtLoteFornecedor: TUnimEdit;
    lblLoteFornecedor: TUnimLabel;
    lblSeparador5: TUnimLabel;
    dtFabricacao: TUnimDatePicker;
    btnValidar: TUnimBitBtn;
    lblSeparador6: TUnimLabel;
    swtAlerta: TUniSweetAlert;
    edtProduto: TUnimEdit;
    lblProduto: TUnimLabel;
    UnimLabel1: TUnimLabel;
    lblSeparador7: TUnimLabel;
    procedure UnimFormShow(Sender: TObject);
    procedure edtCodBarrasExit(Sender: TObject);
    procedure btnNovaBuscaClick(Sender: TObject);
    procedure btnValidarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ControlaCmampos(visible:Boolean);
    procedure ConsultaEtiqueta(etiqueta:String);
    procedure ZeraCampos();
    procedure ZeraTela();
  end;

var
  codBarras: String;

function frmWMS: TfrmWMS;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, dm_WMS;

function frmWMS: TfrmWMS;
begin
  Result := TfrmWMS(UniMainModule.GetFormInstance(TfrmWMS));
end;

{ TfrmWMS }

procedure TfrmWMS.btnNovaBuscaClick(Sender: TObject);
begin
  ZeraTela();
end;

procedure TfrmWMS.btnValidarClick(Sender: TObject);
begin
  // POST DOS DADOS NOVO
  with dmWMS.adoprcAlteracaoEtiquetaDinamica do
  begin
    Close;
    Parameters.ParamByName('@QTD').Value                            := StrToFloat(edtQtd.Text);
    Parameters.ParamByName('@PESO').Value                           := StrToFloat(edtPesoBruto.Text);
    Parameters.ParamByName('@LOTE_FORN').Value                      := edtLoteFornecedor.Text;
    Parameters.ParamByName('@USUARIO_ALTERACAO_DINAMICA').Value     := 'UPSOFTWARE';
    Parameters.ParamByName('@ETIQUETA').Value                        := codBarras;
    Parameters.ParamByName('@FABRICACAO').Value                     := dtFabricacao.Date;
    Parameters.ParamByName('@VALIDADE').Value                       := dtValidade.Date;
    Parameters.ParamByName('@DT_ALTERACAO_DINAMICA').Value          := Now();
    ExecProc;
  end;

  ZeraTela();

  swtAlerta.Title            := 'Atenção';
  swtAlerta.InputType        := ItNone;
  swtAlerta.AlertType        := atSuccess;
  swtAlerta.ShowCancelButton := False;
  swtAlerta.Show('Etiqueta validada!') ;

end;

procedure TfrmWMS.ConsultaEtiqueta(etiqueta: String);
begin
  with dmWMS.adodtsEtiqueta do
  begin
    Close;
    Parameters.ParamByName('@ETIQUETA').Value := etiqueta;
    Open;
  end;

  if dmWMS.adodtsEtiqueta.RecordCount > 0 then
  begin
    ControlaCmampos(true);

    codBarras := etiqueta;

    //qtd
    edtQtd.Text :=  FormatFloat('0.000', dmWMS.adodtsEtiquetaQTD.AsFloat);

    //peso bruto
    edtPesoBruto.Text :=  FormatFloat('0.000', dmWMS.adodtsEtiquetaPESO.AsFloat);

    //fabricaçao
    dtFabricacao.Date :=  dmWMS.adodtsEtiquetaDT_FABRIC.AsDateTime;

    //validade
    dtValidade.Date :=  dmWMS.adodtsEtiquetaDT_VALIDADE.AsDateTime;

    //lote fornecedor
    edtLoteFornecedor.Text :=  dmWMS.adodtsEtiquetaLOTE_FORN.AsString;

    //produto
    edtProduto.Text :=  dmWMS.adodtsEtiquetaDESCRICAO.AsString;
  end
  else
  begin
    ZeraTela();

    swtAlerta.Title            := 'Atenção';
    swtAlerta.InputType        := ItNone;
    swtAlerta.AlertType        := atInfo;
    swtAlerta.ShowCancelButton := False;
    swtAlerta.Show('Nenhuma etiqueta localizada!') ;

  end;

end;

procedure TfrmWMS.ControlaCmampos(visible: Boolean);
begin

  edtCodBarras.Enabled := not visible;
  btnNovaBusca.Visible := visible;
  btnValidar.Visible := visible;

  //qtd
  edtQtd.Visible :=  visible;
  lblQtd.Visible :=  visible;

  //peso bruto
  edtPesoBruto.Visible :=  visible;
  lblPesoBruto.Visible :=  visible;

  //fabricaçao
  dtFabricacao.Visible :=  visible;
  lblFabricacao.Visible :=  visible;

  //validade
  dtValidade.Visible :=  visible;
  lblValidade.Visible :=  visible;

  //lote fornecedor
  edtLoteFornecedor.Visible :=  visible;
  lblLoteFornecedor.Visible :=  visible;

  //produto
  edtProduto.Visible :=  visible;
  lblProduto.Visible :=  visible;


end;

procedure TfrmWMS.edtCodBarrasExit(Sender: TObject);
begin
  if edtCodBarras.Text <> '' then
    ConsultaEtiqueta(edtCodBarras.Text);
end;

procedure TfrmWMS.UnimFormShow(Sender: TObject);
begin
  edtCodBarras.SetFocus;
  ControlaCmampos(false);
end;

procedure TfrmWMS.ZeraCampos;
begin
    edtCodBarras.Text := '';
    edtQtd.Text :=  '';
    edtPesoBruto.Text :=  '';
    dtFabricacao.Date :=  Now();
    dtValidade.Date :=  Now();
    edtLoteFornecedor.Text :=  '';
    edtProduto.Text :=  '';
end;

procedure TfrmWMS.ZeraTela;
begin
  edtCodBarras.SetFocus;
  ZeraCampos();
  ControlaCmampos(false);
end;

end.
