<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="link_inicio.jsp" %>
    </head>
    <body>
        <%@include file="banner.jsp" %>
        <div class="central" align="center">
            <h1>Novo Menu</h1>
            <br/>
            <form class="form-horizontal" name="menu_Controlhe.do" action="menu_Controlhe.do" method="post">
                <fieldset>
                    <label class="col-md-1 control-label" for="titulo">Titulo:<h11>*</h11></label>  
                    <div class="col-md-4">
                        <input name="titulo" type="text" placeholder="Titulo" class="form-control input-md" required="">
                    </div><br/>
                    <label class="col-md-1 control-label" for="link">link:<h11>*</h11></label>  
                    <div class="col-md-4">
                        <input name="link" type="text" placeholder="Link" class="form-control input-md" required="">
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

