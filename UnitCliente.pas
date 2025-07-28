unit UnitCliente;

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
  TFrmCliente = class(TForm)
    pHeader: TPanel;
    Label4: TLabel;
    dsClientes: TDataSource;
    gridClientes: TDBGrid;
    pBusca: TPanel;
    Panel7: TPanel;
    btnBusca: TSpeedButton;
    edtBusca: TEdit;
    imgFiltro: TImage;
    pnAdd: TPanel;
    Label1: TLabel;
    pnSair: TPanel;
    btnSair: TSpeedButton;
    pnInsert: TPanel;
    Panel1: TPanel;
    btnAcessar: TSpeedButton;
    Panel2: TPanel;
    btnNovo: TSpeedButton;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure imgFiltroClick(Sender: TObject);
    procedure gridClientesDblClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    procedure OpenCadCliente(id_cliente: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.dfm}

uses UnitClienteCad, uDM;

procedure TFrmCliente.OpenCadCliente(id_cliente: integer);
begin
  if id_cliente = 0 then
    dm.qryClientes.Insert
  else
    dm.qryClientes.Edit;

  TNavigation.OpenModal(TFrmClienteCad, FrmClienteCad);
end;

procedure TFrmCliente.SpeedButton2Click(Sender: TObject);
begin
  if dm.qryClientes.IsEmpty then
    ShowMessage('Não existem clientes pra edição.')
  else
    OpenCadCliente(dm.qryClientesid_clientes.AsInteger);
end;

procedure TFrmCliente.btnAcessarClick(Sender: TObject);
begin
  if Application.MessageBox(PChar(
    'Excluir o cliente selecionado: ' + sLineBreak + dm.qryClientescliente.AsString),
    'Confirmação de Excluão', MB_ICONQUESTION + MB_YESNO) = ID_YES
  then
  begin
    dm.qryClientes.Delete;
    dm.qryClientes.Refresh;
  end;

end;

procedure TFrmCliente.btnBuscaClick(Sender: TObject);
begin
  var busca := UpperCase(edtBusca.Text);
  with dm.qryClientes do
  begin
    Filtered := false;
    Filter   := '(upper(cliente) like ' + QuotedStr('%' + busca + '%')+') or (telefone like ' + QuotedStr('%' + busca + '%') + ')';
    Filtered := true;
  end;

  imgFiltro.Visible := edtBusca.Text <> EmptyStr;
end;

procedure TFrmCliente.btnNovoClick(Sender: TObject);
begin
  OpenCadCliente(0);
end;

procedure TFrmCliente.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCliente.FormShow(Sender: TObject);
begin
  DM.qryClientes.Open;
end;

procedure TFrmCliente.gridClientesDblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFrmCliente.imgFiltroClick(Sender: TObject);
begin
  edtBusca.Clear;
end;

end.
