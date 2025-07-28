unit UnitProduto;

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
  TFrmProduto = class(TForm)
    pHeader: TPanel;
    Label4: TLabel;
    Panel1: TPanel;
    btnAcessar: TSpeedButton;
    Panel2: TPanel;
    btnNovo: TSpeedButton;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    dsProduto: TDataSource;
    gridProduto: TDBGrid;
    pBusca: TPanel;
    Panel7: TPanel;
    btnBusca: TSpeedButton;
    edtBusca: TEdit;
    imgFiltro: TImage;
    pnSair: TPanel;
    btnSair: TSpeedButton;
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure imgFiltroClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    procedure OpenCadProduto(id_produto: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProduto: TFrmProduto;

implementation

{$R *.dfm}

uses UnitProdutosCad, uDM;

procedure TFrmProduto.OpenCadProduto(id_produto: integer);
begin
  if id_produto = 0 then
    dm.qryProduto.Insert
  else
    dm.qryProduto.Edit;

  TNavigation.OpenModal(TFrmProdutoCad, FrmProduto);
end;

procedure TFrmProduto.SpeedButton2Click(Sender: TObject);
begin
  if dm.qryProduto.IsEmpty then
    ShowMessage('Não existem Produtos pra edição.')
  else
    OpenCadProduto(dm.qryProdutoid_lanche.AsInteger);
end;

procedure TFrmProduto.btnAcessarClick(Sender: TObject);
begin
  if Application.MessageBox(PChar(
    'Excluir o produto selecionado: ' + sLineBreak + dm.qryProdutodescricao_lanche.AsString),
    'Confirmação de Excluão', MB_ICONQUESTION + MB_YESNO) = ID_YES
  then
  begin
    dm.qryProduto.Delete;
    dm.qryProduto.Refresh;
  end;

end;

procedure TFrmProduto.btnBuscaClick(Sender: TObject);
begin
  var busca := UpperCase(edtBusca.Text);
  with dm.qryProduto do
  begin
    Filtered := false;
    Filter   := '(upper(descricao_produto) like ' + QuotedStr('%' + busca + '%')+ ')';
    Filtered := true;
  end;

  imgFiltro.Visible := edtBusca.Text <> EmptyStr;
end;

procedure TFrmProduto.btnNovoClick(Sender: TObject);
begin
  OpenCadProduto(0);
end;

procedure TFrmProduto.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmProduto.FormShow(Sender: TObject);
begin
  DM.qryProduto.Open;
end;

procedure TFrmProduto.imgFiltroClick(Sender: TObject);
begin
  edtBusca.Clear;
end;

end.
