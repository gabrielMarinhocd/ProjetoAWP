<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    ArrayList<Cliente> lista = new ArrayList<Cliente>();
    try {
        
        ClienteDAO cDAO = new ClienteDAO();
        lista = cDAO.listar();
    } catch (Exception e) {
        out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde ate 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/acesso_restrito.jsp';"
                + "        </script>");
    }
%>
<html>
    <head>
        <script type="text/javascript">
            function excluir(nome, id) {
                if (confirm("Tem certeza que deseja excluir o cliente: " + nome + "?")) {
                    window.open("desativar_cliente.do?id=" + id, "_self");
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
        <div class="container container-padrao" >
            <h3 >Lista de Clientes</h3>
            <hr />
            <div class="table-responsive-lg table-hover">
                    <table class="table table-hover table-responsive-lg" >
                <tr>
                    <th>CPF/CNPJ</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Telefone</th>
                    <th>Celular</th>
                    <th>Situação</th>
                    <th>Opções</th>

                </tr>
                <%for (Cliente c : lista) {
                %>
                <tr  >
                    <td><%=c.getCpfCnpj()%></td>
                    <td><%=c.getNome()%></td>
                    <td><%=c.geteMail()%></td>
                    <td><%=c.getTelefone()%></td>
                    <td><%=c.getCelular()%></td>
                    <td><%=c.getSituacao()%></td>
                    <td>
                        <a data-toggle="modal" data-target="#alterar<%=c.getId()%>" data-whatever="@mdo"><img src="imagens/icones/lapis_preto.png" /></a> 
                        <div class="modal fade" id="alterar<%=c.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Alterar Cliente</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal" name="alterar_cliente" action="alterar_cliente.do" method="post">
                                            <div class="form-group" >
                                                <input type="hidden" value="<%=c.getId()%>" name="id"/>
                                                <input type="hidden" value="<%=c.getCpfCnpj()%>" name="cpfCnpj"/>
                                                <label class="col-md-4 control-label" for="CPF" >CPF/CNPJ: <h11>*</h11></label> <%=c.getCpfCnpj()%> 
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-1 control-label" for="nome">Nome:<h11>*</h11></label>  
                                                <input name="nome" type="text" value="<%=c.getNome()%>" placeholder="Nome" class="form-control input-md" required="">
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="e-mail">E-mail:<h11>*</h11></label>  
                                                <input name="eMail" type="email" value="<%=c.geteMail()%>" placeholder="E-mail" class="form-control input-md" required="">
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-1 control-label" for="telefone">Telefone:<h11>*</h11></label>  
                                                <input name="telefone" type="text" value="<%= c.getTelefone()%>" placeholder="Telefone" class="form-control input-md" required="">
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-1 control-label" for="semha">Senha:<h11>*</h11></label>  
                                                <input name="senha" type="password" value="<%= c.getSenha()%>" placeholder="Senha" class="form-control input-md" required="">
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-1 control-label" for="telefone">Celular:<h11>*</h11></label>  
                                                <input name="celular" type="text" value="<%= c.getCelular()%>" placeholder="Celular" class="form-control input-md" required="">
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-1 control-label" for="situacao">Situação:<h11>*</h11></label>  
                                                <select name="situacao" size="1" required class="form-control input-md">
                                                    <option value="<%= c.getSituacao()%>"><%=c.getSituacao()%></option>
                                                    <option value="desativado">Desativar</option>
                                                    <option value="ativo">Ativar</option>
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
                        <a href="listar_pedido_cliente_fc.jsp?id=<%=c.getId()%>"><img src="imagens/icones/menu.png"/></a>
                            <% if (c.getSituacao().equals("ativo")) {%>
                        <a href="#" onclick="excluir('<%=c.getNome()%>',<%= c.getId()%>)"><img src="imagens/icones/lixeira.png" /></a></td></  td>
                            <% } else {%>
                <a href="ativar_cliente.do?id=<%=c.getId()%>"><button type="button" class="btn btn-primary btn-sm">ok</button></a>
                <% } %>
                </tr>            
                <%
                    }
                %>   
            </table>
            </div>
            
        </div>
        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %>
    </body>
</html>
