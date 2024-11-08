unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Phys.FBDef, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.DBCGrids, Vcl.Grids, Vcl.DBGrids,
  Vcl.ValEdit, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdMessage, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdSMTP;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    txtUsuario: TEdit;
    txtSenha: TEdit;
    btnEntrar: TButton;
    btnNovoAcesso: TButton;
    btnRecuperar: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    Edit2: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDQuery2: TFDQuery;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button2: TButton;
    Button3: TButton;
    Label6: TLabel;
    DBGrid2: TDBGrid;
    FDQuery3: TFDQuery;
    DataSource2: TDataSource;
    FDQuery4: TFDQuery;
    DataSource3: TDataSource;
    DBGrid3: TDBGrid;
    Button4: TButton;
    Button5: TButton;
    Label7: TLabel;
    FDQuery5: TFDQuery;
    FDQuery6: TFDQuery;
    FDQuery7: TFDQuery;
    FDQuery8: TFDQuery;
    Edit3: TEdit;
    Label8: TLabel;
    Button6: TButton;
    Label9: TLabel;
    Label10: TLabel;
    FDQuery9: TFDQuery;
    Edit1: TEdit;
    Label11: TLabel;
    procedure btnEntrarClick(Sender: TObject);
    procedure btnNovoAcessoClick(Sender: TObject);
    procedure btnRecuperarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


// -----------------------------------------------------------------------------

var
  Form1: TForm1;
  validador: boolean;

implementation

{$R *.dfm}

procedure ClearPanelData(Panel: TPanel);
var
  I: Integer;
  begin
    for I := 0 to Panel.ControlCount - 1 do
      begin
        if Panel.Controls[I] is TEdit then
          TEdit(Panel.Controls[I]).Text := '' // Limpa o texto dos Edit
        else if Panel.Controls[I] is TComboBox then
          TComboBox(Panel.Controls[I]).ItemIndex := -1; // Reseta a sele��o do ComboBox
      end;
  end;

// ------------------------------ btnEntrar ------------------------------

procedure TForm1.btnEntrarClick(Sender: TObject);
var
  query: string;
  query1: string;

