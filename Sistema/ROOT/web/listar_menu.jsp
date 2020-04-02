<%@page import="modelo.MenuDAO"%>
<%@page import="modelo.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    ArrayList<Menu> lista = new ArrayList<Menu>();
    try {
        MenuDAO mDAO = new MenuDAO();
        lista = mDAO.listar();
    } catch (Exception e) {
        out.print("Erro:" + e);
        out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde ate 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/login.jsp';"
                + "        </script>");
    }
%>
<html>
    <head>
        <link href="css/form_table.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(titulo, id) {
                if (confirm("Tem certeza que deseja excluir o menu:" + titulo + "?")) {
                    window.open("excluir_menu.do?id=" + id, "_self");
                }
            }
        </script>
        <%@include file="link_inicio.jsp" %>
    </head>
    <body>
        <%@include file="banner.jsp" %>
        <div class="central" id="central">
            <h2 >Lista de Menus <div align="right"><a href="form_inserir_menu.jsp"><button type="button" class="btn btn-secondary">Novo</button></a></div></h2>

            <table class="table" id="table">
                <tr>
                    <th>Título</th>
                    <th>Link</th>
                    <th>Opções</th>
                </tr>
                <%                    for (Menu m : lista) {
                %>
                <tr>
                    <td><%=m.getTitulo()%></td>
                    <td><%=m.getLink()%></td>
                    <td><a href="form_alterar_menu.jsp?id=<%=m.getId()%>"><img src="imagens/icones/lapis_preto.png" /></a> <a href="#" onclick="excluir('<%=m.getTitulo()%>',<%=m.getId()%>)"> <img src="imagens/icones/lixeira.png"/></a></td>
                </tr>            

                <%
                    }
                %>   
            </table>
        </div>
        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %>
    </body>
</html>
