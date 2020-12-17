<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Cliente c = new Cliente();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        ClienteDAO cDAO = new ClienteDAO();
        c = cDAO.carregarPorId(id);
    } catch (Exception e) {
        out.print("Erro:" + e);
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="link_inicio.jsp" %>
        <script type="text/javascript">
            $('#myModal').on('shown.bs.modal', function () {
                $('#myInput').trigger('focus')
            })
        </script>
    </head>
    <body>
        <%@include file="banner_cliente.jsp" %>
        <div class="container container-padrao">
            <h2 class="titulo-tabela">Meus dados <span > <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Alterar</button></span></h2>
            <table class="table">
                <tr><th >Nome:</th><td ><%=c.getNome()%></td></tr>
                <tr><th >Cpf/cnpj:</th><td ><%=c.getCpfCnpj()%></td></tr>
                <tr><th >Email:</th><td ><%=c.geteMail()%></td></tr>
                <tr><th >Telefone:</th><td ><%=c.getTelefone()%></td></tr>
                <tr><th >Celular:</th><td ><%=c.getCelular()%></td></tr>
                <tr><th >Situacão:</th><td ><%=c.getSituacao()%></td></tr>
            </table>
        </div>
            <br/>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Alterar Dados</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" name="alterar_meus_dados" action="alterar_meus_dados.do" method="post">
                            <div class="form-group">   
                                <input type="hidden" value="<%=c.getId()%>" name="id"/>
                                 <input type="hidden" value="<%=c.getCpfCnpj()%>" name="cpfCnpj"/>
                                <label class="col-form-label"  for="CPF" >CPF/CNPJ:</label>  <%=c.getCpfCnpj()%>
                            </div>
                            <div class="form-group">
                                <label class="col-form-label"  for="nome">Nome<h11>*</h11></label>  
                                <input name="nome" type="text" value="<%=c.getNome()%>" placeholder="Nome" class="form-control input-md" required="">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label"  for="e-mail">E-mail<h11>*</h11></label>  
                                <input name="eMail" type="email" value="<%=c.geteMail()%>" placeholder="E-mail" class="form-control input-md" required="">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label" for="telefone">Telefone<h11>*</h11></label>  
                                <input name="telefone" type="text" value="<%= c.getTelefone()%>" placeholder="Telefone" class="form-control input-md" required="">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label"  for="semha">Senha<h11>*</h11></label>  
                                <input name="senha" type="password" value="<%= c.getSenha()%>" placeholder="Senha" class="form-control input-md" required="">
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label" for="telefone">Celular<h11>*</h11></label>  
                                <input name="celular" type="text" value="<%= c.getCelular()%>" placeholder="Celular" class="form-control input-md" required="">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label"  for="situacao">Situação<h11>*</h11></label>  
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
        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %>
    </body>
</html>
