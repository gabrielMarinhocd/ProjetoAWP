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
                + "            window.location.href = 'https://atcawpbrasil.com.br/login.jsp';"
                + "        </script>");
        response.sendRedirect("login.jsp");
    }
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    DecimalFormat df = new DecimalFormat("R$ ###,##0.00");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(titulo, id) {
                if (confirm("Tem certeza que deseja cancelar o pedido:" + titulo + "?")) {
                    window.open("recusa_valor.do?id=" + id + "&op=0&login=0", "_self");
                }
            }
              function recusaValor(titulo, id) {
                if (confirm("Tem certeza que deseja recusar o pedido:" + titulo + "?")) {
                    window.open("recusa_valor.do?id=" + id + "&op=0&login=0", "_self");
                }
            }
            function ordemDecrescente(a, b) {
                return a.data < b.data;
            }
            var sortNumber = function (x, y) {
                return x - y;
            };
        </script>
        <%@include file="link_inicio.jsp" %>

    </head>
    <body>
        <%@include file="banner_cliente.jsp" %>
        <div class="container container-padrao" >
            <div id="pedidos-pendentes">
                <h2 class="titulo-tabela">Pedidos Pendentes<span> <a href="listar_pedidos_finalizado_c.jsp"><button class="btn btn-danger btn-sm" >Pedidos Finalizados e Cancelados</button></a> </span></h2>
            </div>
            <hr/>
            <br />
            <div class="to_show" > 
                <% for (Pedido p : lista) {

                        if (p.getSituacao() == null && p.getCliente().getId() == cLogado.getId()) {


                %>
                <div class="card" style="width:80%; margin:0% 10% 1% 10%;" align="center" >
                    <div class="card-body"> 
                        <h4>Pedido <%=p.getId()%> </h4>
                        <table class="table" style="margin: 0% 10% 0% 10%; width:80%">

                            <tr><th>Nº OS:</th><td><%= p.getId()%></td></tr>
                            <tr><th>Data:</th><td> <%=sdf.format(p.getData())%></td></tr>
                            <tr><th>Valor Total</th><td><%
                                if (p.getValor() > 0 && p.getOkValor() != null) {
                                    %>
                                    <%=df.format(p.getValor())%>
                                    <% } else {%>
                                    Em analise
                                    <% }%></td></tr> 
                            <tr>
                                <th>Situação:</th>
                                <td> 
                                    <% if (p.getOkValor() != null && p.getFuncionario().getId() == 0 && p.getAceitoValor() == null) {%>
                                    <%=p.getStatus()%> Clique em aceitar ou cancelar
                                    <% } else {%>
                                    <%=p.getStatus()%>
                                    <% } %>
                                </td>
                            </tr>
                            <tr><th>Opções:</th>
                                <td>
                                    <% if (p.getAceitoValor() == null && p.getValor() > 0 && p.getOkValor() != null) {%>
                                    <a href="aceito_valor.do?id=<%= p.getId()%>&op=1&login=0"><button type="button" class="btn btn-outline-info btn-sm btn-sm">Aceitar valor</button></a>
                                    <a href="#" onclick="recusaValor('<%=p.getCliente().getNome()%>',<%=p.getId()%>)"><button type="button" class="btn btn-outline-danger  btn-sm">Cancelar</button></a>
                                    <%}%>
                                    <%if (p.getAceitoValor() == null && p.getOkValor() == null) {%>
                                    <a href="#" onclick="excluir('<%=p.getCliente().getNome()%>',<%=p.getId()%>)"> <img src="imagens/icones/lixeira.png"/></a>
                                        <% }%>
                                </td></tr>
                            <tr>
                                <th></th>
                                <td>
                                    <a href="mostrar_pedido.jsp?id=<%=p.getId()%>"><button type="button" class="btn btn-outline-success  btn-sm">Mais...</button></a> 
                                    <% if (p.getOkValor() != null) {%>
                                    <a href="listar_material_cliente.jsp?id=<%= p.getId()%>"><button type="button" class="btn btn-outline-warning  btn-sm">Materiais</button></a> 
                                    <% } %>
                                </td>
                            </tr>
                        </table>
                               
                        <div align="right" >
                            <a href="javascript:history.back()">  <button class="btn btn-outline-secondary btn-sm" >voltar</button></a>
                        </div>
                    </div>
                </div>
                <% }
                    }
                %>   
            </div>
        </div>
        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %>
    </body>
</html>