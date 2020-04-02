
<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    ArrayList<Perfil> lista = new ArrayList<Perfil>();
    try {
        PerfilDAO pDAO = new PerfilDAO();
        lista = pDAO.listar();
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
            function excluir(nome, id) {
                if (confirm("Tem certeza que deseja excluir o perfil:" + nome + "?")) {
                    window.open("excluir_perfil.do?id=" + id, "_self");
                }
            }
        </script>  
        <%@include file="link_inicio.jsp" %>
    </head>
    <body>
         <%@include file="banner.jsp" %>
        <div class="central" id="central">
           <h2 >Lista de Perfis<div align="right"><a href="form_inserir_perfil.jsp"><button type="button" class="btn btn-secondary">Novo</button></a></div></h2>
            <table align="center" class="table" id="table">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Opções</th>
                </tr>
                <%for (Perfil p : lista) {
                %>
                <tr>
                    <td><%=p.getId()%></td>
                    <td><%=p.getNome()%></td>
                    <td><a href="form_alterar_perfil.jsp?id=<%=p.getId()%>"><img src="imagens/icones/lapis_preto.png"/></a> <a href="#" onclick="excluir('<%=p.getNome()%>',<%=p.getId()%>)"><img src="imagens/icones/lixeira.png"/></a> <a href="form_gerenciar_menu_perfil.jsp?id=<%=p.getId()%>"><img src="imagens/icones/menu.png"/></a></td>

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