<%@page import="modelo.PedidoDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Pedido"%>
<%@page import="modelo.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Pedido> lista = new ArrayList<Pedido>();
    try {
        PedidoDAO pDAO = new PedidoDAO();
        lista = pDAO.listar();
    } catch (Exception e) {
        out.print("Erro:" + e);
        out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/login.jsp';"
                + "        </script>");
    }
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    DecimalFormat df = new DecimalFormat("R$ ###,##0.00");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(titulo, id) {
                if (confirm("Tem certeza que deseja cancelar o pedido:" + titulo + "?")) {
                    window.open("excluir_pedido.do?id=" + id, "_self");
                }
            }
        </script>
        <%@include file="link_inicio.jsp" %>
    </head>
    <body>
        <%@include file="banner.jsp" %>
        <div class="container container-padrao">
            <div class="card">
                <div class="card-body">
                    <h2 align="center">Lista de Pedidos <div align="right">
                            <a href="listar_pedido.jsp"><button class="btn btn-info btn-sm" >Entrada Equipamento</button></a> 
                            <a href="listar_pedido_pendente.jsp"><button class="btn btn-success btn-sm" >Pendente</button></a> 
                            <a href="listar_pedidos_finalizados_1.jsp"><button class="btn btn-danger btn-sm" >Equipamento Entregue</button></a> 
                            <a href="listar_pedidos_cancelados.jsp"><button class="btn btn-secondary btn-sm" >Cancelados </button></a></div></h2>
                    <hr>

                    <h3 align="left">Lista de Pedidos (Teste Equipamento)</h3>
                    <div class="table-responsive-lg table-hover">
                        <table class="table table-responsive-sm table-hover" >
                            <tr>
                                <th>O.S</th>
                                <th>Cliente</th>
                                <th>Data Pedido</th>
                                <th>Valor Total</th>
                                <th></th>
                                <th>Opções </th>   
                            </tr>
                            <% for (Pedido p : lista) {
                                    if (p.getSituacao() == null && p.getDataPagamento() == null) {
                                        if ((p.getSituacao() == null && p.getDataPagamento() == null) && ((p.getDataEntrega() != null && p.getOkValor() == null) || (p.getOkValor() != null && p.getAceitoValor() == null) || (p.getAceitoValor() != null && p.getFuncionario().getId() == 0))) {
                            %>
                            <tr>
                                <td><%= p.getId()%></td>
                                <td><%=p.getCliente().getNome()%></td>
                                <td ><%=sdf.format(p.getData())%> </td>
                                <td> <%
                                    if (p.getOkValor() == null && p.getDataEntrega() != null && p.getValor() != 0.0 && p.getMaoObra() != 0.0) {
                                    %>
                                    <small>Insira os materias e clique em "concluir" na parte superior da página de materias.</small> 

                                    <% } else if (p.getValor() > 0 && p.getOkValor() != null) {%>
                                    <%=df.format(p.getValor())%>
                                    <% }
                                        if (p.getDataEntrega() != null && p.getValor() == 0.0) { %>
                                    Insira os materiais 
                                    <% } else if (p.getValor() == 0.0) { %>
                                    Em analise
                                    <% } %>
                                </td>
                                <td>
                                    <%if (p.getAceitoValor() != null && p.getFuncionario().getId() == 0) {%>
                                    <a href="confirma_servico.jsp?id=<%= p.getId()%>&funcionario=<%=fLogado.getId()%>&op=0&login=0"><button type="button" class="btn btn-outline-warning btn-sm btn-sm">Produto Pronto!</button></a>
                                    <% } else if (p.getFuncionario().getId() > 0 && p.getDataPagamento() == null) {%>
                                    <a href="confirma_pagamento.jsp?id=<%= p.getId()%>&op=0&login=0"><button type="button" class="btn btn-outline-info btn-sm btn-sm">Pago</button></a>
                                    <% }%>
                                    <% if (p.getDataEntrega() == null) {%>

                                    <a href="comfirma_entrega.jsp?id=<%= p.getId()%>&op=0&login=0"><button type="button" class="btn btn-outline-warning btn-sm btn-sm">Confirmar entrega</button></a> 
                                    <% }%>
                                </td> 
                                <td>
                                    <a href="mostrar_pedido_fc.jsp?id=<%=p.getId()%>&idPedido=<%=p.getId()%>&op=0&login=0">
                                        <button type="button" class="btn btn-outline-success btn-sm">Mais...</button></a>  
                                        <% if (p.getDataEntrega() != null) {%>
                                    <a href="listar_material.jsp?id=<%= p.getId()%>&op=0&login=0"><button type="button" class="btn btn-outline-warning btn-sm btn-sm">Materiais</button></a>   
                                    <% } %>
                                </td>    
                            </tr>   
                            <%
                                        }
                                    }
                                }
                            %>   
                        </table>
                    </div>
                         <a href="javascript:history.back()">  <button class="btn btn-outline-secondary btn-sm" >voltar</button></a>
                </div>
            </div>
        </div> 
    </body>
    <%@include file="rodape_cf.jsp" %> 
    <%@include file="importacoes2.jsp" %>
</html>