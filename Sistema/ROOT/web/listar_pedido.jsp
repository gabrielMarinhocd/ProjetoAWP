<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="modelo.Cliente"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.PedidoDAO"%>
<%@page import="modelo.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int i = 0;
    ArrayList<Pedido> lista = new ArrayList<Pedido>();
    try {
        PedidoDAO pDAO = new PedidoDAO();
        lista = pDAO.listar();
    } catch (Exception e) {
        out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde ate 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/login.jsp';"
                + "        </script>");
    }
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    NumberFormat nf = NumberFormat.getInstance();
    DecimalFormat df = new DecimalFormat("R$ ###,##0.00");
%>

<html class="ls-theme-blue">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(titulo, id) {
                if (confirm("Tem certeza que deseja cancelar o pedido: " + id+ "?")) {
                    window.open("cancelar_pedido_fc.do?id=" + id + "&op=1&login=0", "_self");
                }
            }
             function recusaValor(titulo, id) {
                if (confirm("Tem certeza que deseja recusar o pedido: " + id + "?")) {
                    window.open("recusa_valor.do?id=" + id + "&op=0&login=0", "_self");
                }
            }
        </script>
        <script src="javascripts/locastyle.js" type="text/javascript"></script>
        <link href="stylesheets/locastyle.css" rel="stylesheet" type="text/css"/>
        <%@include file="link_inicio.jsp" %>
    </head>
    <body>
        <%@include file="banner.jsp" %>
        <% int v = 0;
            int v1 = 0;
            int v2 = 0;
            int v3 = 0;
            i = 0;
            int v5 = 0;
            int v6 = 0;
            int v7 = 0;
            for (Pedido p : lista) {
                if (p.getDataEntrega() == null && p.getSituacao() == null) {
                    v++;
                } else if ((p.getSituacao() == null && p.getDataPagamento() == null) && ((p.getDataEntrega() != null && p.getOkValor() == null) || (p.getOkValor() != null && p.getAceitoValor() == null) || (p.getAceitoValor() != null && p.getFuncionario().getId() == 0))) {
                    v1++;
                } else if (p.getFuncionario().getId() > 0 && p.getDataPagamento() == null) {
                    v5++;
                } else if (p.getSituacao() != null) {
                    v6++;
                }
            }

        %>
        <div class="container container-padrao" >
            <h2 align="center">Lista de Pedidos <div align="right"> <a href="listar_pedidos_finalizados.jsp"> <button class="btn btn-info btn-sm" >Equipamento Entregue | Valor recusado | Cancelados (<%=v6%>) </button></a></div> </h2>
            <hr>

            <ul class="ls-tabs-nav">
                <li class="ls-active"><a data-ls-module="tabs" href="#track">Entrada do Equipamento(<%=v%>)</a></li>
                <li><a data-ls-module="tabs" href="#laps2">Teste de Equipamento(<%=v1%>)</a></li>
                <li><a data-ls-module="tabs" href="#laps5">Pendente(<%=v5%>)</a></li>
            </ul>
            <div class="ls-tabs-container">

                <div id="track" class="ls-tab-content ls-active">
                    <h3>Entrada do Equipamento</h3>
                    <div class="table-responsive-lg table-hover">
                        <table class="table" >
                            <tr>
                                <th>O.S</th>
                                <th>Cliente</th>
                                <th>Data Pedido</th>
                                <th>Valor Total</th>
                                <th></th>
                                <th>Opções </th>   
                            </tr>

                            <%                        for (Pedido p : lista) {

                                    if (p.getSituacao() == null && p.getDataPagamento() == null) {
                                        if (p.getDataEntrega() == null) {
                            %>
                            <tr>
                                <td><%= p.getId()%></td>
                                <td><%=p.getCliente().getNome()%></td>
                                <td ><%=sdf.format(p.getData())%> </td>
                                <td> <%
                                    if (p.getOkValor() == null && p.getDataEntrega() != null && p.getValor() != 0.0) {
                                    %>
                                    Insira os materias e clique em "concluir" na parte superior da  página de materias. 

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

                                    <a href="comfirma_entrega.jsp?id=<%= p.getId()%>&op=0&login=0"><button type="button" class="btn btn-outline-warning btn-sm btn-sm">Confirmar recebimento</button></a> 
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
                                            i++;
                                        }
                                    }

                                }
                            %>   
                        </table>
                    </div>
                    
                    <h5 align="right"> Nº total pedidos = <%=i%></h5>
                </div>

                <div id="laps2" class="ls-tab-content">
                    <h3>Teste de Equipamento </h3>
                    <table class="table table-responsive-sm table-hover" >
                        <tr>
                            <th>O.S</th>
                            <th>Cliente</th>
                            <th>Data Pedido</th>
                            <th>Valor Total</th>
                            <th></th>
                            <th>Opções </th>   
                        </tr>
                        <%int i1 = 0;
                            for (Pedido p : lista) {
                                if (p.getSituacao() == null && p.getDataPagamento() == null) {
                                    if ((p.getDataEntrega() != null && p.getOkValor() == null) || (p.getOkValor() != null && p.getAceitoValor() == null) || (p.getAceitoValor() != null && p.getFuncionario().getId() == 0)) {
                        %>
                        <tr>
                            <td><%= p.getId()%></td>
                            <td><%=p.getCliente().getNome()%></td>
                            <td ><%=sdf.format(p.getData())%> </td>
                            <td> <%
                                if (p.getOkValor() == null && p.getDataEntrega() != null && p.getValor() != 0.0) {
                                %>
                                <small>Insira os materias e clique em "concluir" na parte superior da página de materias.</small> 

                                <% } else if (p.getValor() > 0 && p.getOkValor() != null) {%>
                                <%=df.format(p.getValor())%>
                                <% }
                                    if (p.getDataEntrega() != null && p.getValor() == 0.0) { %>
                                Insira os materiais 
                                <% } else if (p.getOkValor() != null && p.getAceitoValor() == null) { %>
                                <small style="padding-left: 20px;"> Aguardando confirmação do cliente </small>
                                <% } %>

                            </td>
                            <td>
                                <%if (p.getAceitoValor() != null && p.getFuncionario().getId() == 0) {%>
                                <a href="confirma_servico.jsp?id=<%= p.getId()%>&funcionario=<%=fLogado.getId()%>&op=0&login=0">
                                    <button type="button" class="btn btn-outline-info btn-sm btn-sm">Poduto Pronto!</button>
                                </a>
                                <% } else if (p.getFuncionario().getId() > 0 && p.getDataPagamento() == null) {%>
                                <a href="confirma_pagamento.jsp?id=<%= p.getId()%>&op=1&login=0"><button type="button" class="btn btn-outline-info btn-sm btn-sm">Pago</button></a>
                                <% }%>
                                <% if (p.getDataEntrega() == null) {%>

                                <a href="comfirma_entrega.jsp?id=<%= p.getId()%>&op=0&login=0"><button type="button" class="btn btn-outline-warning btn-sm btn-sm">Confirmar entrega</button></a> 
                                <% }  %>
                            
                            </td> 
                            <td>
                                <% if (p.getAceitoValor() == null && p.getSituacao() == null) {%>

                                <% }%>
                                <a href="mostrar_pedido_fc.jsp?id=<%=p.getId()%>&idPedido=<%=p.getId()%>&op=0&login=0">
                                    <button type="button" class="btn btn-outline-success btn-sm">Mais...</button></a>  
                                    <% if (p.getDataEntrega() != null) {%>
                                <a href="listar_material.jsp?id=<%= p.getId()%>&op=0&login=0"><button type="button" class="btn btn-outline-warning btn-sm btn-sm">Materiais</button></a>   
                                <% } %>
                            </td>    
                        </tr>   
                        <% i1++;
                                    }
                                }
                            }
                        %>   
                    </table>
                    <h5 align="right"> Nº total pedidos = <%=v1%></h5>
                </div>

                <div id="laps5" class="ls-tab-content">
                    <h3>Pendente </h3>
                    <div class="table-responsive-lg table-hover">
                        <table class="table" >
                            <tr>
                                <th>O.S</th>
                                <th>Cliente</th>
                                <th>Data Pedido</th>
                                <th>Valor Total</th>
                                <th></th>
                                <th>Opções </th>   
                            </tr>
                            <% int i4 = 0;
                                for (Pedido p : lista) {
                                    if (p.getSituacao() == null && p.getDataPagamento() == null) {
                                        if (p.getFuncionario().getId() > 0 && p.getDataPagamento() == null) {
                            %>
                            <tr>
                                <td><%= p.getId()%></td>
                                <td><%=p.getCliente().getNome()%></td>
                                <td ><%=sdf.format(p.getData())%> </td>
                                <td> <%
                                    if (p.getOkValor() == null && p.getDataEntrega() != null && p.getValor() != 0.0) {
                                    %>
                                    Insira os materias e clique em "concluir" na parte superior da  página de materias. 

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
                                    <a href="form_inserir_formaPagamento.jsp?id=<%=p.getId()%>" ><button type="button" class="btn btn-outline-info btn-sm btn-sm">Finalizar Pedido</button></a>

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
                            <% i4++;
                                        }
                                    }
                                }
                            %>   
                        </table>
                    </div>
                    
                    <h5 align="right"> Nº total pedidos = <%=i4%></h5>
                </div>       
            </div>
        </div>
       <%@include file="rodape_cf.jsp" %>   
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
          integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
          crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
          integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
          crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
          crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
          integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
          crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>

        <script src="javascripts/locastyle.js" type="text/javascript"></script>
    </body>
</html>