<%-- 
    Document   : logof
    Created on : 21/10/2019, 21:52:53
    Author     : washi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
session.removeAttribute("funcionario");
response.sendRedirect("acesso_restrito.jsp");
%>
