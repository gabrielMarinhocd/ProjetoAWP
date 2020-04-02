<%@page import="modelo.DataBaseDAO"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #182232; color:white;">
    <a class="navbar-brand" href="listar_pedido_cliente.jsp"><img style=" max-width: 140px; max-height: 70px;" src="imagens/AWP_LOGO.png" alt=""/></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <%
                Cliente cLogado = new Cliente();
                DataBaseDAO db = new DataBaseDAO();
                try {
                    cLogado = (Cliente) session.getAttribute("cliente");
                    if (cLogado.getSituacao().equals("ativo")) {
                        out.print("<li><a class='nav-link' href='catalogo_servico.jsp?id=" + cLogado.getId() + "&op=n'> Nova Assistência </a></li>");
                        out.print("<li class='nav-item'> <a class='nav-link' href='listar_pedido_cliente.jsp'> Situação </a></li>");

                        out.print("</ul>");
                        out.print("<form class='form-inline my-2 my-lg-0' >"
                                + "<ul class='navbar-nav mr-auto'> "
                                + "<li><a class='nav-link' href='meus_dados.jsp?id=" + cLogado.getId() + "'>Minha Conta</a>"
                                + "<li><a class='nav-link' href='logof.jsp'>"
                                + cLogado.getNome() + " (Sair) </a></li></ul> </form>");
                    } else {
                        response.sendRedirect("login.jsp");
                    }
                } catch (Exception e) {
                    response.sendRedirect("login.jsp");
                }

            %>
        </ul>
    </div>
</nav> 

