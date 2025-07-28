program Lanchonete;

uses
  Vcl.Forms,
  UnitLogin in 'UnitLogin.pas' {FrmLogin},
  UnitPrincipal in 'UnitPrincipal.pas' {FrmPrincipal},
  Vcl.Loading in 'Utils\Vcl.Loading.pas',
  Vcl.Session in 'Utils\Vcl.Session.pas',
  Vcl.Navigation in 'Utils\Vcl.Navigation.pas',
  UnitPedido in 'UnitPedido.pas' {FrmPedido},
  uDM in 'uDM.pas' {dm: TDataModule},
  UnitCliente in 'UnitCliente.pas' {FrmCliente},
  UnitPedidoCad in 'UnitPedidoCad.pas' {FrmPedidoCad},
  UnitLancheCustom in 'UnitLancheCustom.pas' {FrmLancheCustom},
  UnitIngredientes in 'UnitIngredientes.pas' {FrmIngredientes},
  UnitIngredientesCad in 'UnitIngredientesCad.pas' {FrmIngredientesCad},
  UnitLanches in 'UnitLanches.pas' {FrmLanches},
  UnitLanchesCad in 'UnitLanchesCad.pas' {FrmUnitLanchesCad},
  UnitProduto in 'UnitProduto.pas' {FrmProduto},
  UnitProdutosCad in 'UnitProdutosCad.pas' {FrmProdutoCad};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.Run;
end.
