object FrmIngredientesCad: TFrmIngredientesCad
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Cliente'
  ClientHeight = 384
  ClientWidth = 710
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object lblTitulo: TLabel
    AlignWithMargins = True
    Left = 25
    Top = 7
    Width = 249
    Height = 42
    Margins.Left = 0
    Margins.Top = 15
    Margins.Right = 0
    Margins.Bottom = 15
    AutoSize = False
    Caption = 'Novo Ingrediente'
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
    Left = 27
    Top = 94
    Width = 150
    Height = 18
    Margins.Left = 6
    AutoSize = False
    Caption = 'Descri'#231#227'o do Ingrediente:'
    Font.Charset = ANSI_CHARSET
    Font.Color = 5585461
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    AlignWithMargins = True
    Left = 27
    Top = 183
    Width = 86
    Height = 17
    Margins.Left = 6
    AutoSize = False
    Caption = 'Pre'#231'o Init'#225'rio:'
    Font.Charset = ANSI_CHARSET
    Font.Color = 5585461
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 578
    Top = 313
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
      ExplicitLeft = 80
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 449
    Top = 313
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
      ExplicitLeft = -24
      ExplicitTop = -8
    end
  end
  object DBEdit1: TDBEdit
    Left = 25
    Top = 117
    Width = 664
    Height = 33
    DataField = 'ingrediente'
    DataSource = dsIngrediente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 25
    Top = 204
    Width = 152
    Height = 33
    DataField = 'valor'
    DataSource = dsIngrediente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object dsIngrediente: TDataSource
    DataSet = dm.qryIngredientes
    Left = 448
    Top = 32
  end
end
