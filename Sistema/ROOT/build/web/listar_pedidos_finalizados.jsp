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
<%
    int v = 0;
    int v1 = 0;
    int v3 = 0;
    for (Pedido p : lista) {
        if (p.getStatus().equals("Finalizado")) {
            v++;
        } else if (p.getStatus().equals("Cancelado")) {
            v1++;
        }else if (p.getStatus().equals("Valor não aprovado")){
            v3++;
        }
    }

%>
<html>
    <head>
        <script src="javascripts/locastyle.js" type="text/javascript"></script>
        <link href="stylesheets/locastyle.css" rel="stylesheet" type="text/css"/>
        <%@include file="link_inicio.jsp" %>
    </head>
    <body>
        <%@include file="banner.jsp" %>
        <div class="container" style="margin-top:3%;" >
            <div class="card">
                <div class="card-body" style="font-size: 20px;"  >
                    <div class="ls-tabs-btn-nav">
                        <div align="center" >
                            <div class="form-check form-check-inline">
                                <a data-ls-module="button" data-target="#tab1"> <button type="button" class="btn btn-secondary btn-sm" >Equipamento Entregue (<%=v%>)</button></a>
                            </div>      
                            <div class="form-check form-check-inline">
                                <a data-ls-module="button" data-target="#tab3"> <button type="button" class="btn btn-info btn-sm" > Valor não aprovado (<%=v3%>) </button></a>
                            </div>
                            <div class="form-check form-check-inline">
                                <a data-ls-module="button" data-target="#tab2"> <button type="button" class="btn btn-danger btn-sm" > Cancelados (<%=v1%>) </button></a>
                            </div>
                        </div>
                        <div class="ls-tabs-container">
                           <hr>
                            <div id="tab1" class="ls-tab-content">
                                <h3>Equipamento Entregue</h3>
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
                                <h5 align="right"> Nº pedidos = <%=i5%></h5>
                            </div>

                            <!-- divisa -->

                            <div id="tab2" class="ls-tab-content">
                                <h3> Pedidos Cancelados</h3>
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
                                    <% int i6 = 0;
                                        for (Pedido p : lista) {
                                            if (p.getStatus().equals("Cancelado")) {
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
                                    <% i6++;
                                            }
                                        }
                                    %>   
                                </table>
                                <h5 align="right"> Nº total pedidos = <%=i6%></h5> 
                            </div>
                            
                            <div id="tab3" class="ls-tab-content">
                                <h3> Lista de Pedidos (Valor não aprovado)</h3>
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
                                    <% int i3 = 0;
                                        for (Pedido p : lista) {
                                            if (p.getStatus().equals("Valor não aprovado")) {
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
                                    <% i3++;
                                            }
                                        }
                                    %>   
                                </table>
                                <h5 align="right"> Nº total pedidos = <%=i6%></h5> 
                            </div>

                        </div>
                    </div>
                    <a href="javascript:history.back()">  <button class="btn btn-outline-secondary btn-sm" >voltar</button></a>
                </div>
            </div>

        </div>
            
        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %>
    </body>
</html>
