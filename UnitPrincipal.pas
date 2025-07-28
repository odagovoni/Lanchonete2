unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.WinXCtrls, System.ImageList, Vcl.ImgList, Vcl.CategoryButtons,
  Vcl.StdCtrls, Vcl.Session, Vcl.Navigation;

type
  TFrmPrincipal = class(TForm)
    sMenu: TSplitView;
    pLogo: TPanel;
    btnMenu: TSpeedButton;
    Image1: TImage;
    ImageList: TImageList;
    CategoryMenuButtons: TCategoryButtons;
    sSubMenu: TSplitView;
    Panel1: TPanel;
    CategorySubmenuButtons: TCategoryButtons;
    Label1: TLabel;
    btnCloseSub: TSpeedButton;
    pNavbar: TPanel;
    pTela: TPanel;
    pUsuario: TPanel;
    lblNome: TLabel;
    lblEmail: TLabel;
    Image2: TImage;
    Image3: TImage;
    pContainer: TPanel;
    procedure btnMenuClick(Sender: TObject);
    procedure btnCloseSubClick(Sender: TObject);
    procedure CategoryMenuButtonsCategories0Items5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CategoryMenuButtonsCategories0Items1Click(Sender: TObject);
    procedure CategorySubmenuButtonsCategories0Items0Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CategorySubmenuButtonsCategories0Items1Click(Sender: TObject);
    procedure CategorySubmenuButtonsCategories0Items3Click(Sender: TObject);
    procedure CategorySubmenuButtonsCategories0Items2Click(Sender: TObject);
    procedure CategoryMenuButtonsCategories0Items3Click(Sender: TObject);
    procedure CategoryMenuButtonsCategories0Items2Click(Sender: TObject);
  private
    procedure CloseSubMenu;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses UnitPedido, UnitCliente, UnitProduto, UnitIngredientes, UnitLanches, uDM;

procedure TFrmPrincipal.btnCloseSubClick(Sender: TObject);
begin
  CloseSubMenu;
end;

procedure TFrmPrincipal.btnMenuClick(Sender: TObject);
begin
  sMenu.Opened := NOT sMenu.Opened;
end;

procedure TFrmPrincipal.CloseSubMenu;
begin
  if sSubMenu.Opened then
  begin
    sSubMenu.Opened := false;
    CategorySubmenuButtons.SelectedItem := nil;
    sMenu.SetFocus;
  end;
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
    lblNome.Caption := TSession.NOME;
    lblEmail.Caption := TSession.EMAIL;
end;

procedure TFrmPrincipal.CategoryMenuButtonsCategories0Items1Click(
  Sender: TObject);
begin
  CloseSubMenu;
  TNavigation.Open(TFrmPedido, FrmPedido, pContainer);
end;

procedure TFrmPrincipal.CategoryMenuButtonsCategories0Items2Click(
  Sender: TObject);
begin
  CloseSubMenu;
  with dm.ppReportCardapio do
  begin
    Print;
  end;
end;

procedure TFrmPrincipal.CategoryMenuButtonsCategories0Items3Click(
  Sender: TObject);
begin
  sSubMenu.Opened := true;
end;

procedure TFrmPrincipal.CategorySubmenuButtonsCategories0Items0Click(
  Sender: TObject);
begin
  CloseSubMenu;
  TNavigation.Open(TFrmCliente, FrmCliente, pContainer);
end;


procedure TFrmPrincipal.CategorySubmenuButtonsCategories0Items1Click(
  Sender: TObject);
begin
  CloseSubMenu;
  TNavigation.Open(TFrmProduto, FrmProduto, pContainer);
end;

procedure TFrmPrincipal.CategorySubmenuButtonsCategories0Items2Click(
  Sender: TObject);
begin
  CloseSubMenu;
  TNavigation.Open(TFrmLanches, FrmLanches, pContainer);
end;

procedure TFrmPrincipal.CategorySubmenuButtonsCategories0Items3Click(
  Sender: TObject);
begin
  CloseSubMenu;
  TNavigation.Open(TFrmIngredientes, FrmIngredientes, pContainer);
end;

procedure TFrmPrincipal.CategoryMenuButtonsCategories0Items5Click(
  Sender: TObject);
begin
  Application.Terminate;
end;


end.
