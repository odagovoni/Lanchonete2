unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, ppDB, ppDBPipe, ppBands, ppCache, ppDesignLayer, ppParameter,
  ppCtrls, ppPrnabl, ppVar, Vcl.Imaging.jpeg, raCodMod, ppModule,
  Vcl.Imaging.pngimage, Datasnap.DBClient, Vcl.Forms, Vcl.Dialogs, FileCtrl;

type
  Tdm = class(TDataModule)
    LanchoneteConnection: TFDConnection;
    qryClientes: TFDQuery;
    qryClientesid_clientes: TIntegerField;
    qryClientescliente: TWideStringField;
    qryClientesendereco: TWideStringField;
    qryClientestelefone: TWideStringField;
    qryClientesemail: TWideStringField;
    qryClientesdata_cadastro: TDateTimeField;
    qryClientesativo: TWideStringField;
    qryProduto: TFDQuery;
    qryIngredientes: TFDQuery;
    qryLanches: TFDQuery;
    qryLanchesid_lanche: TFDAutoIncField;
    qryLanchesdescricao_lanche: TWideStringField;
    qryLanchestipo_produto: TWideStringField;
    qryLanchespreco: TFloatField;
    qryLanchespreco_dolar: TFloatField;
    qryLancheIngredientes: TFDQuery;
    qryIngredientesid_ingredientes: TFDAutoIncField;
    qryIngredientesingrediente: TWideStringField;
    qryIngredientesestoque: TFloatField;
    qryIngredientesunidade: TWideStringField;
    qryIngredientesvalor: TBCDField;
    qryIngredientesvalor_dolar: TBCDField;
    qryCardapio: TFDQuery;
    ppReportCardapio: TppReport;
    ppDBPipCardapio: TppDBPipeline;
    dsCardapio: TDataSource;
    ppParameterList1: TppParameterList;
    qryCardapiodescricao_produto: TWideStringField;
    qryCardapiodescricao_ingrediente: TWideStringField;
    qryCardapiovalor_total: TFloatField;
    qryCardapiotipo: TLargeintField;
    qryCardapiodescricao_tipo: TWideStringField;
    qryConfig: TFDQuery;
    qryConfigid_config: TFDAutoIncField;
    qryConfigcaminho_imagens: TWideStringField;
    dsConfig: TDataSource;
    DBPipConfig: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    ppLabel4: TppLabel;
    ppLabel1: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText1: TppDBText;
    ppLine1: TppLine;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape1: TppShape;
    img: TppImage;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    raCodeModule1: TraCodeModule;
    raProgramInfo1: TraProgramInfo;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    qryPedidos: TFDQuery;
    qryPedidosItens: TFDQuery;
    qryPedidosid_pedidos: TFDAutoIncField;
    qryPedidosid_clientes: TIntegerField;
    qryPedidosdata_hora: TDateTimeField;
    qryPedidostotal: TFloatField;
    qryPedidostotal_dolar: TFloatField;
    qryPedidosItensidpedido_itens: TFDAutoIncField;
    qryPedidosItensid_pedido: TIntegerField;
    qryPedidosItensid_lanche: TIntegerField;
    qryPedidosItensquantidade: TIntegerField;
    qryPedidosItenspreco_unitario: TFloatField;
    qryPedidosItenspreco_unitario_dolar: TFloatField;
    qryLancheIngredientesdescricao_lanche: TWideStringField;
    qryLancheIngredientesdescricao_ingrediente: TWideStringField;
    qryLancheIngredientesvalor_total: TFloatField;
    qryIngredientesPorLanche: TFDQuery;
    qryIngredientesPorLanchedescricao_lanche: TWideStringField;
    qryIngredientesPorLancheingrediente: TWideStringField;
    qryIngredientesPorLanchevalor_total: TFloatField;
    qryIngredientesPorLancheid_ingrediente: TIntegerField;
    qryIngredientesPorLanchequantidade: TFloatField;
    qryIngredientesPorLanchevalor: TBCDField;
    qryPedidoIngredientes: TFDQuery;
    ds1: TClientDataSet;
    qryPedidoIngredientesid_ingreditente_pedidos: TFDAutoIncField;
    qryPedidoIngredientesid_ingreditente: TIntegerField;
    qryPedidoIngredientesid_lanche: TIntegerField;
    qryPedidoIngredientesid_pedido: TIntegerField;
    qryPedidoIngredientesid_item_pedido: TIntegerField;
    qryPedidoIngredientesqtde: TIntegerField;
    qryPedidoIngredientesvalor_unitario: TBCDField;
    qryPedidoIngredientesvalor_total: TBCDField;
    qryPedidosConsulta: TFDQuery;
    qryLogin: TFDQuery;
    qryLoginid_usuarios: TIntegerField;
    qryLoginnome: TWideStringField;
    qryLoginlogin: TWideStringField;
    qryLoginsenha: TWideStringField;
    qryLoginemail: TWideStringField;
    qryLogindata_cadastro: TDateTimeField;
    qryLoginadministrador: TWideStringField;
    qryIngredTEMP: TFDQuery;
    qryIngredTEMPid_lanche_ingredientes: TFDAutoIncField;
    qryIngredTEMPid_lanche: TIntegerField;
    qryIngredTEMPid_ingrediente: TIntegerField;
    qryIngredTEMPquantidade: TFloatField;
    qryIngredTEMPsequencia: TIntegerField;
    qryIngredTEMPingrediente: TWideStringField;
    qryIngredTEMPvalor: TBCDField;
    qryItensPedidoConsulta: TFDQuery;
    qryProdutoid_lanche: TFDAutoIncField;
    qryProdutodescricao_lanche: TWideStringField;
    qryProdutotipo_produto: TWideStringField;
    qryProdutopreco: TFloatField;
    qryProdutopreco_dolar: TFloatField;
    qryPedidosConsultanumero_pedido: TFDAutoIncField;
    qryPedidosConsultadata_pedido: TDateTimeField;
    qryPedidosConsultacliente: TWideStringField;
    qryPedidosConsultatotal_pedido: TFloatField;
    qryItensPedidoConsultanumero_pedido: TFDAutoIncField;
    qryItensPedidoConsultadata_pedido: TDateTimeField;
    qryItensPedidoConsultatotal: TFloatField;
    qryItensPedidoConsultacliente: TWideStringField;
    qryItensPedidoConsultaitem_pedido: TIntegerField;
    qryItensPedidoConsultaid_lanche: TIntegerField;
    qryItensPedidoConsultadescricao_lanche: TWideStringField;
    qryItensPedidoConsultaquantidade: TIntegerField;
    qryItensPedidoConsultavalor_total_lanche: TFloatField;
    qryPedItensEdit: TFDQuery;
    qryPedItensEditid_pedido: TIntegerField;
    qryPedItensEditidpedido_itens: TFDAutoIncField;
    qryPedItensEditid_lanche: TIntegerField;
    qryDescontos: TFDQuery;
    qryDescontosid_itens_promo: TFDAutoIncField;
    qryDescontosdescricao_item_promo: TWideStringField;
    qryDescontospercent_desconto: TBCDField;
    qryItensPedidoConsultavalor_unit: TFloatField;
    OpenDialog1: TOpenDialog;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryLanchesAfterScroll(DataSet: TDataSet);
    procedure qryPedidosAfterScroll(DataSet: TDataSet);
    procedure qryPedidosConsultaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExecutaSQL(pSQL: string; var erro: string): boolean;

    function SalvarIngredientes(pIdLanche, pIDIngrediente, pQtde,
      pOrdem: integer; var erro: string): boolean;

    function DeleteIngredientesOld(pIDLanche: integer; var erro: string): boolean;

    procedure SalvarIngreditentesPedido(pCDS: TClientDataSet; pIDPedido, pIDIten, pIDLanche: integer);
    function DeletePedido(pIDPedido: integer; var erro: string): boolean;
    procedure AtualizarItensPedido(pIDPedido: integer);

    function DeleteItensPedido(pIDPedido, pIDItem: integer;
      var erro: string; pTodos: boolean = false): boolean;

    function DeleteIngredientesPedido(pIDPedido: integer;
      var erro: string): boolean;
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
var
  caminho, erro: string;
