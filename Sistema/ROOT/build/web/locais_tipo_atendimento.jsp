<%@page import="modelo.TipoAtendimento"%>
<%@page import="modelo.TipoAtendimentoDAO"%>
<%
    ArrayList<Local> lista = new ArrayList<Local>();
    try {
        LocalDAO lDAO = new LocalDAO();
        lista = lDAO.listar();
    } catch (Exception e) {
        out.print("Erro:" + e);
         out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde ate 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/login.jsp';"
                + "        </script>");
            response.sendRedirect("login.jsp");
    }
%>
<%
    ArrayList<TipoAtendimento> lista1 = new ArrayList<TipoAtendimento>();
    try {
        TipoAtendimentoDAO tpDAO = new TipoAtendimentoDAO();
        lista1 = tpDAO.listar();
    } catch (Exception e) {
        out.print("Erro:" + e);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="link_inicio.jsp" %>
        <script type="text/javascript">
            alert("O sistema tem um funcionamento melhor quando o aparelho está na horizontal! ");
        </script>
    </head>
    <body>
        <%@include file="banner_inicio.jsp" %>
        <div style="margin: 3% 10% 3% 10%;" >
            <div class="card">
                <div class="card-body" >
                    <h3>Listas de locais e endereços</h3>
                    <table class="table table-hover table-responsive-md" id="table">
                        <tr>
                            <th>Nome</th>
                            <th>Endereço</th>
                            <th>Link</th>
                        </tr>
                        <%for (Local l : lista) {
                        %>
                        <tr>
                            <td><%=l.getNome()%></td>
                            <td><%=l.getEndereco()%></td>
                            <td><%=l.getLink()%> </td>
                        </tr>
                        <% }%>
                    </table>
                </div>
            </div>
        </div>
        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %>
    </body>
</html>