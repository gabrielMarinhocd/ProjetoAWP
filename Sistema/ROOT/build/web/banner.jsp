<%@page import="modelo.DataBaseDAO"%>
<%@page import="modelo.Menu"%>
<%@page import="modelo.Funcionario"%>
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #182232; color:white;">
            <a class="navbar-brand" href="listar_pedido.jsp"><img style=" max-width: 140px; max-height: 70px;" src="imagens/AWP_LOGO.png" alt=""/></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">        
                    <%
                        Funcionario fLogado = new Funcionario();
                        DataBaseDAO db = new DataBaseDAO();
                        try {
                            fLogado = (Funcionario) session.getAttribute("funcionario");
                             if (fLogado.getSituacao().equals("ativo")){
                                 out.print(" <ul class='navbar-nav mr-auto'>");
                            out.print("<li class='nav-item'> <a class='nav-link' href='listar_pedido.jsp'> </a></li>");
                            for (Menu mc : fLogado.getPerfil().getMenus()) {
                                out.print("<li class='nav-item'><a class='nav-link' href='"
                                        + mc.getLink() + "'> " + mc.getTitulo() + "</a></li>");
                            }
                            out.print("</ul>");
                           out.print("<form class='form-inline my-2 my-lg-0' ><ul class='navbar-nav mr-auto'>"
                                   + " <li><a class='nav-link' href='logof_funcionario.jsp'>"+fLogado.getNome()+
                                   " (Sair) </a></li></ul> </form>");
                           } else {response.sendRedirect("acesso_restrito.jsp");
                             } 
                        } catch (Exception e) {
                            response.sendRedirect("acesso_restrito.jsp");
                        }
                    %>
            </div>
           </nav> 
            