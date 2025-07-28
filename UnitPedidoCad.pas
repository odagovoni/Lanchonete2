unit UnitPedidoCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Navigation, Data.DB, Vcl.Mask, Vcl.DBCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData,
  cxButtonEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, System.ImageList,
  Vcl.ImgList, Datasnap.DBClient;

type
  TFrmPedidoCad = class(TForm)
    lblTitulo: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    Label2: TLabel;
    dbCodCli: TDBEdit;
    dsPedido: TDataSource;
    edtNomeCliente: TEdit;
    btnBuscaCli: TSpeedButton;
    Label1: TLabel;
    dbeIDLanche: TDBEdit;
    edtDescrlanche: TEdit;
    btnBuscaItens: TSpeedButton;
    cxgrdItensPedido: TcxGrid;
    cxgrtbvwItensPedido: TcxGridDBTableView;
    cxgrdlvlItensPedido: TcxGridLevel;
    dsItens: TDataSource;
    edtValor: TEdit;
    cxgrtbvwItensPedidototal: TcxGridDBColumn;
    cxgrtbvwItensPedidovalor_total_lanche: TcxGridDBColumn;
    cxgrtbvwItensPedidodescricao_lanche: TcxGridDBColumn;
    cxgrtbvwItensPedidoquantidade: TcxGridDBColumn;
    bvlItens: TBevel;
    Label3: TLabel;
    cxgrtbvwItensPedidoColumn1: TcxGridDBColumn;
    ImageList1: TImageList;
    cdsItensTemp: TClientDataSet;
    cdsItensTempidpedido: TIntegerField;
    cdsItensTempiditem: TIntegerField;
    cdsItensTempdescricao_lanche: TStringField;
    cdsItensTempquantidade: TFMTBCDField;
    cdsItensTempvalor_unit: TFMTBCDField;
    cdsItensTempvalor_total_lanche: TFMTBCDField;
    cdsItensTempid_lanche: TIntegerField;
    cdsIngredientesTMP: TClientDataSet;
    cdsIngredientesTMPid_Ingrediente: TIntegerField;
    cdsIngredientesTMPqtde: TIntegerField;
    cdsIngredientesTMPdescricao: TStringField;
    cdsIngredientesTMPunitario: TFMTBCDField;
    cdsIngredientesTMPtotal: TFMTBCDField;
    cdsIngredientesTMPtotal_geral: TAggregateField;
    cdsIngredientesTMPid_lanche: TIntegerField;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnBuscaCliClick(Sender: TObject);
    procedure btnBuscaItensClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsItensDataChange(Sender: TObject; Field: TField);
    procedure cxgrtbvwItensPedidoColumn1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    idPedido: integer;
    alteracao: Boolean;
    { Private declarations }

    procedure IncluirDesconto;
  public
    { Public declarations }
  end;

var
  FrmPedidoCad: TFrmPedidoCad;

implementation

{$R *.dfm}

uses uDM, UnitCliente, UnitIngredientes, UnitLanches, UnitLancheCustom;

procedure TFrmPedidoCad.btnBuscaCliClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCliente, FrmCliente);
  try
    with FrmCliente do
    begin
      pnInsert.Visible := false;
      pnAdd.Visible    := true;
      Align            := alCustom;
      Position         := poScreenCenter;
      WindowState      := TWindowState.wsNormal;
    end;

    if FrmCliente.ShowModal = mrOk then
    begin
      dbCodCli.Text       := dm.qryClientesid_clientes.AsString;
      edtNomeCliente.Text := dm.qryClientescliente.AsString;
    end;

  finally
    FreeAndNil(FrmCliente);
  end;
end;

procedure TFrmPedidoCad.btnCancelarClick(Sender: TObject);
begin
  var erro: string;
  dm.DeletePedido(IDPedido, erro);

  TNavigation.Close(Self);
end;

