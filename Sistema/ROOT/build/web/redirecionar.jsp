<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@include file="banner_cliente.jsp" %>
        <% response.sendRedirect("catalogo_servico.jsp?id="+cLogado.getId()+"&op=n");%>
    </body>
</html>
