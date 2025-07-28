unit UnitIngredientesCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Navigation, Data.DB, Vcl.Mask, Vcl.DBCtrls;

type
  TFrmIngredientesCad = class(TForm)
    lblTitulo: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    dsIngrediente: TDataSource;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIngredientesCad: TFrmIngredientesCad;

implementation

{$R *.dfm}

uses uDM;

procedure TFrmIngredientesCad.btnCancelarClick(Sender: TObject);
begin
  with dm.qryIngredientes do
    if State in [dsInsert, dsEdit] then
    begin
      Cancel;
      Refresh;
    end;

  TNavigation.Close(Self);
end;

procedure TFrmIngredientesCad.btnSalvarClick(Sender: TObject);
begin
  with dm.qryIngredientes do
  begin
    if State in [dsInsert, dsEdit] then
    begin
      Post;
      Refresh;
    end;
  end;

  TNavigation.Close(Self);
end;

end.
