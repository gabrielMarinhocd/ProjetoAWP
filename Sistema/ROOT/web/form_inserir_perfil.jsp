<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="link_inicio.jsp" %>
    </head>
    <body>
        <%@include file="banner.jsp" %>
        <div class="central" id="central">
            <h1>Novo Perfil</h1>
            <br/>
            <form class="form-horizontal" name="inserir_perfil" action="inserir_perfil.do" method="post">
                <fieldset>
                    <label class="col-md-1 control-label" for="nome">Nome:<h11>*</h11></label>  
                    <div class="col-md-4">
                        <input id="titulo" name="nome" type="text" placeholder="Nome" class="form-control input-md" required="Preencha o icone">
                    </div><br/>
                    <label class="col-md-1 control-label" for="descricao">Descrição:<h11>*</h11></label>  
                    <div class="col-md-4">
                        <input id="titulo" name="descricao" type="text" placeholder="Descrição" class="form-control input-md" required="Preencha o icone" >
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
