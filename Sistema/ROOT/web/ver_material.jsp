<%@page import="modelo.PedidoDAO"%>
<%@page import="modelo.Pedido"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.MaterialDAO"%>
<%@page import="modelo.Material"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    ArrayList<Material> lista = new ArrayList<Material>();
    try {
        MaterialDAO mDAO = new MaterialDAO();
        lista = mDAO.listar();
    } catch (Exception e) {
             out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde ate 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/acesso_restrito.jsp';"
                + "        </script>");
             response.sendRedirect("login.jsp");
    }
    DecimalFormat df = new DecimalFormat("R$ ###,##0.00");
    int id = Integer.parseInt(request.getParameter("id"));
    double preco;
%>
<%
    Pedido p = new Pedido();
    try {
        PedidoDAO pDAO = new PedidoDAO();
        p = pDAO.carregarPorId(id);
    } catch (Exception e) {
        out.print("Erro:" + e);
             out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde ate 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/acesso_restrito.jsp';"
                + "        </script>");
             response.sendRedirect("login.jsp");
    }
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(nome, id) {
                if (confirm("Tem certeza que deseja desativar o meterial:" + nome + "?")) {
                    window.open("excluir_material.do?id=" + id, "_self");
                }
            }
            $('#myModal').on('shown.bs.modal', function () {
                $('#myInput').trigger('focus')
            })
        </script>
        <%@include file="link_inicio.jsp" %>
    </head>
    <body>
        <%@include file="banner.jsp" %>
        <div class="container container-padrao">
            <div class="card" >
                <div class="card-body" style="padding: 2% 2% 2% 2%;" >
                    <h2 >Lista de Material  </h2>
                    
                    <div class="table-responsive-lg table-hover">
                        <table class="table" id="table">
                            <tr>
                                <th>Nome</th>
                                <th>Quantidade</th>
                                <th>Preço do Equipamento</th>
                                <th>Total</th>
                            </tr>
                            <%for (Material m : lista) {
                                    if (id == m.getPedido().getId()) {
                            %>
                            <tr>
                                <td><%=m.getNome()%></td>
                                <td><%=m.getQuantidade()%></td>
                                <td><%=df.format(m.getValor())%></td>
                                <td> <%= df.format(preco = ((m.getValor() * m.getQuantidade())))%></td>
                            </tr>            
                            <%
                                    }
                                }
                            %>   
                        </table>
                    </div>
                    
                    <hr>
                    <div > 
                        <b>Descrição:</b><% if (p.getDescricao() == null) { %><% } else {%> <%=p.getDescricao()%>  <%}%>
                        <div align="right" ><b>Preço da Mão de Obra:</b> <%=df.format(p.getMaoObra())%></div> 
                    </div>
                    <div align="right"><b>Preço Final:</b> <%=df.format(p.getValor())%> </div>

                    <div align="rigth" >
                         <a href="javascript:history.back()">  <button class="btn btn-outline-secondary btn-sm" >voltar</button></a>
                    </div>
                </div>
            </div>
        </div>
        <br/>      
        <div class="container" align="center">
            <h5> O Sistema faz os seguintes calculos:</h5>
            <p>total = (preço da unidade * quantidade)</p>
            <p>Depois soma o total + preço da mão de obra</p>
            <p>Preço final = total + mâo de obra  </p>
        </div>

        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %>
    </body>
</html>

