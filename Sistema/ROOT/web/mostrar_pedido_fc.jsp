<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.ItemPedido"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.PedidoDAO"%>
<%@page import="modelo.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<ItemPedido> carrinho = new ArrayList<ItemPedido>();
    int login = Integer.parseInt(request.getParameter("login"));
    int id = Integer.parseInt(request.getParameter("id"));
    try {
        PedidoDAO pDAO = new PedidoDAO();
        carrinho = pDAO.carregarItensPedido(id);
    } catch (Exception e) {
        out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde ate 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/acesso_restrito.jsp';"
                + "        </script>");
    }
%>
<%
    int op = Integer.parseInt(request.getParameter("op"));
    int idPedido = Integer.parseInt(request.getParameter("id"));
    Pedido p = new Pedido();
    try {

        PedidoDAO pDAO = new PedidoDAO();
        p = pDAO.carregarPorId(idPedido);
    } catch (Exception e) {
        out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde ate 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/acesso_restrito.jsp';"
                + "        </script>");
    }
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    DecimalFormat df = new DecimalFormat("R$ ###,##0.00");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="link_inicio.jsp" %>
    </head>
    <body>
        <%@include file="banner.jsp" %>
        <div class="container" style="margin-top: 2%;">
            <div class="card">
                <div class="card-body" style=" padding: 2% 2% 2% 2%;" >
                    <h2 align="center">Pedido <%=p.getId()%></h2>
                    <hr/>
                    <p> <b>Data do pedido:</b> <%= sdf.format(p.getData())%> </p>
                    <p> <b>Cliente:</b> <%=p.getCliente().getNome()%> </p>
                    <hr/>
                    <p> <b>Preço:</b><% if (p.getValor() > 0) {%> 
                        <%=df.format(p.getValor())%>
                        <% } else { %>  Em analise <% }%></p>
                    <p> </p>
                    <p> <b>Data de pagamento:</b><% if (p.getDataPagamento() != null) {%> 
                        <%= sdf.format(p.getDataPagamento())%>
                        <% } else { %>
                        Aguardando o pagamento 
                        <% }%></p>
                    <p><b>Descrição:</b> 
                        <% if (p.getDescricao() == null) { %>

                        <% } else {%>
                        <%=p.getDescricao()%>
                        <%} %>
                    </p>
                    <p><b>Forma de Pagmento ou Tipo Atendimento:</b> 
                        <% if (p.getFormaPagamento() != null) {%>
                        <%= p.getFormaPagamento()%> 
                        <% } %>
                    </p>
                    <table class="table table-responsive-lg table-hover" > 
                        <%
                            int i = 1;
                            for (ItemPedido ip : carrinho) {
                        %>
                        <tr>
                            <th>Dados do serviço N° <%=i%></th>
                        </tr>
                        <tr>
                            <th>Tipo de Atendimento</th>
                            <th>Problema</th>
                            <th>Local</th>
                            <th>Numero de serie</th>
                        </tr>
                        <tr>
                            <td><%=ip.getMeioPagamento()%></td>
                            <td><%=ip.getProblema()%></td>
                            <td><%=ip.getLocal()%></td>
                            <td><%= ip.getNumeroSerie()%> </td>
                        </tr> 

                        <tr>
                            <th>Modelo</th>
                            <th>Fabricante</th>
                            <th>Potencial</th>
                            <th>Tensão de entrada</th>
                            <th>Tensão de saida</th>
                        </tr>
                        <tr>
                            <td><%=ip.getModelo()%></td>
                            <td><%=ip.getFabricante()%></td>
                            <td><%=ip.getPotencia()%></td>
                            <td><%= ip.getTensaoEntrada()%></td>
                            <td><%= ip.getTensaoSaida()%></td>
                        </tr>

                        <%
                                i++;
                            }
                        %>   
                    </table>


                    <hr/>
                    <h5 align="center"> <%= p.getStatus()%> </h5>
                    <hr/>
                    <div align="rigth" >
                        <a href="javascript:history.back()">  <button class="btn btn-outline-secondary btn-sm" >voltar</button></a>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %>  
    </body>
</html>