procedure TFrmPedidoCad.btnSalvarClick(Sender: TObject);
begin
  if alteracao then
  begin
    if cdsItensTemp.RecordCount = 0 then
    begin
      Application.MessageBox('É necessário pelo menos um item. Por favor adicione itens ao pedido.', 'Atenção', MB_ICONWARNING);
      Exit;
    end;

    var erro: string;

    dm.DeleteItensPedido(idPedido, 0, erro, true);
    dm.DeleteIngredientesPedido(idPedido, erro);

    //salvar os itens alterados ----
    with cdsItensTemp do
    begin
      First;
      while not Eof do
      begin
        dm.qryPedidosItens.Insert;
        dm.qryPedidosItensid_pedido.AsInteger    := idPedido;
        dm.qryPedidosItenspreco_unitario.AsFloat := cdsItensTempvalor_unit.AsFloat;
        dm.qryPedidosItensid_lanche.AsFloat      := cdsItensTempid_lanche.AsInteger;
        dm.qryPedidosItensquantidade.AsInteger   := cdsItensTempquantidade.AsInteger;
        dm.qryPedidosItens.Post;

        Next;
      end;
    end;

    var idItemPedido: integer;
    if cdsIngredientesTMP.Active then
    begin
      with cdsIngredientesTMP do
      begin
        First;
        while not Eof do
        begin
          with dm.qryPedItensEdit do
          begin
            Close;
            ParamByName('id_pedido').AsInteger := idPedido;
            Open;

            if Locate('id_lanche', cdsIngredientesTMPid_lanche.AsInteger, []) then
              idItemPedido := dm.qryPedItensEditidpedido_itens.AsInteger;
          end;

          with dm.qryPedidoIngredientes do
          begin
            begin
              Close;
              Params[0].AsInteger := idPedido;
              Open;
            end;

            Insert;
            dm.qryPedidoIngredientesid_ingreditente.AsInteger:= cdsIngredientesTMP.FieldByName('id_Ingrediente').AsInteger;
            dm.qryPedidoIngredientesid_lanche.AsInteger      := cdsIngredientesTMPid_lanche.AsInteger;
            dm.qryPedidoIngredientesid_pedido.AsInteger      := IDPedido;
            dm.qryPedidoIngredientesid_item_pedido.AsInteger := idItemPedido;
            dm.qryPedidoIngredientesqtde.AsInteger           := cdsIngredientesTMP.FieldByName('qtde').AsInteger;
            dm.qryPedidoIngredientesvalor_unitario.AsInteger := cdsIngredientesTMP.FieldByName('unitario').AsInteger;
            dm.qryPedidoIngredientesvalor_total.AsInteger    := cdsIngredientesTMP.FieldByName('total').AsInteger;
            Post;
          end;

          Next;
        end
      end;
    end;
  end else begin
    if dm.qryItensPedidoConsulta.RecordCount = 0 then
    begin
      Application.MessageBox('É necessário pelo menos um item. Por favor adicione itens ao pedido.', 'Atenção', MB_ICONWARNING);
      Exit;
    end;
  end;

  dm.qryPedidosConsulta.Refresh;
  dm.qryPedidosConsulta.First;

  TNavigation.Close(Self);
end;

procedure TFrmPedidoCad.cxgrtbvwItensPedidoColumn1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  case AButtonIndex of
    0: cdsItensTemp.Delete;
  end;
end;

procedure TFrmPedidoCad.dsItensDataChange(Sender: TObject; Field: TField);
begin
  edtDescrlanche.Text := dm.qryItensPedidoConsultadescricao_lanche.AsString;
end;

procedure TFrmPedidoCad.FormShow(Sender: TObject);
begin
  if dm.qryPedidos.State = dsInsert then
  begin
    lblTitulo.Caption := 'Novo Pedido';
    dm.AtualizarItensPedido(0);
  end else begin
    idPedido := dm.qryPedidosConsultanumero_pedido.AsInteger;

    lblTitulo.Caption   := 'Alterar Pedido #' + dm.qryPedidosConsultanumero_pedido.AsString;
    edtNomeCliente.Text := dm.qryPedidosConsultacliente.AsString;
    edtValor.Text       := dm.qryPedidosConsultatotal_pedido.AsString;
    alteracao           := true;

    with cdsItensTemp do
    begin
      Close;
      CreateDataSet;
    end;

    with dm.qryItensPedidoConsulta do
    begin
      First;
      while not Eof do
      begin
        cdsItensTemp.Insert;
        cdsItensTempidpedido.AsInteger         :=  dm.qryItensPedidoConsultanumero_pedido.AsInteger;
        cdsItensTempiditem.AsInteger           :=  dm.qryItensPedidoConsultaitem_pedido.AsInteger;
        cdsItensTempid_lanche.AsInteger        :=  dm.qryItensPedidoConsultaid_lanche.AsInteger;
        cdsItensTempdescricao_lanche.AsString  :=  dm.qryItensPedidoConsultadescricao_lanche.AsString;
        cdsItensTempquantidade.AsInteger       :=  dm.qryItensPedidoConsultaquantidade.AsInteger;
        cdsItensTempvalor_unit.AsFloat         :=  dm.qryItensPedidoConsultavalor_unit.AsFloat;
        cdsItensTempvalor_total_lanche.AsFloat :=  dm.qryItensPedidoConsultavalor_total_lanche.AsFloat;

        cdsItensTemp.Post;
        Next;
      end;
    end;

    dsItens.DataSet := cdsItensTemp;
  end;
end;

procedure TFrmPedidoCad.IncluirDesconto;
begin

  dm.qryItensPedidoConsulta.Insert;
end;

