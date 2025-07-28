unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Loading, Vcl.Session;

type
  TFrmLogin = class(TForm)
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    edtEmail: TEdit;
    edtSenha: TEdit;
    btnAcessar: TSpeedButton;
    Label1: TLabel;
    procedure btnAcessarClick(Sender: TObject);
    procedure edtEmailKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    procedure TerminateLogin(Sender: TObject);

  public
    { Public declarations }
    acesso: Boolean;
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses UnitPrincipal, uDM;

procedure TFrmLogin.edtEmailKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrmLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    if (edtEmail.Text <> EmptyStr) and (edtSenha.Text <> EmptyStr)then
      btnAcessarClick(Sender);
  end;
end;

procedure TFrmLogin.TerminateLogin(Sender: TObject);
begin
  TLoading.Hide;

  if Sender is TThread then
    if Assigned(TThread(Sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(sender).FatalException).Message);
      Exit;
    end;
end;

procedure TFrmLogin.btnAcessarClick(Sender: TObject);
begin
  TLoading.Show(Self);

  with dm.qryLogin do
  begin
    Close;
    Params.ParamByName('email').AsString := edtEmail.Text;
    Params.ParamByName('senha').AsString := edtSenha.Text;
    Open;

    acesso := not IsEmpty ;

    TLoading.Hide;

    if acesso then
    begin
      TSession.ID_USUARIO := 1;
      TSession.EMAIL := dm.qryLoginemail.AsString;
      TSession.NOME  := dm.qryLoginnome.AsString;

      if not Assigned(FrmPrincipal) then
        Application.CreateForm(TFrmPrincipal, FrmPrincipal);

      Self.Hide;
      FrmPrincipal.Show;
    end else begin
      Application.MessageBox('Usuario ou senha inválido.', 'Atenção', MB_ICONWARNING);
    end;
  end;
end;

end.
