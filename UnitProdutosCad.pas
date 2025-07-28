unit UnitProdutosCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Navigation, Data.DB, Vcl.Mask, Vcl.DBCtrls;

type
  TFrmProdutoCad = class(TForm)
    lblTitulo: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    Label2: TLabel;
    dbedtdescricao_produto: TDBEdit;
    Label3: TLabel;
    dbedtpreco: TDBEdit;
    rgTipo: TRadioGroup;
    dsProdutos: TDataSource;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProdutoCad: TFrmProdutoCad;

implementation

{$R *.dfm}

uses uDM;

procedure TFrmProdutoCad.btnCancelarClick(Sender: TObject);
begin
  with dm.qryClientes do
    if State in [dsInsert, dsEdit] then
    begin
      Cancel;
      Refresh;
    end;

  TNavigation.Close(Self);
end;

procedure TFrmProdutoCad.btnSalvarClick(Sender: TObject);
begin
  var tipo: string;

  with dm.qryProduto do
  begin
    if State in [dsInsert, dsEdit] then
    begin
      case rgTipo.ItemIndex of
        1: tipo := 'B';
        2: tipo := 'A';
      end;
      dm.qryProdutotipo_produto.AsString := tipo;
      Post;

      Close;
      Open;
    end;
  end;

  TNavigation.Close(Self);
end;

procedure TFrmProdutoCad.FormShow(Sender: TObject);
begin
  if dm.qryProduto.State = dsEdit then
  begin
    lblTitulo.Caption := 'Editar Produto';

    if dm.qryProdutotipo_produto.AsString = 'B' then
      rgTipo.ItemIndex := 1
    else
    if dm.qryProdutotipo_produto.AsString = 'A' then
      rgTipo.ItemIndex := 2;
  end
  else
    lblTitulo.Caption := 'Inserir Produto';
end;

end.
