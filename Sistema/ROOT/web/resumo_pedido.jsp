<%@page import="modelo.ItemPedido"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Pedido carrinho = new Pedido();
    try {
        carrinho = (Pedido) session.getAttribute("carrinho");
    } catch (Exception e) {
         out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde ate 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/login.jsp';"
                + "        </script>");
    }
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat hr = new SimpleDateFormat("HH:mm");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="link_inicio.jsp" %>
    </head>
    <body>
        <%@include file="banner_cliente.jsp" %>
        <div class="container container-padrao">
            
            <div class="card">
                <div class="card-body" style="padding: 2% 2% 2% 2%;" >
                    <h2 align="center">Dados do Produto</h2>
                    <hr>
                    <h5 align="center">Confira os dados e clique em proximo</h5>
                    <div class="table-responsive-lg table-hover">
                        <table class="table" width="80%">
                            <%                    int i = 1;
                                for (ItemPedido ip : carrinho.getItens()) {
                            %>

                            <tr>   <th >Dados do produto </th> <td ><%=i%></td>
                            </tr>
                            <tr><th >Fabricante:</th><td ><%=ip.getFabricante()%></td></tr>
                            <tr> <th >Modelo:</th> <td ><%=ip.getModelo()%></td></tr>
                            <tr> <th>potencial:</th><td ><%=ip.getPotencia()%></td></tr>
                            <tr> <th >Tensão entrada:</th><td ><%=ip.getTensaoEntrada()%>h</td></tr>
                            <tr> <th >Tensão saida:</th><td ><%=ip.getTensaoSaida()%></td></tr>
                            <tr> <th >Numero de serie:</th><td ><%=ip.getNumeroSerie()%></td></tr>
                            <tr> <th >Problema acusado:</th><td ><%=ip.getProblema()%></td></tr>
                            <tr> <th >Meio de pagamento:</th><td ><%=ip.getMeioPagamento()%></td></tr>
                            <tr> <th >Local:</th><td ><%=ip.getLocal()%></td></tr>

                            <tr>
                                <td align="left"><a href="gerenciar_carrinho.do?item=<%=i%>&op=remove">
                                        <button type="button" class="btn btn-outline-danger">Cancelar</button></a></td>
                                        <td align="right" ><a href="finalizar_pedido.do?op=0&login=0&id=<%=cLogado.getId() %>"><button type="button" style="width: 255px" class="btn login_btn" >Proximo </button></a></td>
                                <td></td>
                            </tr>
                            <%
                                    i++;
                                }
                            %>

                        </table>
                    </div>
                    
                </div>
            </div>
        </div>
        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %> 
    </body>
</html>
