<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.PedidoDAO"%>
<%@page import="modelo.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   
    ArrayList<Pedido> lista = new ArrayList<Pedido>();
    try { 
        
        PedidoDAO pDAO = new PedidoDAO();
        lista = pDAO.listar();
    } catch (Exception e) {
            out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde ate 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/acesso_restrito.jsp';"
                + "        </script>");
            response.sendRedirect("login.jsp");
    }
    int id = Integer.parseInt(request.getParameter("id"));
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    DecimalFormat df = new DecimalFormat("R$ ###,##0.00");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(titulo, id) {
                if (confirm("Tem certeza que deseja cancelar o pedido:" + titulo + "?")) {
                    window.open("cancelar_pedido.do?id=" + id, "_self");
                }
            }
        </script>
        <%@include file="link_inicio.jsp" %>
    </head>
    <body>
        <%@include file="banner.jsp" %>
        <div class="central" id="central">
            <h2 align="left">Lista de Pedidos</h2>
            <table class="table table-hover table-responsive-lg" >
                <tr align="left">
                      <th>O.S</th>
                    <th>Cliente</th>
                    <th>Data Pedido</th>
                    <th>Valor Total</th> 
                    <th>Situação</th>
                    <th>Opções </th> 
                   <th></th>
                </tr> 
                <tr>
                    <% for (Pedido p : lista) {
                            if (p.getCliente().getId() == id) {

                    %>
                    <td><%= p.getId()%></td>
                    <td><%= p.getCliente().getNome() %></td>
                    <td><%=sdf.format(p.getData())%></td>
                    <td> 
                        <%
                                if (p.getOkValor() == null && p.getDataEntrega() != null && p.getValor() != 0.0) {
                                %>
                               Insira os materias e clique em "concluir" na parte superior da  página de materias. 

                                <% } else if (p.getValor() > 0 && p.getOkValor() != null) {%>
                                <%=df.format(p.getValor())%>
                                <% }
                                if (p.getDataEntrega() != null && p.getValor() == 0.0) { %>
                                Insira os materiais 
                                <% } else if (p.getValor() == 0.0) { %>
                                Em analise
                                <% } %>
                    </td>
                    <td>
                        <%=p.getStatus() %>
                    </td>
                    <td>
                        <%if (p.getSituacao()== null && p.getAceitoValor() != null && p.getFuncionario().getId() == 0) {%>
                        <a href="confirma_servico.jsp?id=<%= p.getId()%>&funcionario=<%=fLogado.getId()%>&op=1&login=<%=id %>"><button type="button" class="btn btn-outline-warning btn-sm btn-sm">Produto Pronto!</button></a>
                        <% } else if (p.getSituacao()== null && p.getFuncionario().getId() > 0 && p.getDataPagamento() == null) {%>
                        <a href="confirma_pagamento.jsp?id=<%= p.getId()%>&op=1&login=<%=id %>"><button type="button" class="btn btn-outline-info btn-sm btn-sm">Pago</button></a>
                        <% }%>
                        <% if (p.getSituacao()== null && p.getDataEntrega() == null) {%>

                        <a href="comfirma_entrega.jsp?id=<%= p.getId()%>&op=1&login=<%=id %>"><button type="button" class="btn btn-outline-warning btn-sm btn-sm">Confirmar entrega</button></a> 
                        <% }%>
                    </td>
                    <td>
                        <a href="mostrar_pedido_fc.jsp?id=<%=p.getId()%>&op=1&login=<%=id%>"><button type="button" class="btn btn-outline-success btn-sm">mais...</button></a> 
                        <a href="listar_material.jsp?id=<%= p.getId()%>&op=1&login=<%=id%>"><button type="button" class="btn btn-outline-warning btn-sm btn-sm">Materiais</button></a> 
                    </td>
                </tr>    
                <% }
                    }
                %>
            </table> 
        </div>
        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %>
    </body>
</html>