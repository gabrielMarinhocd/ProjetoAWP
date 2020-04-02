<%@page import="modelo.ItemPedido"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="link_inicio.jsp" %>
    </head>
    <body>
        <%@include file="banner_cliente.jsp" %>
        <%Pedido carrinho = new Pedido();
            try {
                String op = request.getParameter("op");

                if (op.equals("n")) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    ClienteDAO cDAO = new ClienteDAO();
                    Cliente c = cDAO.carregarPorId(id);
                    carrinho.setCliente(c);
                    carrinho.setCliente(cLogado);
                    carrinho.setItens(new ArrayList<ItemPedido>());
                    session.setAttribute("carrinho", carrinho);
                } else {
                    carrinho = (Pedido) session.getAttribute("carrinho");
                }
            } catch (Exception e) {
                 out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde ate 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/login.jsp';"
                + "        </script>");
            }
        %>

        <div style="margin: 8% 10% 10% 10%;" >
            <div class="card">
                <div class="card-body" style="font-size: 20px;" >
                    <% if (carrinho.getItens().size() >= 1) {%>
                    <h3 align="center" style="color:black;" ><a style="color:black;" href="resumo_pedido.jsp">Finalizar Pedido </a><a href="resumo_pedido.jsp"><img src="imagens/icones/carrinho_preto.png" align="center" />(<%=carrinho.getItens().size()%>)</a></h3>
                    <hr/>  <% } else { %>
                    <h3> </h3>
                    <% } %>

                    <div align="center">
                       <img style=" max-width: 330px; max-height: 290px;" src="imagens/AWP_LOGO.png" alt=""/>
                    </div>
                    <hr>
                    <div align="center" >
                        <h5>Selecione uma ação </h5>
                            <hr>
                        <div align="center" class="d-flex justify-content-center mt-3 login_container">
                            
                            <a href="form_inserir_pedido.jsp" style="margin: 10px;" > <button type="submit" name="button" class="btn login_btn">
                                    <% if (carrinho.getItens().size() >= 1) { %>
                                    Adicionar outro produto
                                    <% } else { %>
                                    Nova Assistência
                                    <% }%>
                                </button></a>
                                <a href="listar_pedido_cliente.jsp" style="margin: 10px;" > <button type="button"  class="btn btn-info"> Situação </button> </a> <a href="logof.jsp" style="margin: 10px;" ><button type="button"  class="btn btn-danger"> Sair </button></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-top: 11%;">    

        </div>
    </body>
    <%@include file="rodape_cf.jsp" %> 
    <%@include file="importacoes2.jsp" %>
</html>
