unit UnitLancheCustom;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxButtonEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.Buttons, Vcl.ExtCtrls, Datasnap.DBClient,
  System.ImageList, Vcl.ImgList, Vcl.Mask, Vcl.DBCtrls;

type
  TFrmLancheCustom = class(TForm)
    edtLanche: TEdit;
    lblTitulo: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    edtValor: TEdit;
    Label1: TLabel;
    cdsIngredientesTMP: TClientDataSet;
    cdsIngredientesTMPid_Ingrediente: TIntegerField;
    cdsIngredientesTMPqtde: TIntegerField;
    cdsIngredientesTMPdescricao: TStringField;
    cdsIngredientesTMPunitario: TFMTBCDField;
    cdsIngredientesTMPtotal: TFMTBCDField;
    dsIngredientesTMP: TDataSource;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1id_Ingrediente: TcxGridDBColumn;
    cxGridDBTableView1qtde: TcxGridDBColumn;
    cxGridDBTableView1total: TcxGridDBColumn;
    cxGridDBTableView1descricao: TcxGridDBColumn;
    cxGridDBTableView1unitario: TcxGridDBColumn;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    ImageList1: TImageList;
    Panel3: TPanel;
    cdsIngredientesTMPtotal_geral: TAggregateField;
    cdsIngredientesTMPid_lanche: TIntegerField;
    procedure cxGridDBTableView1Column1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Panel3Click(Sender: TObject);
    procedure dsIngredientesTMPDataChange(Sender: TObject; Field: TField);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    id_lanche: Integer;
  end;

var
  FrmLancheCustom: TFrmLancheCustom;

implementation

uses
  UnitIngredientes, uDM;

{$R *.dfm}

procedure TFrmLancheCustom.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLancheCustom.btnSalvarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmLancheCustom.cxGridDBTableView1Column1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  case AButtonIndex of
    0: cdsIngredientesTMP.Edit;

    1: cdsIngredientesTMP.Delete;
  end;
end;

procedure TFrmLancheCustom.dsIngredientesTMPDataChange(Sender: TObject;
  Field: TField);
begin
  try
    edtValor.Text := 'R$ ' + FormatFloat('#,#.00', cdsIngredientesTMPtotal_geral.Value);
  except
    edtValor.Clear;
  end;
end;

procedure TFrmLancheCustom.FormShow(Sender: TObject);
begin
  with cdsIngredientesTMP do
  begin
    Close;
    CreateDataSet;
  end;

  with dm.qryIngredientesPorLanche do
  begin
    Close;
    Params[0].AsInteger := id_lanche;
    Open;

    First;
    while not Eof do
    begin
      cdsIngredientesTMP.Insert;
      cdsIngredientesTMPid_Ingrediente.AsInteger := dm.qryIngredientesPorLancheid_ingrediente.AsInteger;
      cdsIngredientesTMPdescricao.AsString       := dm.qryIngredientesPorLancheingrediente.AsString;
      cdsIngredientesTMPqtde.AsInteger           := dm.qryIngredientesPorLanchequantidade.Asinteger;
      cdsIngredientesTMPunitario.AsFloat         := dm.qryIngredientesPorLanchevalor.AsFloat;
      cdsIngredientesTMPtotal.AsFloat            := dm.qryIngredientesPorLanchevalor_total.AsFloat;
      cdsIngredientesTMP.Post;
      Next;
    end;
  end;
end;

procedure TFrmLancheCustom.Panel3Click(Sender: TObject);
begin
  Application.CreateForm(TFrmIngredientes, FrmIngredientes);
  try
    with FrmIngredientes do
    begin
      pnInsert.Visible := false;
      pnAdd.Visible    := true;
      Align            := alCustom;
      Position         := poScreenCenter;
      WindowState      := TWindowState.wsNormal;
    end;

    if FrmIngredientes.ShowModal = mrOk then
    begin
      with cdsIngredientesTMP do
      begin
        if not Active then
          CreateDataSet;

        Insert;
        cdsIngredientesTMPid_Ingrediente.AsInteger := dm.qryIngredientesid_ingredientes.AsInteger;
        cdsIngredientesTMPdescricao.AsString       := dm.qryIngredientesingrediente.AsString;
        cdsIngredientesTMPqtde.AsInteger           := StrToInt(FrmIngredientes.edtQtde.Text);
        cdsIngredientesTMPunitario.AsFloat         := dm.qryIngredientesvalor.AsFloat;
        cdsIngredientesTMPtotal.AsFloat            := dm.qryIngredientesvalor.AsFloat * cdsIngredientesTMPqtde.AsInteger;
        cdsIngredientesTMPid_lanche.AsInteger      := id_lanche;
        Post;
      end;
    end;

  finally
    //cdsIngredientesTMP.SaveToFile('E:\bck\projetos\Delphi\Lanchonete\db\dadosTMP.xml', dfXML);
    FreeAndNil(FrmIngredientes);
  end;
end;

end.
