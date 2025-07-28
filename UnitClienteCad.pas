unit UnitClienteCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Navigation, Data.DB, Vcl.Mask, Vcl.DBCtrls;

type
  TFrmClienteCad = class(TForm)
    lblTitulo: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    dsClientes: TDataSource;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmClienteCad: TFrmClienteCad;

implementation

{$R *.dfm}

uses uDM;

procedure TFrmClienteCad.btnCancelarClick(Sender: TObject);
begin
  with dm.qryClientes do
    if State in [dsInsert, dsEdit] then
    begin
      Cancel;
      Refresh;
    end;

  TNavigation.Close(Self);
end;

procedure TFrmClienteCad.btnSalvarClick(Sender: TObject);
begin
  with dm.qryClientes do
  begin
    if State in [dsInsert, dsEdit] then
    begin
      Post;
      Refresh;
    end;
  end;

  TNavigation.Close(Self);
end;

procedure TFrmClienteCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  FrmClienteCad := nil;
end;

end.
