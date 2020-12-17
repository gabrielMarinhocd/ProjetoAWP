<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.PedidoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Pedido> lista = new ArrayList<Pedido>();
    try {
        PedidoDAO pDAO = new PedidoDAO();
        lista = pDAO.listar();
    } catch (Exception e) {
            out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde ate 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/login.jsp';"
                + "        </script>");
            response.sendRedirect("login.jsp");
    }
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    DecimalFormat df = new DecimalFormat("R$ ###,##0.00");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="link_inicio.jsp" %>
    </head>
    <body>
        <%@include file="banner_cliente.jsp" %>
        <div class="container container-padrao" >
            <div class="card">
                <div class="card-body">
                    <h3 align="center">Pedidos Finalizados e Cancelados </h3>
                    <br>
                    <div class="table-responsive-lg table-hover">
                        <table class="table">
                            <tr align="left">
                                <th>O.S</th>
                                <th>Data Pedido</th>
                                <th>Valor</th>
                                <th>Situação</th>
                                <th>Opções</th>
                                <td></td>
                            </tr> 
                            <tr>
                                <% for (Pedido p : lista) {
                                        if (p.getCliente().getId() == cLogado.getId()) {
                                            if (p.getSituacao() != null) {

                                %>
                                <td><%= p.getId()%></td>
                                <td><%=sdf.format(p.getData())%></td>
                                <td> 
                                    <%
                                        if (p.getValor() > 0) {
                                    %>
                                    <%=df.format(p.getValor())%>
                                    <% } else if (p.getValor() == 0.0) {%>
                                    Em analise
                                    <% }%>
                                </td>  
                                <td>
                                    <%= p.getSituacao()%>
                                </td>
                                <td>
                                    <a href="mostrar_pedido.jsp?id=<%=p.getId()%>"><button type="button" class="btn btn-outline-success btn-sm">mais...</button></a> 
                                    <a href="listar_material_cliente.jsp?id=<%= p.getId()%>"><button type="button" class="btn btn-outline-warning btn-sm btn-sm">Materiais</button></a> 
                                </td>
                            </tr>    
                            <% }
                                    }
                                }
                            %>
                        </table>
                    </div>
                    
                    <hr>
                    <a href="javascript:history.back()">  <button class="btn btn-outline-secondary btn-sm" >voltar</button></a>
                </div>
            </div>
        </div>

        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %>
    </body>
</html>
