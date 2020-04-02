<%-- 
    Document   : form_alterar_perfil
    Created on : 20/08/2019, 14:41:31
    Author     : Administrador
--%>

<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Perfil p = new Perfil();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        PerfilDAO pDAO = new PerfilDAO();
        p = pDAO.carregarPorId(id);
    } catch (Exception e) {
        out.print("Erro:" + e);
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="link_inicio.jsp" %>
    </head>
    <body>
         <%@include file="banner.jsp" %>
       <div class="central" id="central">
            <h1>Editar Perfil</h1>
            <form class="form-horizontal" name="alterar_perfil" action="alterar_perfil.do" method="post">
                <fieldset>
                    <input type="hidden" value="<%=p.getId()%>" name="id"/>
                    <label class="col-md-1 control-label" for="nome">Nome:<h11>*</h11></label>  
                    <div class="col-md-4">
                        <input id="titulo" name="nome" type="text"  value="<%=p.getId()%>" placeholder="Nome" class="form-control input-md" required>
                    </div><br/>
                    <label class="col-md-1 control-label" for="descricao">Descrição:<h11>*</h11></label>  
                    <div class="col-md-4">
                        <input id="titulo" name="descricao" type="text" value="<%=p.getDescricao()%>" placeholder="Descrição" class="form-control input-md" required>
                    </div><br/>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="salvar"></label>
                        <div class="col-md-8">
                            <button type="submit" class="btn btn-sm btn-primary">Salvar</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>  
         <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %>
    </body>
</html>