begin
  LanchoneteConnection.Connected := false;

  caminho := ExtractFilePath(Application.ExeName) + 'db\lanchonete.db';

  LanchoneteConnection.Params.Database := caminho;
  LanchoneteConnection.Connected := true;

  qryConfig.Close;
  qryConfig.Open;

  if qryConfig.IsEmpty then
  begin
    caminho := ExtractFilePath(Application.ExeName) + 'img';

    ExecutaSQL('insert into configuracoes(caminho_imagens) values('+ QuotedStr(caminho)+')', erro);
    {
    if SelectDirectory('Selecione o diretorio das imagens do sistemas.', '', caminho) then
    begin

    end;
    }
  end;
end;

function Tdm.DeleteIngredientesOld(pIDLanche: integer; var erro: string): boolean;
begin
  Result := false;

  var sqldelete := 'delete from lanche_ingredientes where id_lanche = ' + IntToStr(pIdLanche);
  var Qry := TFDQuery.Create(Self);

  try
    with Qry do
    begin
      Connection := LanchoneteConnection;
      Close;
      SQL.Clear;

      try
        ExecSQL(sqldelete);
        Result := true;
      except
        on E: Exception do
        begin
          erro := e.Message;
        end;
      end;
    end;

  finally
    FreeAndNil(Qry);
  end;
end;

function Tdm.DeletePedido(pIDPedido: integer; var erro: string): boolean;
begin
  var sqlpedido:= 'delete from pedidos             where id_pedidos = ' + inttostr(pIDPedido);
  var sqlitens := 'delete from pedido_itens        where id_pedido  = ' + inttostr(pIDPedido);
  var sqlingre := 'delete from pedido_ingredientes where id_pedido  = ' + inttostr(pIDPedido);

  var Qry := TFDQuery.Create(Self);

  try
    with Qry do
    begin
      Connection := LanchoneteConnection;
      Close;
      SQL.Clear;

      try
        Result := ExecSQL(sqlingre) > 0;

        if Result then
        begin
          Close;
          SQL.Clear;
          Result := ExecSQL(sqlitens) > 0;

          if Result then
          begin
            Close;
            SQL.Clear;

            Result := ExecSQL(sqlpedido) > 0;
          end;
        end;
      except on E: Exception do
        erro := e.Message;
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