procedure TFrmPedidoCad.btnBuscaItensClick(Sender: TObject);
begin
  Application.CreateForm(TFrmLanches, FrmLanches);

  try
    with FrmLanches do
    begin
      pnInsert.Visible := false;
      pnAdd.Visible    := true;
      Align            := alCustom;
      Position         := poScreenCenter;
      WindowState      := TWindowState.wsNormal;
    end;

    if FrmLanches.ShowModal = mrOk then
    begin
      dbeIDLanche.Text    := dm.qryLanchesid_lanche.AsString;
      edtDescrlanche.Text := dm.qryLanchesdescricao_lanche.AsString;

      Application.CreateForm(TFrmLancheCustom, FrmLancheCustom);
      FrmLancheCustom.edtLanche.Text := edtDescrlanche.Text;
      FrmLancheCustom.id_lanche      := dm.qryLanchesid_lanche.AsInteger;

      if dm.qryPedidos.State in [dsInsert, dsEdit] then
        dm.qryPedidos.Post;

      idPedido := dm.qryPedidosid_pedidos.AsInteger;

      var qtde := StrToInt(FrmLanches.edtQtde.Text);

      begin
        if dm.qryLanchestipo_produto.AsString = 'L' then
        begin
          if FrmLancheCustom.ShowModal = mrOk then
          begin
            edtValor.Text := FrmLancheCustom.edtValor.Text;

            var valor := strtofloat(StringReplace(edtValor.Text, 'R$ ', '', [rfReplaceAll]));


            if alteracao then
            begin
              FrmLancheCustom.cdsIngredientesTMP.First;
              while not FrmLancheCustom.cdsIngredientesTMP.eof do
              begin
                if not cdsIngredientesTMP.Active then
                  cdsIngredientesTMP.CreateDataSet;

                cdsIngredientesTMP.Insert;
                cdsIngredientesTMPid_Ingrediente.AsInteger := FrmLancheCustom.cdsIngredientesTMPid_Ingrediente.AsInteger;
                cdsIngredientesTMPqtde.AsInteger           := FrmLancheCustom.cdsIngredientesTMPqtde.AsInteger;
                cdsIngredientesTMPdescricao.AsString       := FrmLancheCustom.cdsIngredientesTMPdescricao.AsString;
                cdsIngredientesTMPunitario.AsFloat         := FrmLancheCustom.cdsIngredientesTMPunitario.AsFloat;
                cdsIngredientesTMPtotal.AsFloat            := FrmLancheCustom.cdsIngredientesTMPtotal.AsFloat;
                //cdsIngredientesTMPtotal_geral.Value        := (cdsIngredientesTMPunitario.AsFloat * cdsIngredientesTMPqtde.AsInteger);
                cdsIngredientesTMPid_lanche.AsInteger      := FrmLancheCustom.cdsIngredientesTMPid_lanche.AsInteger;
                cdsIngredientesTMP.Post;

                FrmLancheCustom.cdsIngredientesTMP.Next;
              end;
            end else begin
              dm.qryPedidosItens.Insert;
              dm.qryPedidosItensid_pedido.AsInteger    := idPedido;
              dm.qryPedidosItenspreco_unitario.AsFloat := valor;
              dm.qryPedidosItensid_lanche.AsFloat      := dm.qryLanchesid_lanche.AsInteger;
              dm.qryPedidosItensquantidade.AsInteger   := qtde;
              dm.qryPedidosItens.Post;

              var idItemPedido := dm.qryPedidosItensidpedido_itens.AsInteger;
              if dm.qryLanchestipo_produto.AsString = 'L' then
                dm.SalvarIngreditentesPedido(FrmLancheCustom.cdsIngredientesTMP, idPedido, idItemPedido, dm.qryLanchesid_lanche.AsInteger);
            end;
          end;

          DM.qryLanches.Close;
        end else begin
          edtValor.Text := 'R$ ' + FormatFloat('#,#.00', dm.qryLanchespreco.Value);

          dm.qryPedidosItens.Insert;
          dm.qryPedidosItensid_pedido.AsInteger    := idPedido;
          dm.qryPedidosItenspreco_unitario.AsFloat := dm.qryLanchespreco.Value;
          dm.qryPedidosItensid_lanche.AsFloat      := dm.qryLanchesid_lanche.AsInteger;
          dm.qryPedidosItensquantidade.AsInteger   := qtde;
          dm.qryPedidosItens.Post;
        end;
      end;

      DM.AtualizarItensPedido(idPedido);
    end;
  finally
    FreeAndNil(FrmLanches);
    edtDescrlanche.Clear;
    edtValor.Clear;
    dbeIDLanche.Clear;
    dsItens.DataSet := dm.qryItensPedidoConsulta;
  end;
end;



end.
