object Form1: TForm1
  Left = 363
  Top = 148
  Caption = 'Painel de Usu'#225'rios'
  ClientHeight = 441
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 520
    Height = 57
    Align = alTop
    Caption = 'Acesso'
    TabOrder = 0
    ExplicitWidth = 654
    object txtUsuario: TEdit
      Left = 11
      Top = 23
      Width = 126
      Height = 23
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TextHint = 'Usu'#225'rio'
    end
    object txtSenha: TEdit
      Left = 143
      Top = 23
      Width = 126
      Height = 23
      ParentShowHint = False
      PasswordChar = '*'
      ShowHint = True
      TabOrder = 1
      TextHint = 'Senha'
    end
    object btnEntrar: TButton
      Left = 275
      Top = 22
      Width = 72
      Height = 25
      Hint = 'Entrar no sistema'
      Caption = 'Entrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnEntrarClick
    end
    object btnNovoAcesso: TButton
      Left = 351
      Top = 22
      Width = 72
      Height = 25
      Hint = 'Criar novo usu'#225'rio'
      Caption = 'Criar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnNovoAcessoClick
    end
    object btnRecuperar: TButton
      Left = 427
      Top = 22
      Width = 72
      Height = 25
      Hint = 'Recuperar acesso '#224' conta'
      Caption = 'Recuperar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnRecuperarClick
    end
    object Edit1: TEdit
      Left = 240
      Top = 23
      Width = 29
      Height = 23
      TabOrder = 5
      Text = 'Edit1'
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 57
    Width = 520
    Height = 384
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 601
    object Panel4: TPanel
      Left = 7
      Top = 6
      Width = 506
      Height = 371
      TabOrder = 2
      Visible = False
      object Label8: TLabel
        Left = 14
        Top = 56
        Width = 34
        Height = 15
        Caption = 'E-Mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 14
        Top = 18
        Width = 475
        Height = 15
        Alignment = taCenter
        Caption = 
          'Caso o endere'#231'o de e-mail informado abaixo esteja associado a um' +
          'a conta, os detalhes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 14
        Top = 31
        Width = 342
        Height = 15
        Caption = 'para recupera'#231#227'o da conta ser'#225' enviado no correio eletr'#244'nico.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 208
        Top = 166
        Width = 188
        Height = 15
        Caption = 'AINDA N'#195'O EST'#193' FUNCIONANDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit3: TEdit
        Left = 14
        Top = 71
        Width = 400
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'Edit3'
        TextHint = '--@--.com'
      end
      object Button6: TButton
        Left = 420
        Top = 71
        Width = 72
        Height = 23
        Hint = 'Enviar senha no e-mail'
        Caption = 'Enviar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = Button6Click
      end
    end
    object Panel3: TPanel
      Left = 7
      Top = 6
      Width = 506
      Height = 371
      TabOrder = 1
      Visible = False
      object Label1: TLabel
        Left = 14
        Top = 8
        Width = 13
        Height = 15
        Caption = 'ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 134
        Top = 8
        Width = 34
        Height = 15
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 14
        Top = 53
        Width = 34
        Height = 15
        Caption = 'E-Mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 14
        Top = 100
        Width = 42
        Height = 15
        Caption = 'Usu'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 257
        Top = 100
        Width = 34
        Height = 15
        Caption = 'Senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 14
        Top = 145
        Width = 40
        Height = 15
        Caption = 'Grupos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 275
        Top = 145
        Width = 146
        Height = 15
        Caption = 'Grupos aos quais pertence'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit2: TEdit
        Left = 14
        Top = 24
        Width = 105
        Height = 23
        Color = clKhaki
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        Text = 'Edit2'
        TextHint = '--'
      end
      object Edit4: TEdit
        Left = 134
        Top = 24
        Width = 358
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Text = 'Edit4'
        TextHint = '--'
      end
      object Edit5: TEdit
        Left = 14
        Top = 71
        Width = 478
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = 'Edit5'
        TextHint = '--@--.com'
      end
      object Edit6: TEdit
        Left = 14
        Top = 116
        Width = 235
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Text = 'Edit6'
        TextHint = '--'
      end
      object Edit7: TEdit
        Left = 257
        Top = 116
        Width = 235
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        PasswordChar = '*'
        ShowHint = True
        TabOrder = 4
        Text = 'Edit7'
        TextHint = '*****'
      end
      object Button1: TButton
        Left = 430
        Top = 318
        Width = 45
        Height = 41
        Hint = 'Salvar/Inserir'
        Caption = 'S/I'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 379
        Top = 318
        Width = 45
        Height = 41
        Hint = 'Excluir'
        Caption = 'E'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 328
        Top = 318
        Width = 45
        Height = 41
        Hint = 'Limpar'
        Caption = 'L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = Button3Click
      end
      object DBGrid2: TDBGrid
        Left = 14
        Top = 166
        Width = 217
        Height = 139
        DataSource = DataSource2
        DrawingStyle = gdsGradient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        OnDblClick = DBGrid1DblClick
      end
      object DBGrid3: TDBGrid
        Left = 275
        Top = 166
        Width = 217
        Height = 139
        DataSource = DataSource3
        DrawingStyle = gdsGradient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        OnDblClick = DBGrid1DblClick
      end
      object Button4: TButton
        Left = 237
        Top = 207
        Width = 31
        Height = 27
        Hint = 'Limpar'
        Caption = '>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 237
        Top = 240
        Width = 31
        Height = 27
        Hint = 'Limpar'
        Caption = '<'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = Button5Click
      end
    end
    object Panel2: TPanel
      Left = 7
      Top = 6
      Width = 506
      Height = 371
      TabOrder = 0
      Visible = False
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 505
        Height = 369
        DataSource = DataSource1
        DrawingStyle = gdsGradient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        OnDblClick = DBGrid1DblClick
      end
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=learningDelphi'
      'User_Name=postgres'
      'Password=EC8d@731ca'
      'DriverID=PG')
    Left = 23
    Top = 383
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 151
    Top = 383
  end
  object DataSource1: TDataSource
    DataSet = FDQuery2
    Left = 55
    Top = 383
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      #39'SELECT users.id_user AS "ID", '#39' +'
      '         '#39'users.name AS "Nome", '#39' +'
      '         '#39'users.email AS "E-Mail", '#39' +'
      '         '#39'users.user AS "Usu'#225'rio", '#39' +'
      
        '         '#39'CASE WHEN users.user = '#39#39#39' + txtUsuario.Text + '#39#39#39' THE' +
        'N True ELSE NULL END AS "Logado" '#39' +'
      '         '#39'FROM users '#39' +'
      '         '#39'WHERE users.user = '#39#39#39' + txtUsuario.Text + '#39#39#39' '#39' +'
      '         '#39'AND users.password = '#39#39#39' + txtSenha.Text + '#39#39#39' '#39' +'
      '         '#39'ORDER BY users.id_user ASC'#39';')
    Left = 183
    Top = 383
  end
  object FDQuery3: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '')
    Left = 215
    Top = 383
  end
  object DataSource2: TDataSource
    DataSet = FDQuery3
    Left = 87
    Top = 383
  end
  object FDQuery4: TFDQuery
    Connection = FDConnection1
    Left = 247
    Top = 383
  end
  object DataSource3: TDataSource
    DataSet = FDQuery4
    Left = 119
    Top = 383
  end
  object FDQuery5: TFDQuery
    Connection = FDConnection1
    Left = 279
    Top = 383
  end
  object FDQuery6: TFDQuery
    Connection = FDConnection1
    Left = 311
    Top = 383
  end
  object FDQuery7: TFDQuery
    Connection = FDConnection1
    Left = 343
    Top = 383
  end
  object FDQuery8: TFDQuery
    Connection = FDConnection1
    Left = 375
    Top = 383
  end
  object FDQuery9: TFDQuery
    Connection = FDConnection1
    Left = 407
    Top = 383
  end
end
