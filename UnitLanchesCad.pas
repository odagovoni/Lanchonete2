unit UnitLanchesCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Navigation, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.ComCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, cxDBData, cxButtonEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxImageList, dxSkinsCore, dxSkinBasic,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Datasnap.DBClient;

type
  TFrmUnitLanchesCad = class(TForm)
    lblTitulo: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    dsLanches: TDataSource;
    Label3: TLabel;
    dbedtpreco: TDBEdit;
    dsLancheIngredientes: TDataSource;
    ImageList1: TImageList;
    grpIngredientes: TGroupBox;
    Panel3: TPanel;
    cdsIngredientesTMP: TClientDataSet;
    cdsIngredientesTMPid_Ingrediente: TIntegerField;
    cdsIngredientesTMPqtde: TIntegerField;
    cdsIngredientesTMPdescricao: TStringField;
    cdsIngredientesTMPunitario: TFMTBCDField;
    cdsIngredientesTMPtotal: TFMTBCDField;
    dsIngredientesTMP: TDataSource;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1qtde: TcxGridDBColumn;
    cxGridDBTableView1descricao: TcxGridDBColumn;
    cxGridDBTableView1unitario: TcxGridDBColumn;
    cxGridDBTableView1total: TcxGridDBColumn;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    cdsIngredientesTMPtotal_geral: TAggregateField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cxGrid1DBTableView1Column1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxGridDBTableView1Column1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure dsIngredientesTMPDataChange(Sender: TObject; Field: TField);
  private
    procedure CarregarIngreditentesTMP;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUnitLanchesCad: TFrmUnitLanchesCad;

implementation

{$R *.dfm}

uses uDM, UnitIngredientes;

procedure TFrmUnitLanchesCad.btnCancelarClick(Sender: TObject);
begin
  with dm.qryLanches do
    if State in [dsInsert, dsEdit] then
    begin
      Cancel;
      Refresh;
    end;

  TNavigation.Close(Self);
end;

procedure TFrmUnitLanchesCad.btnSalvarClick(Sender: TObject);
var
  erro: string;
begin
  if cdsIngredientesTMP.IsEmpty then
    Application.MessageBox('É necessário pelo menos um ingrediente. Por favor adicione ingredientes ao lanche.', 'Atenção', MB_ICONWARNING)
  else
  begin
    with dm.qryLanches do
    begin
      if State = dsEdit then
      begin
        if not dm.DeleteIngredientesOld(DM.qryLanchesid_lanche.AsInteger, erro) then
        begin
          Application.MessageBox('Erro', 'Atenção', MB_ICONWARNING);
          Abort;
        end;
      end;

      if State in [dsInsert, dsEdit] then
      begin
        DM.qryLanchestipo_produto.AsString := 'L';
        Post;

        with cdsIngredientesTMP do
        begin
          First;

          while not Eof do
          begin
            if not dm.SalvarIngredientes(
                      DM.qryLanchesid_lanche.AsInteger,
                      cdsIngredientesTMPid_Ingrediente.AsInteger,
                      cdsIngredientesTMPqtde.AsInteger,
                      cdsIngredientesTMP.RecNo,
                      erro)
            then
            begin
              var msg :=
              'Erro ao salvar lista de ingredientes. ' + sLineBreak +
              'Repita a opeção, se o erro persistir, informe este erro ao reponsavel pelo sistemas. ' + sLineBreak +
              erro;

              Application.MessageBox(PChar(msg), 'Erro');
              DM.qryLanches.Delete;
            end;

            Next;
          end;
        end;

        Refresh;
      end;
    end;
    TNavigation.Close(Self);
  end;
end;

procedure TFrmUnitLanchesCad.cxGrid1DBTableView1Column1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  case AButtonIndex of
    0: cdsIngredientesTMP.Edit;
    1: cdsIngredientesTMP.Delete;
  end;
end;

procedure TFrmUnitLanchesCad.cxGridDBTableView1Column1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  case AButtonIndex of
    0:  cdsIngredientesTMP.Edit;

    1:
    begin
//      if Application.MessageBox(PChar(
//        'Excluir o Ingredientes selecionado: ' + sLineBreak + cdsIngredientesTMPdescricao.AsString),
//        'Confirmação de Excluão', MB_ICONQUESTION + MB_YESNO) = ID_YES
//      then
        cdsIngredientesTMP.Delete;
    end;
  end;
  //ShowMessage('add ' + AButtonIndex.ToString);
end;

procedure TFrmUnitLanchesCad.dsIngredientesTMPDataChange(Sender: TObject;
  Field: TField);
begin
  try
    dbedtpreco.Text := cdsIngredientesTMPtotal_geral.Value;
  except
    dbedtpreco.Clear;
  end;
end;

procedure TFrmUnitLanchesCad.CarregarIngreditentesTMP;
begin
  with dm.qryIngredTEMP do
  begin
    Close;
    Params[0].AsInteger :=  dm.qryLanchesid_lanche.AsInteger;
    Open;

    First;
    while not Eof do
    begin
      with cdsIngredientesTMP do
      begin
        Insert;
        cdsIngredientesTMPid_Ingrediente.AsInteger := dm.qryIngredTEMPid_ingrediente.AsInteger;
        cdsIngredientesTMPdescricao.AsString       := dm.qryIngredTEMPingrediente.AsString;
        cdsIngredientesTMPqtde.AsInteger           := dm.qryIngredTEMPquantidade.AsInteger;
        cdsIngredientesTMPunitario.AsFloat         := dm.qryIngredTEMPvalor.AsFloat;
        cdsIngredientesTMPtotal.AsFloat            := dm.qryIngredTEMPvalor.AsFloat * dm.qryIngredTEMPquantidade.AsInteger;
        Post;
      end;

      Next;
    end;
  end;
end;

procedure TFrmUnitLanchesCad.FormShow(Sender: TObject);
begin
  with cdsIngredientesTMP do
  begin
    //EmptyDataSet;

    if not Active then
      CreateDataSet;
  end;

  if dm.qryLanches.State = dsInsert then
  begin
    lblTitulo.Caption := 'Novo Lanche';
  end else begin
    lblTitulo.Caption := 'Editar Lanche';
    CarregarIngreditentesTMP;
  end;
end;

procedure TFrmUnitLanchesCad.SpeedButton1Click(Sender: TObject);
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
      //if dm.qryLanches.State = dsInsert then
      begin
        with cdsIngredientesTMP do
        begin
          Insert;
          cdsIngredientesTMPid_Ingrediente.AsInteger := dm.qryIngredientesid_ingredientes.AsInteger;
          cdsIngredientesTMPdescricao.AsString       := dm.qryIngredientesingrediente.AsString;
          cdsIngredientesTMPqtde.AsInteger           := StrToInt(FrmIngredientes.edtQtde.Text);
          cdsIngredientesTMPunitario.AsFloat         := dm.qryIngredientesvalor.AsFloat;
          cdsIngredientesTMPtotal.AsFloat            := dm.qryIngredientesvalor.AsFloat * cdsIngredientesTMPqtde.AsInteger;
          Post;
        end;
      end;
    end;
  finally
    //cdsIngredientesTMP.SaveToFile('E:\bck\projetos\Delphi\Lanchonete\db\dadosTMP.xml', dfXML);
    FreeAndNil(FrmIngredientes);
  end;
end;

end.
