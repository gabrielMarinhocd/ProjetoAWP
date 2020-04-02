<%@page import="modelo.ItemPedido"%>
<%@page import="modelo.PedidoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%
    int op = Integer.parseInt(request.getParameter("op"));
    int login = Integer.parseInt(request.getParameter("login"));
    Pedido p = new Pedido();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        PedidoDAO pDAO = new PedidoDAO();
        p = pDAO.carregarPorId(id);
    } catch (Exception e) {
        out.print("Erro:" + e);
    }

%>
<%    ArrayList<ItemPedido> carrinho = new ArrayList<ItemPedido>();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        PedidoDAO pDAO = new PedidoDAO();
        carrinho = pDAO.carregarItensPedido(id);
    } catch (Exception e) {
        out.print("Erro:" + e);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="link_inicio.jsp" %>
    <body>
        <%@include file="banner.jsp" %>
        <% for (ItemPedido ip : carrinho) {%>
        <% response.sendRedirect("preco_final.do?email=" + p.getCliente().geteMail() + "&id=" + p.getId() + "&numSerie=" + ip.getNumeroSerie() + "&modelo=" + ip.getModelo()+"&funcionario="+fLogado.getId()+"&valor="+p.getValor()+"&op="+op+"&login="+login);%>
        <% }%>
        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %>
    </body>
</html>
