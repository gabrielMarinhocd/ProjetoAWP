<%@page import="modelo.TipoAtendimento"%>
<%@page import="modelo.TipoAtendimentoDAO"%>
<%@page import="modelo.Pedido"%>
<%@page import="modelo.PedidoDAO"%>
<% 
    Pedido p = new Pedido();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        PedidoDAO pDAO = new PedidoDAO();
        p = pDAO.carregarPorId(id);
    } catch (Exception e) {
        out.print("Erro:" + e);
         response.sendRedirect("login.jsp");
    }
%>
<% 
    ArrayList<TipoAtendimento> lista1 = new ArrayList<TipoAtendimento>();
    try {
        TipoAtendimentoDAO tpDAO = new TipoAtendimentoDAO();
        lista1 = tpDAO.listar();
    } catch (Exception e) {
        out.print("Erro:" + e);
          out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde ate 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/login.jsp';"
                + "        </script>");
            response.sendRedirect("login.jsp");
    }
%>
  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <%@include file="link_inicio.jsp" %>
    </head>
    <body>
        <%@include file="banner.jsp" %>

        <div class="modal-dialog" >
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Finalizar Pedido</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form name="inserir_material" action="confirma_pagamento.jsp?op=2&login=0" method="post">
                        <input type="hidden" value="<%=p.getId()%>" name="id"/>
                        <div class="form-group">
                            <label class="col-form-labell" for="valor">Forma de Pagamento ou Tipo de atendimento:</label>  
                            <select name="formaPagamento" size="1" class="form-control input-md" required >
                                <option value="DINHEIRO">DINHEIRO</option>
                                <option value="BOLETO">BOLETO</option>
                                <option value="CARTÂO">CARTÂO</option>
                                <%for (TipoAtendimento tp : lista1) {
                                            if (tp.getSituacao().equals("ativo")) {
                                    %>
                                    <option value="<%=tp.getNome()%> "><%=tp.getNome()%></option>
                                    <% }
                                        } %>
                            </select>
                            <small id="passwordHelpInline" class="text-muted">
                                Adicione forma de pagamento ou tipo de atendimento;
                            </small>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary btn-sm">Salvar</button> 
                         <a href="javascript:history.back()">  <button class="btn btn-outline-secondary btn-sm" >voltar</button></a>
                        </div>    
                    </form>
                </div>
            </div>
        </div>
        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %>
    </body>
</html>
