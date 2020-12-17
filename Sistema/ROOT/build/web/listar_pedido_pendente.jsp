<%@page import="modelo.TipoAtendimentoDAO"%>
<%@page import="modelo.TipoAtendimento"%>
<%@page import="modelo.Pedido"%>
<%@page import="modelo.PedidoDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<%
    ArrayList<TipoAtendimento> lista1 = new ArrayList<TipoAtendimento>();
    try {
        TipoAtendimentoDAO tpDAO = new TipoAtendimentoDAO();
        lista1 = tpDAO.listar();
    } catch (Exception e) {
        out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde ate 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/login.jsp';"
                + "        </script>");
        response.sendRedirect("login.jsp");
    }
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
                    <h2 align="center">Lista de Pedidos
                        <div align="right">
                            <a href="listar_pedido.jsp"><button class="btn btn-info btn-sm" >Entrada Equipamento</button></a> 
                            <a href="listar_pedido_teste_equipamento.jsp"><button class="btn btn-success btn-sm" >Teste Equipamento</button></a> 
                            <a href="listar_pedidos_finalizados_1.jsp"><button class="btn btn-danger btn-sm" >Equipamento Entregue</button></a> 
                            <a href="listar_pedidos_cancelados.jsp"><button class="btn btn-secondary btn-sm" >Cancelados </button></a>
                        </div>
                    </h2>
                    <hr>

                    <h3 align="left">Lista de Pedidos (Pendentes) </h3>
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
                                        if (p.getFuncionario().getId() > 0 && p.getDataPagamento() == null) {
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
                                    <a data-toggle="modal" data-target="#formaPagamento" data-whatever="@mdo"><button type="button" class="btn btn-outline-info btn-sm btn-sm">Finalizar Pedido</button></a>

                                    <div class="modal fade" id="formaPagamento" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Finalizar Pedido</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form name="inserir_material" action="confirma_pagamento.jsp?op=0&login=0" method="post">
                                                        <input type="hidden" value="<%=p.getId()%>" name="id"/>
                                                        <div class="form-group">
                                                            <label class="col-form-labell" for="valor">Forma de pagamento ou Tipo de atendimento:</label>  
                                                            <select name="formaPagamento" size="1" class="form-control input-md" required >
                                                                <option value="DINHEIRO">DINHEIRO</option>
                                                                <option value="BOLETO">BOLETO</option>
                                                                <option value="CARTÂO">CARTÂO</option>
                                                                <%for (TipoAtendimento tp : lista1) {
                                                                        if (tp.getSituacao().equals("ativo")) {
                                                                %>
                                                                <option value="<%=tp.getNome()%> "><%=tp.getNome()%></option>
                                                                <% }
                                                                     } %>
                                                            </select>
                                                            <small id="passwordHelpInline" class="text-muted">
                                                                Adicione forma de Pagamento;
                                                            </small>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary">Salvar</button> 
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                                        </div>    
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 

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