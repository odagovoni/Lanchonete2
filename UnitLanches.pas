unit UnitLanches;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Navigation, FireDAC.Stan.Async,
  FireDAC.DApt, Vcl.Imaging.pngimage;

type
  TFrmLanches = class(TForm)
    pHeader: TPanel;
    Label4: TLabel;
    dsLanches: TDataSource;
    gridLanches: TDBGrid;
    pBusca: TPanel;
    Panel7: TPanel;
    btnBusca: TSpeedButton;
    edtBusca: TEdit;
    imgFiltro: TImage;
    dsLancheIngredientes: TDataSource;
    DBGrid1: TDBGrid;
    pnSair: TPanel;
    btnSair: TSpeedButton;
    pnInsert: TPanel;
    Panel1: TPanel;
    btnAcessar: TSpeedButton;
    Panel2: TPanel;
    btnNovo: TSpeedButton;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    pnAdd: TPanel;
    Label2: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    Panel9: TPanel;
    pnBtnAdd: TPanel;
    btnAdd: TSpeedButton;
    edtQtde: TEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure imgFiltroClick(Sender: TObject);
    procedure gridLanchesDblClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure edtQtdeChange(Sender: TObject);
  private
    procedure OpenCadProduto(id: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLanches: TFrmLanches;

implementation

{$R *.dfm}

uses uDM, UnitLanchesCad;

procedure TFrmLanches.OpenCadProduto(id: integer);
begin
  if id = 0 then
    dm.qryLanches.Insert
  else
    dm.qryLanches.Edit;

  TNavigation.OpenModal(TFrmUnitLanchesCad, FrmUnitLanchesCad);

  dm.qryLanches.Refresh;
end;

procedure TFrmLanches.SpeedButton2Click(Sender: TObject);
begin
  if dm.qryLanches.IsEmpty then
    ShowMessage('Não existem Lanches pra edição.')
  else
    OpenCadProduto(dm.qryLanchesid_lanche.AsInteger);
end;

procedure TFrmLanches.btnAcessarClick(Sender: TObject);
begin
  if Application.MessageBox(PChar(
    'Excluir o Lanche selecionado: ' + sLineBreak + dm.qryLanchesdescricao_lanche.AsString),
    'Confirmação de Excluão', MB_ICONQUESTION + MB_YESNO) = ID_YES
  then
  begin
    dm.qryLanches.Delete;
    dm.qryLanches.Refresh;
  end;
end;

procedure TFrmLanches.btnAddClick(Sender: TObject);
begin
  if edtQtde.Text <> EmptyStr then
    ModalResult := mrOk
  else
    Application.MessageBox('É necessário informar uma quantidade. Por favor informe a quantidade do item selecionado.', 'Atenção', MB_ICONWARNING)
end;

procedure TFrmLanches.btnBuscaClick(Sender: TObject);
begin
  var busca := UpperCase(edtBusca.Text);
  with dm.qryLanches do
  begin
    Filtered := false;
    Filter   := '(upper(descricao_lanche) like ' + QuotedStr('%' + busca + '%')+ ')';
    Filtered := true;
  end;

  imgFiltro.Visible := edtBusca.Text <> EmptyStr;
end;

procedure TFrmLanches.btnNovoClick(Sender: TObject);
begin
  OpenCadProduto(0);
end;

procedure TFrmLanches.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLanches.edtQtdeChange(Sender: TObject);
begin
  pnBtnAdd.Enabled := edtQtde.Text <> EmptyStr;
end;

procedure TFrmLanches.FormShow(Sender: TObject);
begin
  DM.qryLanches.Open;
end;

procedure TFrmLanches.gridLanchesDblClick(Sender: TObject);
begin
  if pnAdd.Visible then
  begin
    edtQtde.Text := '1';

    if edtQtde.CanFocus then
      edtQtde.SetFocus;
  end;
end;

procedure TFrmLanches.imgFiltroClick(Sender: TObject);
begin
  edtBusca.Clear;
end;

end.