begin
  if (not validador) then
    begin
    btnEntrar.Hint := 'Entrar do sistema';
    btnRecuperar.Caption := 'Recuperar';

    Panel3.Visible := False;
    Panel4.Visible := False;

    ClearPanelData(Panel3);
    ClearPanelData(Panel4);

      if (txtUsuario.Text = '') or (txtSenha.Text = '') then
        begin
          ShowMessage('Preencha os campos Usu�rio e Senha');
          Exit;
        end;

      query := 'SELECT * FROM users WHERE users.user = ''' + txtUsuario.Text + ''' AND users.password = ''' + txtSenha.Text + '''';
      query1 := 'SELECT users.id_user AS "ID", users.name AS "Nome", users.email AS "E-Mail", users.user AS "Usu�rio", CASE WHEN users.user = ''' + txtUsuario.Text + ''' THEN True ELSE NULL END AS "Logado" FROM users ORDER BY id_user ASC';

      FDConnection1.Connected := True;                // Abre a conex�o

      FDQuery1.SQL.Text := query;                     // Estrutura a consulta
      FDQuery1.Open;                                  // Realiza a consulta
      FDQuery2.SQL.Text := query1;                     // Estrutura a consulta
      FDQuery2.Open;                                  // Realiza a consulta

      validador := FDQuery1.Fields[0].AsInteger > 0;  // Obtem o primeiro campo da consulta

      if validador then
        begin
          Edit1.Text := FDQuery1.Fields[0].AsString;
          txtUsuario.Enabled := False;
          txtSenha.Text := '';
          btnEntrar.Caption := 'Sair';
          btnEntrar.Hint := 'Sair do sistema';

          Panel2.Visible := True;
          Panel3.Visible := False;
          Panel4.Visible := False;

          ClearPanelData(Panel2);
          ClearPanelData(Panel3);
          ClearPanelData(Panel4);

          ShowMessage('Bem-Vindo(a), ' + FDQuery1.Fields[1].AsString + '.');
        end

      else
        begin
          Panel2.Visible := False;
          Panel3.Visible := False;
          Panel4.Visible := False;

          ShowMessage('Usu�rio ou senha incorretos');
        end;
    end

  else
    begin
      validador := False;
      txtUsuario.Enabled := True;

      Edit1.Text := '';

      btnEntrar.Caption := 'Entrar';
      btnNovoAcesso.Caption := 'Criar';
      btnRecuperar.Caption := 'Recuperar';

      Panel2.Visible := False;
      Panel3.Visible := False;
      Panel4.Visible := False;

      ClearPanelData(Panel2);
      ClearPanelData(Panel3);
      ClearPanelData(Panel4);

      txtUsuario.Text := txtUsuario.Text;
      txtSenha.Text := '';

      ShowMessage('Volte sempre, ' + FDQuery1.Fields[1].AsString + '.');
      FDConnection1.Connected := False;
    end;
end;

// ------------------------------ btnNovoAcesso ------------------------------

procedure TForm1.btnNovoAcessoClick(Sender: TObject);
var
  query1: string;
  query2: string;
  query3: string;

begin
  query1 := 'SELECT users.id_user AS "ID", users.name AS "Nome", users.email AS "E-Mail", users.user AS "Usu�rio", CASE WHEN users.user = ''' + txtUsuario.Text + ''' THEN True ELSE NULL END AS "Logado" FROM users ORDER BY id_user ASC';
  query2 := 'SELECT groups.id_group AS "ID", groups.description AS "Nome" FROM groups';
  query3 := 'SELECT groups.id_group AS "ID", groups.description AS "Nome" FROM groups WHERE groups.id_group = 0';

  FDQuery3.SQL.Text := query2;                     // Estrutura a consulta
  FDQuery3.Open;                                   // Realiza a consulta
  FDQuery4.SQL.Text := query3;                     // Estrutura a consulta
  FDQuery4.Open;

  if validador then
    begin
      FDQuery2.SQL.Text := query1;                     // Estrutura a consulta
      FDQuery2.Open;                                   // Realiza a consulta
      if Panel2.Visible then
        begin
        Panel2.Visible := False;
        Panel3.Visible := True;
        Panel4.Visible := False;

        ClearPanelData(Panel2);
        ClearPanelData(Panel3);
        ClearPanelData(Panel4);

        btnEntrar.Caption := 'Sair';
        btnNovoAcesso.Caption := 'Listar';
        btnRecuperar.Caption := 'Recuperar';
        btnNovoAcesso.Hint := 'Listar todos os usu�rios';

        Edit4.SetFocus;
      end

      else if Panel4.Visible then
        begin
        Panel2.Visible := False;
        Panel3.Visible := True;
        Panel4.Visible := False;

        ClearPanelData(Panel2);
        ClearPanelData(Panel3);
        ClearPanelData(Panel4);

        btnEntrar.Caption := 'Sair';
        btnNovoAcesso.Caption := 'Listar';
        btnRecuperar.Caption := 'Recuperar';
        btnNovoAcesso.Hint := 'Listar todos os usu�rios';

        Edit4.SetFocus;
      end

      else
        begin
          Panel2.Visible := True;
          Panel3.Visible := False;
          Panel4.Visible := False;

          ClearPanelData(Panel2);
          ClearPanelData(Panel3);
          ClearPanelData(Panel4);

          btnEntrar.Caption := 'Sair';
          btnNovoAcesso.Caption := 'Criar';
          btnRecuperar.Caption := 'Recuperar';
          btnNovoAcesso.Hint := 'Criar novo usu�rio';
        end;
  end

  else
    begin
      ShowMessage('Voc� precisa estar logado para criar novos usu�rios');

      Panel2.Visible := False;
      Panel3.Visible := False;
      Panel4.Visible := Panel4.Visible;

      ClearPanelData(Panel2);
      ClearPanelData(Panel3);

      if not Panel4.Visible then
        begin
          ClearPanelData(Panel4);
          btnRecuperar.Caption := 'Recuperar';
        end;

      btnEntrar.Caption := 'Entrar';
      btnNovoAcesso.Caption := 'Criar';
    end;
end;

// ------------------------------ btnRecuperar -------------------------------

procedure TForm1.btnRecuperarClick(Sender: TObject);
var
  query1: string;

begin
  Panel2.Visible := False;
  Panel3.Visible := False;
  Panel4.Visible := not Panel4.Visible;

  ClearPanelData(Panel2);
  ClearPanelData(Panel3);
  ClearPanelData(Panel4);

  btnNovoAcesso.Caption := 'Criar';

  if Panel4.Visible then
    begin
      btnRecuperar.Caption := 'Fechar';
      btnRecuperar.Hint := 'Fechar janela de recupera��o';
    end

  else
    begin
      btnRecuperar.Caption := 'Recuperar';
      btnRecuperar.Hint := 'Recuperar acesso � conta';
    end;

  if validador then
    begin
      Panel2.Visible := not Panel4.Visible;
      query1 := 'SELECT users.id_user AS "ID", users.name AS "Nome", users.email AS "E-Mail", users.user AS "Usu�rio", CASE WHEN users.user = ''' + txtUsuario.Text + ''' THEN True ELSE NULL END AS "Logado" FROM users ORDER BY id_user ASC';
      FDQuery2.SQL.Text := query1;                     // Estrutura a consulta
      FDQuery2.Open;                                   // Realiza a consulta
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  query1: string;
  query2: string;
  query3: string;
  query7: string;
  query8: string;
  resposta: integer;
  sugestao: string;

  begin
    if (Edit4.Text = '') or (Edit6.Text = '') or (Edit7.Text = '') then
      begin
        ShowMessage('Preencha os campos Nome, Usu�rio e Senha para continuar');
      end
    else
      begin
        if (Edit2.Text = '') then
        begin
          resposta := MessageBox(Handle, 'Deseja continuar com a inser��o deste usu�rio?', 'Confirma��o', MB_YESNO + MB_ICONQUESTION);
            if Resposta = mrYes then
              begin
                query7 := 'INSERT INTO users(name, email, "user", password) VALUES(''' + Edit4.Text + ''',''' + Edit5.Text + ''',''' + Edit6.Text + ''',''' + Edit7.Text + ''')';
                query8 := 'SELECT COUNT(*) FROM users WHERE users.user = ''' + Edit6.Text + '''';

                FDQuery8.SQL.Text := query8;

                FDQuery8.Open;

                if FDQuery8.Fields[0].AsInteger > 0 then
                  begin
                    ShowMessage('O usu�rio ' + Edit6.Text + ' j� est� em uso! Por gentileza, tente outro.');
                    Exit;
                  end
                else
                  begin
                    FDQuery8.SQL.Text := query7;

                    // ShowMessage(query7);

                    FDQuery8.ExecSQL;
                  
                    ShowMessage('Usu�rio inserido com sucesso!');
                  end;
              end

            else
              begin
                Exit;
              end;
        end

        else
          begin

            if Edit7.Text <> '*****' then
              begin
                  query7 := 'UPDATE users SET name = ''' + Edit4.Text + ''', email = ''' + Edit5.Text + ''', "user" = ''' + Edit6.Text + ''', password = ''' + Edit7.Text + ''' WHERE id_user = ' + Edit2.Text;
              end

            else
              begin
                query7 := 'UPDATE users SET name = ''' + Edit4.Text + ''', email = ''' + Edit5.Text + ''', "user" = ''' + Edit6.Text + ''' WHERE id_user = ' + Edit2.Text;
              end;

            FDQuery8.SQL.Text := query7;
            FDQuery8.ExecSQL;

            ShowMessage('Usu�rio atualizado com sucesso!');
          end;

        query1 := 'SELECT users.id_user AS "ID", users.name AS "Nome", users.email AS "E-Mail", users.user AS "Usu�rio", CASE WHEN users.user = ''' + txtUsuario.Text + ''' THEN True ELSE NULL END AS "Logado" FROM users ORDER BY id_user ASC';
        query2 := 'SELECT groups.id_group AS "ID", groups.description AS "Nome" FROM groups';
        query3 := 'SELECT groups.id_group AS "ID", groups.description AS "Nome" FROM groups WHERE groups.id_group = 0';

        FDQuery2.SQL.Text := query1;                     // Estrutura a consulta
        FDQuery2.Open;                                   // Realiza a consulta
        FDQuery3.SQL.Text := query2;                     // Estrutura a consulta
        FDQuery3.Open;                                   // Realiza a consulta
        FDQuery4.SQL.Text := query3;                     // Estrutura a consulta
        FDQuery4.Open;

        ClearPanelData(Panel3);
        Edit4.SetFocus;
      end;
      
  end;

procedure TForm1.Button2Click(Sender: TObject);
var
  query1: string;
  query2: string;
  query3: string;
  query4: string;
  query5: string;
  query6: string;
  resposta: integer;

begin
  query1 := 'SELECT users.id_user AS "ID", users.name AS "Nome", users.email AS "E-Mail", users.user AS "Usu�rio", CASE WHEN users.user = ''' + txtUsuario.Text + ''' THEN True ELSE NULL END AS "Logado" FROM users ORDER BY id_user ASC';
  query2 := 'SELECT groups.id_group AS "ID", groups.description AS "Nome" FROM groups';
  query3 := 'SELECT groups.id_group AS "ID", groups.description AS "Nome" FROM groups WHERE groups.id_group = 99';
  query4 := 'DELETE FROM users_groups WHERE id_user = ' + Edit2.Text;
  query5 := 'DELETE FROM users WHERE id_user = ' + Edit2.Text;
  query6 := 'SELECT COUNT(*) FROM users INNER JOIN users_groups ON users.id_user = users_groups.id_user WHERE users_groups.id_group = 1 AND users.id_user =' + Edit2.Text;

  FDQuery5.SQL.Text := query4;
  FDQuery6.SQL.Text := query5;
  FDQuery7.SQL.Text := query6;

  FDQuery7.Open;                                  // Realiza a consulta

    begin
      if (Edit2.Text = '') then
        begin
          ShowMessage('Verifique e tente novamente');
        end

      else
        begin
        if(Edit2.Text <> '1') then
          begin
            resposta := MessageBox(Handle, 'Voc� tem certeza que deseja remover este usu�rio?', 'Confirma��o', MB_YESNO + MB_ICONQUESTION);
            if Resposta = mrYes then
              begin
                FDQuery5.ExecSQL;
                FDQuery6.ExecSQL;

                ShowMessage('Usu�rio removido com sucesso!');

                if Edit1.Text = Edit2.Text then
                  begin
                    validador := False;
                    txtUsuario.Enabled := True;

                    Edit1.Text := '';

                    btnEntrar.Caption := 'Entrar';
                    btnNovoAcesso.Caption := 'Criar';
                    btnRecuperar.Caption := 'Recuperar';

                    Panel2.Visible := False;
                    Panel3.Visible := False;
                    Panel4.Visible := False;

                    ClearPanelData(Panel2);
                    ClearPanelData(Panel3);
                    ClearPanelData(Panel4);

                    txtUsuario.Text := txtUsuario.Text;
                    txtSenha.Text := '';

                    FDConnection1.Connected := False;
                  end

                  else
                    begin

                    end;
                  ClearPanelData(Panel3);
              end

            else
              begin
                ShowMessage('Remo��o cancelada.');
              end;
          end

        else
          begin
            ShowMessage('N�o � poss�vel excluir a conta Master');
          end;
        end;
    end;

  FDQuery2.SQL.Text := query1;                     // Estrutura a consulta
  FDQuery2.Open;                                   // Realiza a consulta
  FDQuery3.SQL.Text := query2;                     // Estrutura a consulta
  FDQuery3.Open;                                   // Realiza a consulta
  FDQuery4.SQL.Text := query3;                     // Estrutura a consulta
  FDQuery4.Open;

  ClearPanelData(Panel3);
  end;

procedure TForm1.Button3Click(Sender: TObject);
var
  query2: string;
  query3: string;
begin
  ClearPanelData(Panel3);

  Edit4.SetFocus;

  query2 := 'SELECT groups.id_group AS "ID", groups.description AS "Nome" FROM groups';
  query3 := 'SELECT groups.id_group AS "ID", groups.description AS "Nome" FROM groups WHERE groups.id_group = 99';

  FDQuery3.SQL.Text := query2;                     // Estrutura a consulta
  FDQuery3.Open;                                  // Realiza a consulta
  FDQuery4.SQL.Text := query3;                     // Estrutura a consulta
  FDQuery4.Open;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  query2: string;
  query3: string;
  query4: string;
  
begin
  if (Edit2.Text = '') then
    begin
      ShowMessage('Salve e tente novamente');
    end
  else
    begin
      query2 := 'SELECT g.id_group AS "ID", g.description AS "Nome" FROM groups g LEFT JOIN users_groups ug ON g.id_group = ug.id_group AND ug.id_user = ' + FDQuery2.FieldByName('ID').AsString + 'WHERE ug.id_group IS NULL;';
      query3 := 'SELECT g.id_group AS "ID", g.description AS "Nome" FROM groups g INNER JOIN users_groups ug ON g.id_group = ug.id_group WHERE ug.id_user =' + FDQuery2.FieldByName('ID').AsString;

      if (FDQuery3.FieldByName('ID').AsString = '') then
        begin
          ShowMessage('Selecione um grupo e tente novamente');
        end
      else
        begin
          query4 := 'INSERT INTO users_groups(id_user, id_group) VALUES (' + Edit2.Text + ',' + FDQuery3.FieldByName('ID').AsString + ')';
          FDQuery5.SQL.Text := query4;
          FDQuery5.ExecSQL;
          // ShowMessage('Usu�rio adicionado ao grupo com sucesso!');
        end;

      FDQuery3.SQL.Text := query2;                     // Estrutura a consulta
      FDQuery3.Open;                                  // Realiza a consulta
      FDQuery4.SQL.Text := query3;                     // Estrutura a consulta
      FDQuery4.Open;
    end;
  end;

procedure TForm1.Button5Click(Sender: TObject);
var
  query2: string;
  query3: string;
  query4: string;
  
begin
  if (Edit2.Text = '') then
    begin
      ShowMessage('Selecione um usu�rio e tente novamente');
    end
  else
    begin
      query2 := 'SELECT g.id_group AS "ID", g.description AS "Nome" FROM groups g LEFT JOIN users_groups ug ON g.id_group = ug.id_group AND ug.id_user = ' + FDQuery2.FieldByName('ID').AsString + 'WHERE ug.id_group IS NULL;';
      query3 := 'SELECT g.id_group AS "ID", g.description AS "Nome" FROM groups g INNER JOIN users_groups ug ON g.id_group = ug.id_group WHERE ug.id_user =' + FDQuery2.FieldByName('ID').AsString;
      query4 := 'DELETE FROM users_groups WHERE id_user = ' + Edit2.Text + ' AND id_group = ' + FDQuery4.FieldByName('ID').AsString;

      FDQuery5.SQL.Text := query4;
  
      if (FDQuery4.FieldByName('ID').AsString = '') then
        begin
          ShowMessage('Selecione um grupo e tente novamente');
        end

      else
        begin
          if (StrToIntDef(Edit2.Text, 0) = 1) then
          begin
            if (FDQuery4.FieldByName('Nome').AsString = 'Administrator') then
              begin
                ShowMessage('Voc� n�o pode remover o usu�rio Master do grupo '+ (FDQuery4.FieldByName('Nome').AsString));
                Exit;
              end
            else
              begin
                FDQuery5.ExecSQL;
              end;
          end
          else
            begin
              FDQuery5.ExecSQL;
            end;
          // ShowMessage('Usu�rio removido do grupo com sucesso!');
        end;

      FDQuery3.SQL.Text := query2;                     // Estrutura a consulta
      FDQuery3.Open;                                  // Realiza a consulta
      FDQuery4.SQL.Text := query3;                     // Estrutura a consulta
      FDQuery4.Open;
    end;
  end;

procedure TForm1.Button6Click(Sender: TObject);
var
  query9: string;

begin
  if(Edit3.Text = '') then
    begin
      ShowMessage('Preencha o campo E-Mail');
    end

  else
    begin
      query9 := 'SELECT users.email FROM users WHERE users.email = ''' + Edit3.Text + '''';

      FDQuery9.SQL.Text := query9;
      FDQuery9.Open;

      {if FDQuery9.Fields[0].AsString <> '' then
              begin
                        IdSMTP1.Host := 'smtp.gmail.com'; // your SMTP server
                                  IdSMTP1.Port := 587; // port for TLS          IdSMTP1.Username := 'dev.joao.quaresma@gmail.com'; // your email          IdSMTP1.Password := ''; // your email password          IdSMTP1.UseTLS := utUseExplicitTLS; // for TLS

                                            IdMessage1.Recipients.EMailAddresses := Edit5.Text; // recipient email
                                                      IdMessage1.From.Address := 'dev.joao.quaresma@gmail.com'; // sender email          IdMessage1.From.Name := 'Controle de Usu�rios'; // sender name          IdMessage1.Subject := 'Recupera��o de Conta'; // email subject          IdMessage1.Body.Text := 'Ol�, mundo!'; // email body

                                                                IdSMTP1.Connect;
                                                                          try            IdSMTP1.Send(IdMessage1);            ShowMessage('Email enviado!');          finally            IdSMTP1.Disconnect;          end;        end
                                                                                else
                                                                                        begin
                                                                                                  ShowMessage('N�o h� contas com esse endere�o de e-mail cadastrado');
                                                                                                          end;}
    end;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
var
  query2: string;
  query3: string;

begin
  Panel2.Visible := False;
  Panel3.Visible := True;
  Panel4.Visible := False;

  ClearPanelData(Panel2);
  ClearPanelData(Panel3);
  ClearPanelData(Panel4);

  query2 := 'SELECT g.id_group AS "ID", g.description AS "Nome" FROM groups g LEFT JOIN users_groups ug ON g.id_group = ug.id_group AND ug.id_user = ' + FDQuery2.FieldByName('ID').AsString + 'WHERE ug.id_group IS NULL;';
  query3 := 'SELECT g.id_group AS "ID", g.description AS "Nome" FROM groups g INNER JOIN users_groups ug ON g.id_group = ug.id_group WHERE ug.id_user =' + FDQuery2.FieldByName('ID').AsString;

  FDQuery3.SQL.Text := query2;                     // Estrutura a consulta
  FDQuery3.Open;                                   // Realiza a consulta
  FDQuery4.SQL.Text := query3;                     // Estrutura a consulta
  FDQuery4.Open;

  Edit2.Text := FDQuery2.FieldByName('ID').AsString;
  Edit4.Text := FDQuery2.FieldByName('Nome').AsString;
  Edit5.Text := FDQuery2.FieldByName('E-Mail').AsString;
  Edit6.Text := FDQuery2.FieldByName('Usu�rio').AsString;
  Edit7.Text := '*****';

  btnNovoAcesso.Caption := 'Listar';
end;
end.
