object FrmProdutoCad: TFrmProdutoCad
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Cliente'
  ClientHeight = 404
  ClientWidth = 552
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object lblTitulo: TLabel
    AlignWithMargins = True
    Left = 25
    Top = 2
    Width = 249
    Height = 42
    Margins.Left = 0
    Margins.Top = 15
    Margins.Right = 0
    Margins.Bottom = 15
    AutoSize = False
    Caption = 'Novo Produto'
    Font.Charset = ANSI_CHARSET
    Font.Color = 16744448
    Font.Height = -24
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Label2: TLabel
    AlignWithMargins = True
    Left = 25
    Top = 184
    Width = 126
    Height = 13
    Margins.Left = 6
    AutoSize = False
    Caption = 'Descri'#231#227'o do Produto:'
    Font.Charset = ANSI_CHARSET
    Font.Color = 5585461
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    AlignWithMargins = True
    Left = 25
    Top = 251
    Width = 126
    Height = 13
    Margins.Left = 6
    AutoSize = False
    Caption = 'Pre'#231'o:'
    Font.Charset = ANSI_CHARSET
    Font.Color = 5585461
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 413
    Top = 348
    Width = 110
    Height = 40
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 15
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = 14869218
    ParentBackground = False
    TabOrder = 0
    object btnCancelar: TSpeedButton
      Left = 0
      Top = 0
      Width = 110
      Height = 40
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Cancelar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585461
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnCancelarClick
      ExplicitLeft = 1
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 284
    Top = 348
    Width = 110
    Height = 40
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 15
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = 16475988
    ParentBackground = False
    TabOrder = 1
    object btnSalvar: TSpeedButton
      Left = 0
      Top = 0
      Width = 110
      Height = 40
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Salvar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnSalvarClick
      ExplicitLeft = 72
      ExplicitTop = 8
      ExplicitWidth = 23
      ExplicitHeight = 22
    end
  end
  object dbedtdescricao_produto: TDBEdit
    Left = 23
    Top = 203
    Width = 500
    Height = 33
    DataField = 'descricao_lanche'
    DataSource = dsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object dbedtpreco: TDBEdit
    Left = 25
    Top = 270
    Width = 136
    Height = 33
    DataField = 'preco'
    DataSource = dsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object rgTipo: TRadioGroup
    Left = 27
    Top = 56
    Width = 496
    Height = 89
    Caption = 'Tipo de Produto:'
    ItemIndex = 0
    Items.Strings = (
      'Bebida'
      'Por'#231'oes')
    TabOrder = 4
  end
  object dsProdutos: TDataSource
    DataSet = dm.qryProduto
    Left = 472
    Top = 8
  end
end
