<%@page import="java.text.NumberFormat"%>
<%@page import="modelo.PedidoDAO"%>
<%@page import="modelo.Pedido"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    NumberFormat nf = NumberFormat.getInstance();
    DecimalFormat df = new DecimalFormat("R$ ###,##0.00");
%>

<html>
    <head>
        <script src="javascripts/locastyle.js" type="text/javascript"></script>
        <link href="stylesheets/locastyle.css" rel="stylesheet" type="text/css"/>
        <%@include file="link_inicio.jsp" %>
    </head>
    <body>
        <%@include file="banner.jsp" %>
        <div class="container container-padrao">
            <div class="to_show card" >
                <div class="card-body ">

                    <h2 align="center">Lista de Pedidos
                        <div align="right">
                            <a href="listar_pedido.jsp"><button class="btn btn-info btn-sm" >Entrada Equipamento</button></a> 
                            <a href="listar_pedido_teste_equipamento.jsp"><button class="btn btn-success btn-sm" >Teste Equipamento</button></a> 
                            <a href="listar_pedido_pendente.jsp"><button class="btn btn-warning btn-sm" >Pendente</button></a> 
                            <a href="listar_pedidos_cancelados.jsp"><button class="btn btn-secondary btn-sm" >Cancelados </button></a>
                        </div>
                    </h2>
                    <hr>

                    <h3 align="left">Lista de Pedidos (Equipamento Entregue) </h3>
                    <div class="table-responsive-lg table-hover">
                        <table class="table table-responsive-sm table-hover" >
                            <tr>
                                <th>O.S</th>
                                <th>Cliente</th>
                                <th>Data Pedido</th>
                                <th>Valor</th>
                                <th>Situação</th>  
                                <th>Opções</th>
                                <th> </th>   
                            </tr>
                            <% int i5 = 0;
                                for (Pedido p : lista) {
                                    if (p.getStatus().equals("Finalizado")) {
                            %>
                            <tr>
                                <td><%= p.getId()%></td>
                                <td><%=p.getCliente().getNome()%></td>
                                <td ><%=sdf.format(p.getData())%> </td>
                                <td> <%
                                    if (p.getValor() > 0) {
                                    %>
                                    <%=df.format(p.getValor())%>
                                    <% } else if (p.getValor() == 0) {%>
                                    Em analise
                                    <% }%>
                                </td>
                                <td>
                                    <%= p.getSituacao()%>
                                </td>
                                <td>
                                    <a href="mostrar_pedido_fc.jsp?id=<%=p.getId()%>&idPedido=<%=p.getId()%>&op=2&login=0">
                                        <button type="button" class="btn btn-outline-success btn-sm">ver...</button></a>  
                                    <a href="ver_material.jsp?id=<%= p.getId()%>&op=2&login=0"><button type="button" class="btn btn-outline-warning btn-sm btn-sm">Materiais</button></a>                 
                                </td>    
                            </tr>   
                            <% i5++;
                                    }
                                }
                            %>   
                        </table>
                    </div>
                    <h5 align="right"> Nº pedidos = <%=i5%></h5>
                    <a href="javascript:history.back()">  <button class="btn btn-outline-secondary btn-sm" >voltar</button></a>
                </div>
            </div>

        </div>
        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %>
    </body>
</html>
