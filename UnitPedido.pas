unit UnitPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, vcl.Navigation, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxScrollbarAnnotations, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.Imaging.pngimage;

type
  TFrmPedido = class(TForm)
    pHeader: TPanel;
    Label4: TLabel;
    Panel1: TPanel;
    btnAcessar: TSpeedButton;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    DBGrid1: TDBGrid;
    dsPedidos: TDataSource;
    pBusca: TPanel;
    Panel7: TPanel;
    btnBusca: TSpeedButton;
    edtBusca: TEdit;
    gbDetalhesPedido: TGroupBox;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    pnSair: TPanel;
    btnSair: TSpeedButton;
    dsItens: TDataSource;
    cxGridDBTableView1total: TcxGridDBColumn;
    cxGridDBTableView1item_pedido: TcxGridDBColumn;
    cxGridDBTableView1valor_total_lanche: TcxGridDBColumn;
    cxGridDBTableView1descricao_lanche: TcxGridDBColumn;
    cxGridDBTableView1quantidade: TcxGridDBColumn;
    imgFiltro: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure imgFiltroClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    procedure OpenCadCliente(id: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPedido: TFrmPedido;

implementation

{$R *.dfm}

uses uDM, UnitPedidoCad;

procedure TFrmPedido.FormShow(Sender: TObject);
begin
  dm.qryPedidosConsulta.Open;
  dm.qryPedidos.Open;
end;

procedure TFrmPedido.imgFiltroClick(Sender: TObject);
begin
  edtBusca.Clear;
end;

procedure TFrmPedido.OpenCadCliente(id: integer);
begin
  if id = 0 then
    dm.qryPedidos.Insert
  else
    dm.qryPedidos.Edit;

  TNavigation.OpenModal(TFrmPedidoCad, FrmPedidoCad);
end;

procedure TFrmPedido.btnBuscaClick(Sender: TObject);
begin
  var busca := UpperCase(edtBusca.Text);
  with dm.qryPedidosConsulta do
  begin
    Filtered := false;
    Filter   := '(upper(cliente) like ' + QuotedStr('%' + busca + '%')+') or (numero_pedido like ' + QuotedStr('%' + busca + '%') + ')';
    Filtered := true;
  end;

  imgFiltro.Visible := edtBusca.Text <> EmptyStr;
end;

procedure TFrmPedido.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.qryPedidosConsulta.Close;
  dm.qryPedidosItens.Close;
end;

procedure TFrmPedido.SpeedButton1Click(Sender: TObject);
begin
  OpenCadCliente(0);
end;

procedure TFrmPedido.SpeedButton2Click(Sender: TObject);
begin
  OpenCadCliente(dm.qryPedidosConsultanumero_pedido.AsInteger);
end;

end.
