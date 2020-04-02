<%@page import="modelo.MenuDAO"%>
<%@page import="modelo.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Menu m = new Menu();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        MenuDAO mDAO = new MenuDAO();
        m = mDAO.carregarPorId(id);
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
            <h2>Editar Menu</h2>
            <form class="form-horizontal" name="alterar_menu" action="alterar_menu.do" method="post" >
                <fieldset>
                    <input type="hidden" value="<%=m.getId()%>" name="id"/>
                    <label class="col-md-1 control-label" for="titulo">Titulo:<h11>*</h11></label>  
                    <div class="col-md-4">
                        <input name="titulo" type="text" value="<%=m.getTitulo()%>" placeholder="Titulo" class="form-control input-md" required="">
                    </div><br/>
                    <label class="col-md-1 control-label" for="link">link:<h11>*</h11></label>  
                    <div class="col-md-4">
                        <input name="link" type="text" value="<%=m.getLink()%>" placeholder="Link" class="form-control input-md" required="">
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
