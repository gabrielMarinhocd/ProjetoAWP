<%-- 
    Document   : logof_cliente
    Created on : 04/11/2019, 20:05:33
    Author     : washi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
session.removeAttribute("cliente");
response.sendRedirect("login.jsp");
%>