function Tdm.ExecutaSQL(pSQL: string; var erro: string): boolean;
begin
  Result := false;

  var Qry := TFDQuery.Create(Self);

  try
    with Qry do
    begin
      Connection := LanchoneteConnection;
      Close;
      SQL.Clear;

      try
        ExecSQL(pSQL);
        Result := True;
      except
        on E: Exception do
        erro := e.Message;
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

function Tdm.DeleteIngredientesPedido(pIDPedido: integer;
  var erro: string): boolean;
begin
  Result := false;

  var sqlingre := 'delete from pedido_ingredientes where id_pedido  = ' + inttostr(pIDPedido);

  var Qry := TFDQuery.Create(Self);

  try
    with Qry do
    begin
      Connection := LanchoneteConnection;
      Close;
      SQL.Clear;

      try
        ExecSQL(sqlingre);
        Result := True;
      except
        on E: Exception do
        erro := e.Message;
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

function Tdm.DeleteItensPedido(pIDPedido, pIDItem: integer;
  var erro: string; pTodos: boolean): boolean;
begin
  var sqlitens := 'delete from pedido_itens where id_pedido = ' +
     inttostr(pIDPedido) + ' and idpedido_itens = ' + inttostr(pIDItem);

  if pTodos then
    sqlitens := 'delete from pedido_itens where id_pedido = ' + inttostr(pIDPedido);

  var Qry := TFDQuery.Create(Self);

  try
    with Qry do
    begin
      Connection := LanchoneteConnection;
      Close;
      SQL.Clear;

      try
        Result := ExecSQL(sqlitens) > 0;
      except on E: Exception do
        erro := e.Message;
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

procedure Tdm.qryLanchesAfterScroll(DataSet: TDataSet);
begin
  with qryLancheIngredientes do
  begin
    Close;
    Params[0].AsInteger := qryLanchesid_lanche.AsInteger;
    Open;
  end;
end;

procedure Tdm.qryPedidosAfterScroll(DataSet: TDataSet);
begin
  with qryPedidosItens do
  begin
    Close;
    Params[0].AsInteger := qryPedidosid_pedidos.AsInteger;
    Open;
  end;
end;

procedure Tdm.qryPedidosConsultaAfterScroll(DataSet: TDataSet);
begin
  with qryItensPedidoConsulta do
  begin
    Close;
    Params[0].AsInteger := qryPedidosConsultanumero_pedido.AsInteger;
    Open;
  end;
end;

function Tdm.SalvarIngredientes(pIdLanche, pIDIngrediente, pQtde,
  pOrdem: integer; var erro: string): boolean;
begin
  var ingrediente :=
    'insert into lanche_ingredientes (' +
    'id_lanche, '     +
    'id_ingrediente, '+
    'quantidade, ' +
    'sequencia)' +
    'values('+
    IntToStr(pIdLanche) + ', ' +
    IntToStr(pIDIngrediente) + ', ' +
    IntToStr(pQtde) + ', ' +
    IntToStr(pOrdem) +
    ')';

  var Qry := TFDQuery.Create(Self);
  try
    with Qry do
    begin
      Connection := LanchoneteConnection;
      Close;
      SQL.Clear;

      try
        Result := ExecSQL(ingrediente) > 0;
      except on E: Exception do
        erro := e.Message;
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

procedure Tdm.SalvarIngreditentesPedido(pCDS: TClientDataSet;
  pIDPedido, pIDIten, pIDLanche: integer);
begin
  with pCDS do
  begin
    First;
    while not Eof do
    begin
      with qryPedidoIngredientes do
      begin
        begin
          Close;
          Params[0].AsInteger := pIDPedido;
          Open;
        end;

        Insert;
        qryPedidoIngredientesid_ingreditente.AsInteger:= pcds.FieldByName('id_Ingrediente').AsInteger;
        qryPedidoIngredientesid_lanche.AsInteger      := pIDLanche;
        qryPedidoIngredientesid_pedido.AsInteger      := pIDPedido;
        qryPedidoIngredientesid_item_pedido.AsInteger := pIDIten;
        qryPedidoIngredientesqtde.AsInteger           := pcds.FieldByName('qtde').AsInteger;
        qryPedidoIngredientesvalor_unitario.AsInteger := pcds.FieldByName('unitario').AsInteger;
        qryPedidoIngredientesvalor_total.AsInteger    := pcds.FieldByName('total').AsInteger;
        Post;
      end;

      Next;
    end
  end;
end;

procedure Tdm.AtualizarItensPedido(pIDPedido: integer);
begin
  with qryItensPedidoConsulta do
  begin
    Close;
    Params[0].AsInteger := pIDPedido;
    Open;
  end;
end;

end.
