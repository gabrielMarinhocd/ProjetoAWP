<%-- 
    Document   : form_gerenciar_menu_perfil
    Created on : 21/10/2019, 21:58:01
    Author     : washi
--%>

<%@page import="modelo.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Perfil p = new Perfil();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        PerfilDAO pDAO = new PerfilDAO();
        p = pDAO.carregarPorId(id);
    }catch(Exception e){
        out.print("Erro:"+e);
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
        <h2>Gerenciar Menu Perfil</h2>
        <form class="form-horizontal" name="menu_perfil" action="gerenciar_menu_perfil.do" method="post">
            <fieldset>
              <label class="col-md-2 control-label" for="nome" >Menus</label>     
            <input type="hidden" value="<%=p.getId() %>" name="id_perfil"/>
            <input type="hidden" value="vincular" name="op"/>
            <div class="col-md-2">
            <select name="id_menu" size="1" required class="form-control input-md">
                <option value=""> Selecione... </option>
                <%
                    ArrayList<Menu> lista = new ArrayList<Menu>();
                    PerfilDAO pDAO = new PerfilDAO();
                    try{
                       lista = pDAO.menusNaoVinculados(p.getId());
                    }catch(Exception e){
                        out.print("Erro:"+e);
                    }
                
                    for(Menu m:lista){
                    %>
                    <option value="<%=m.getId() %>"><%=m.getTitulo() %></option>               
                <%
                        }
                %>
            </select>
            </div>
            <div class="form-group">
                <br>
                <div class="col-md-8">
                    <button type="submit" class="btn btn-sm btn-primary">Adcionar</button>
                </div>
            </div>     
            </fieldset>
        </form>
        <h1>Menus Vinculados</h1>
        <table class="table">
            <tr>
                <th>Título</th>
                <th>Remover</th>
            </tr>
            <%
                for (Menu m : p.getMenus()) {
            %>
            <tr>
                <td><%=m.getTitulo()%></td>
                <td ><a href="gerenciar_menu_perfil.do?id_menu=<%=m.getId()%>&id_perfil=<%=p.getId()%>&op=remover"><img src="imagens/icones/lixeira.png" alt=""/></a></td>
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
