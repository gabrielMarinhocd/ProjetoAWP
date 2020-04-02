<%@page import="modelo.ItemPedido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PedidoDAO"%>
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
<%    String numSerie, Modelo;
    ArrayList<ItemPedido> carrinho = new ArrayList<ItemPedido>();
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
        <title>JSP Page</title>
    </head>
    <body>
        <% for (ItemPedido ip : carrinho) {%>
        <% response.sendRedirect("comfirma_entrega.do?email=" + p.getCliente().geteMail() + "&id=" + p.getId() + "&numSerie=" + ip.getNumeroSerie() + "&modelo=" + ip.getModelo()+"&op="+op+"&login="+login);%>
        <% }%>
    </body>
</html>
