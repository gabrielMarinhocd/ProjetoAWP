<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.FuncionarioDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
    try {
        FuncionarioDAO fDAO = new FuncionarioDAO();
        lista = fDAO.listar();
    } catch (Exception e) {
         out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde ate 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/acesso_restrito.jsp';"
                + "        </script>");
         response.sendRedirect("login.jsp");
    }
%>
<html>
    <head>
        <link href="css/form_table.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(nome, id) {
                if (confirm("Tem certeza que deseja desativar o funcionario:" + nome + "?")) {
                    window.open("desativar_funcionario.do?id=" + id, "_self");
                }
            }
        </script>
        <script>
            $('#myModal').on('shown.bs.modal', function () {
                $('#myInput').trigger('focus')
            })
        </script>
        <%@include file="link_inicio.jsp" %>
    </head>
    <body>
        <%@include file="banner.jsp" %>
        <div class="container container-padrao">
           <h2 class="titulo-tabela">Lista de Funcionarios 
               <span>
                   <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Novo</button>
               </span>
              </h2>
            <hr>
           
            <div class="table-responsive-lg table-hover">
                <table class="table" id="table">
                <tr>
                    <th>Nome</th>
                    <th>Perfil</th>
                    <th>Situação</th>
                    <th>Opções</th>
                </tr>
                <%for (Funcionario f : lista) {
                        if (f.getPerfil().getNome().equals("admin")) {

                        } else {
                %>
                <tr>
                    <td><%=f.getNome()%></td>
                    <td><%=f.getPerfil().getNome()%></td>
                    <td><%=f.getSituacao()%> </td>
                    <td>
                        <a data-toggle="modal" data-target="#alterar<%=f.getId()%>" data-whatever="@mdo" ><img src="imagens/icones/lapis_preto.png" /></a> 

                        <div class="modal fade" id="alterar<%=f.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Alterar Funcionario</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal" name="alterar_funcionario" action="alterar_funcionario.do" method="post">
                                            <div class="form-group">
                                                <input type="hidden" name="id" value="<%=f.getId()%>"/>
                                                <label class="col-md-1 control-label" for="nome">Nome:<h11>*</h11></label>  
                                                <input name="nome" value="<%=f.getNome()%>" type="text" placeholder="Nome" class="form-control input-md" required="">
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-1 control-label" for="login">Login:<h11>*</h11></label>  
                                                <input name="login"  value="<%=f.getLogin()%>" type="text" placeholder="Login" class="form-control input-md" required="">
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-1 control-label" for="senha">Senha:<h11>*</h11></label>  

                                                <input name="senha" value="<%=f.getSenha()%>" type="password" placeholder="Senha" class="form-control input-md" required="">
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 control-label" for="perfil">Perfil <h11>*</h11></label>
                                                <select name="perfil" required class="form-control">
                                                    <% ArrayList<Perfil> lista3 = new ArrayList<Perfil>();
                                                        PerfilDAO pDAO = new PerfilDAO();
                                                        try {
                                                            lista3 = pDAO.listar();
                                                        } catch (Exception e) {
                                                            out.print("Erro:" + e);
                                                        }

                                                        for (Perfil p : lista3) {
                                                            if (p.getNome().equals("admin")) {

                                                            } else {
                                                    %>
                                                    <option value="<%=p.getId()%>"><%=p.getNome()%></option>               
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-primary">Salvar</button> 
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                            </div>    
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>




                        <% if (f.getSituacao().equals("ativo")) {%>
                        <a href="#" onclick="excluir('<%=f.getNome()%>',<%=f.getId()%>)"><img src="imagens/icones/lixeira.png" /></a>
                            <% } else {%>
                        <a href="ativar_funcionario.do?id=<%=f.getId()%>"><button type="button" class="btn btn-primary btn-sm">ativar</button></a>
                        <% } %>
                    </td>
                </tr>            
                <%
                        }
                    }
                %>   
            </table>
            </div>
            
        </div>

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Cadastrar Funcionario</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" name="inserir_funcionario" action="inserir_funcionario.do" method="post">
                            <div class="form-group">
                                <label class="col-md-1 control-label" for="nome">Nome:<h11>*</h11></label>  
                                <input name="nome" type="text" placeholder="Nome" class="form-control input-md" required="">
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label" for="login">Login:<h11>*</h11></label>  
                                <input name="login" type="text" placeholder="Login" class="form-control input-md" required="">
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label" for="senha">Senha:<h11>*</h11></label>  

                                <input name="senha" type="password" placeholder="Senha" class="form-control input-md" required="">
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label" for="perfil">Perfil: <h11>*</h11></label>
                                <select name="perfil" required class="form-control">
                                    <% ArrayList<Perfil> lista1 = new ArrayList<Perfil>();
                                        PerfilDAO pDAO = new PerfilDAO();
                                        try {
                                            lista1 = pDAO.listar();
                                        } catch (Exception e) {
                                            out.print("Erro:" + e);
                                        }

                                        for (Perfil p : lista1) {
                                            if (p.getNome().equals("admin")) {

                                            } else {
                                    %>
                                    <option value="<%=p.getId()%>"><%=p.getNome()%></option>               
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Salvar</button> 
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                            </div>    
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %>
    </body>
</html>
