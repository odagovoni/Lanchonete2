unit UnitIngredientes;

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
  TFrmIngredientes = class(TForm)
    pHeader: TPanel;
    Label4: TLabel;
    dsIngredientes: TDataSource;
    gridProduto: TDBGrid;
    pBusca: TPanel;
    Panel7: TPanel;
    btnBusca: TSpeedButton;
    edtBusca: TEdit;
    imgFiltro: TImage;
    pnInsert: TPanel;
    Panel1: TPanel;
    btnAcessar: TSpeedButton;
    Panel2: TPanel;
    btnNovo: TSpeedButton;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    pnAdd: TPanel;
    Panel9: TPanel;
    pnBtnAdd: TPanel;
    btnAdd: TSpeedButton;
    edtQtde: TEdit;
    Label1: TLabel;
    pnSair: TPanel;
    btnSair: TSpeedButton;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure imgFiltroClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edtQtdeChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure gridProdutoDblClick(Sender: TObject);
    procedure edtQtdeKeyPress(Sender: TObject; var Key: Char);
  private
    procedure OpenCadProduto(id: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIngredientes: TFrmIngredientes;

implementation

{$R *.dfm}

uses uDM, UnitIngredientesCad;

procedure TFrmIngredientes.OpenCadProduto(id: integer);
begin
  if id = 0 then
    dm.qryIngredientes.Insert
  else
    dm.qryIngredientes.Edit;

  TNavigation.OpenModal(TFrmIngredientesCad, FrmIngredientesCad);
end;

procedure TFrmIngredientes.SpeedButton2Click(Sender: TObject);
begin
  if dm.qryIngredientes.IsEmpty then
    ShowMessage('Não existem Ingredientes pra edição.')
  else
    OpenCadProduto(dm.qryIngredientesid_ingredientes.AsInteger);
end;

procedure TFrmIngredientes.btnAcessarClick(Sender: TObject);
begin
  if Application.MessageBox(PChar(
    'Excluir o Ingredientes selecionado: ' + sLineBreak + dm.qryIngredientesingrediente.AsString),
    'Confirmação de Excluão', MB_ICONQUESTION + MB_YESNO) = ID_YES
  then
  begin
    dm.qryIngredientes.Delete;
    dm.qryIngredientes.Refresh;
  end;
end;

procedure TFrmIngredientes.btnAddClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmIngredientes.btnBuscaClick(Sender: TObject);
begin
  var busca := UpperCase(edtBusca.Text);
  with dm.qryIngredientes do
  begin
    Filtered := false;
    Filter   := '(upper(ingrediente) like ' + QuotedStr('%' + busca + '%')+ ')';
    Filtered := true;
  end;

  imgFiltro.Visible := edtBusca.Text <> EmptyStr;
end;

procedure TFrmIngredientes.btnNovoClick(Sender: TObject);
begin
  OpenCadProduto(0);
end;

procedure TFrmIngredientes.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmIngredientes.edtQtdeChange(Sender: TObject);
begin
  pnBtnAdd.Enabled := edtQtde.Text <> EmptyStr;
end;

procedure TFrmIngredientes.edtQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnAddClick(Sender);
    Key := #0;
  end;
end;

procedure TFrmIngredientes.FormShow(Sender: TObject);
begin
  DM.qryIngredientes.Open;
end;

procedure TFrmIngredientes.gridProdutoDblClick(Sender: TObject);
begin
 if pnAdd.Visible then
  begin
    edtQtde.Text := '1';

    if edtQtde.CanFocus then
      edtQtde.SetFocus;
  end;
end;

procedure TFrmIngredientes.imgFiltroClick(Sender: TObject);
begin
  edtBusca.Clear;
end;

end.
