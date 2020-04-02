<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.Pedido"%>
<%@page import="modelo.PedidoDAO"%>
<%@page import="modelo.Material"%>
<%@page import="modelo.MaterialDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int login = Integer.parseInt(request.getParameter("login"));
    int op = Integer.parseInt(request.getParameter("op"));
    int id = Integer.parseInt(request.getParameter("id"));
    ArrayList<Material> lista = new ArrayList<Material>();
    try {
        Material m1 = new Material();

        MaterialDAO mDAO = new MaterialDAO();
        lista = mDAO.listar();
        m1 = mDAO.carregarPorId(id);
    } catch (Exception e) {
        out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde ate 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/acesso_restrito.jsp';"
                + "        </script>");
        response.sendRedirect("login.jsp");
    }
    DecimalFormat df = new DecimalFormat("R$ ###,##0.00");
    double preco;
%>
<%
    Pedido p = new Pedido();
    try {
        PedidoDAO pDAO = new PedidoDAO();
        p = pDAO.carregarPorId(id);
    } catch (Exception e) {
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
            function excluir(nome, id, id_pedido, vAntigo, qtdAntigo, preco1, op, login) {
                if (confirm("Tem certeza que deseja excluir o material:" + nome + "?")) {
                    window.open("excluir_material.do?id=" + id + "&vAntigo=" + vAntigo + "&qtdAntigo=" + qtdAntigo + "&id_pedido=" + id_pedido + "&preco1=" + preco1 + "&op=" + op + "&login=" + login, "_self");
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
        <div class="container" style="margin-top: 2%; ">
            <div class="card" >
                <div class="card-body" style="padding: 2% 2% 2% 2%;" >
                    <h3>Lista de Materiais
                        <% if (p.getOkValor() == null && p.getSituacao() == null) { %>
                        <div align="right ">  
                            <% if (p.getMaoObra() > 0.0 && p.getDescricao() != null) {%>
                            <a href="confirma_valor.jsp?id=<%= p.getId()%>&valor=<%=p.getValor()%>&op=<%=op%>&login=<%=id%>"><button type="button" class="btn btn-primary btn-sm btn-sm">Concluir</button></a>
                            <% } %>
                            <% if (p.getMaoObra() == 0.0 && p.getValor() > 0.0) {%>
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#maoObra" data-whatever="@mdo">Inserir Mão de Obra</button>
                            <% } else if (p.getMaoObra() > 0.0) { %>
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#alterarMaoObra" data-whatever="@mdo">Alterar Mão de Obra</button>
                            <% } %>

                            <% if (p.getDescricao() == null && p.getMaoObra() > 0.0) { %>
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#descricao" data-whatever="@mdo">Inserir Descriçao</button>
                            <% } else if (p.getDescricao() != null && p.getMaoObra() != null) { %>
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#alterarDescricao" data-whatever="@mdo">Alterar Descriçao</button>
                            <% } %>
                            <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Novo</button>
                        </div>
                        <% } %>
                    </h3>

                    <table class="table table-hover table-responsive-md" id="table">
                        <tr>
                            <th>Nome</th>
                            <th>Preço da Uni.</th>
                            <th>Quantidade</th>
                            <th>Total </th>
                                <% if (p.getOkValor() == null && p.getSituacao() == null) { %>
                            <th>Opções</th>
                                <% } else { %>
                            <th></th>
                                <% } %>
                        </tr>
                        <%  for (Material m : lista) {
                                if (id == m.getPedido().getId()) {
                        %>
                        <tr>
                            <td><%=m.getNome()%></td>
                            <td><%=df.format(m.getValor())%></td>
                            <td><%=m.getQuantidade()%></td>
                            <td> <%= df.format(preco = ((m.getValor() * m.getQuantidade())))%></td>
                            <td>
                                <% if (p.getOkValor() == null && p.getSituacao() == null) {%>
                                <a href="#" onclick="excluir('<%=m.getNome()%>',<%=m.getId()%>, <%=id%>, <%=m.getValor()%>, <%=m.getQuantidade()%>, <%=p.getValor()%>,<%=op%>,<%=login%>)"><img src="imagens/icones/lixeira.png" /></a>
                                <a data-toggle="modal" data-target="#alterar<%=m.getId()%>" data-whatever="@mdo" ><img src="imagens/icones/lapis_preto.png" /></a>
                                    <% }%>
                                <div class="modal fade" id="alterar<%=m.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Alterar Material </h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form name="inserir_material" action="allterar_material.do?op=<%=op%>&login=<%=login%> " method="post">
                                                    <div class="form-group">
                                                        <input type="hidden" value="<%=m.getId()%>" name="id"/>
                                                        <input type="hidden" value="<%=p.getId()%>" name="id_pedido"/>
                                                        <input type="hidden" value="<%=p.getValor()%>" name="preco1"/>
                                                        <input type="hidden" value="<%=m.getValor()%>" name="vAntigo"/>
                                                        <input type="hidden" value="<%=m.getQuantidade()%>" name="qtdAntigo"/>
                                                        <label class="col-form-label" for="titulo">Descrição:</label>   
                                                        <input name="nome" value="<%=m.getNome()%>" type="text" placeholder="Material" class="form-control input-md" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-form-labell" for="quantidade">Quantidade:</label>  
                                                        <input name="quantidade" type="number" value="<%=m.getQuantidade()%>"  placeholder="Quantidade" class="form-control input-md" required >
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-form-labell" for="valor">Preço Equipamento:</label>  
                                                        <input name="valor" value="<%=m.getValor()%>"  type="number" placeholder="1.00" step="0.01" min="0" max="1000" class="form-control input-md" required>
                                                        <small id="passwordHelpInline" class="text-muted">
                                                            Usar ponto no lugar da virgula Ex: R$000.00
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


                            </td>
                        </tr>            
                        <%
                                }
                            }
                        %>   
                    </table>
                    <hr>
                    <div > 
                        <b>Descrição:</b><% if (p.getDescricao() == null) { %> <% } else {%> <%=p.getDescricao()%>  <%}%>
                        <div align="right"><b>Preço da Mão de Obra:</b> <%=df.format(p.getMaoObra())%></div> 
                    </div>
                    <div align="right"><b>Preço Final:</b> <%=df.format(p.getValor())%> </div>
                    <div align="rigth" >
                        <% if (op == 0) {%>
                        <a href="listar_pedido.jsp"><button type="button" class="btn btn-outline-primary btn-sm btn-sm">Voltar a os pedidos</button> </a>
                        <% } else if (op == 1) {%>
                        <a href="listar_pedido_cliente_fc.jsp?id=<%=login%>"><button type="button" class="btn btn-outline-primary btn-sm btn-sm">Voltar a os pedidos</button> </a>
                        <% } else {%>
                        <a href="listar_pedido_gerente.jsp?id=<%=login%>"><button type="button" class="btn btn-outline-primary btn-sm btn-sm">Voltar a os pedidos</button> </a>
                        <% }%>
                    </div>
                </div>

                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Cadastrar Material</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form name="inserir_material" action="inserir_material.do?&op=<%=op%>&login=<%=login%>" method="post">
                                    <div class="form-group">
                                        <input type="hidden" value="<%=id%>" name="id"/>
                                        <input type="hidden" value="<%=p.getValor()%>" name="preco1"/>
                                        <label class="col-form-label" for="titulo">Nome:</label>   
                                        <input name="nome" type="text" placeholder="Material" class="form-control input-md" required="">
                                    </div>
                                    <div class="form-group">
                                        <label class="col-form-labell" for="quantidade">Quantidade:</label>  
                                        <input name="quantidade" type="number" placeholder="Quantidade" class="form-control input-md" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-form-labell" for="valor">Preço:</label>  
                                        <input name="valor"  type="number" placeholder="1.00" step="0.01" min="0" max="10000" class="form-control input-md" required>
                                        <small id="passwordHelpInline" class="text-muted">
                                            Usar ponto no lugar da virgula Ex: R$000.00
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
            </div>
        </div>


        <div class="modal fade" id="maoObra" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Inserir mão de obra</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form name="inserir_material" action="inserir_mao_obra.do?&op=<%=op%>&login=<%=login%>" method="post">
                            <input type="hidden" value="<%=id%>" name="id"/>
                            <input type="hidden" value="<%=p.getValor()%>" name="preco1"/>
                            <div class="form-group">
                                <label class="col-form-labell" for="valor">Preço:</label>  
                                <input name="maoObra"  type="number" placeholder="1.00" step="0.01" min="0" max="10000" class="form-control input-md" required>
                                <small id="passwordHelpInline" class="text-muted">
                                    Usar ponto no lugar da virgula Ex: R$000.00
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

        <div class="modal fade" id="alterarMaoObra" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Alterar mão de obra</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form name="inserir_material" action="alterar_mao_obra.do?&op=<%=op%>&login=<%=login%>" method="post">
                            <input type="hidden" value="<%=id%>" name="id"/>
                            <input type="hidden" value="<%=p.getMaoObra()%>" name="moAntigo"/>
                            <input type="hidden" value="<%=p.getValor()%>" name="preco1"/>
                            <div class="form-group">
                                <label class="col-form-labell" for="valor">Preço:</label>  
                                <input name="maoObra"  type="number"  value="<%=p.getMaoObra()%>" placeholder="1.00" step="0.01" min="0" max="1000" class="form-control input-md" required>
                                <small id="passwordHelpInline" class="text-muted">
                                    Usar ponto no lugar da virgula Ex: R$000.00
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

        <div class="modal fade" id="descricao" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Inserir Descrição</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form name="inserir_descricao" action="inserir_descricao.do?&op=<%=op%>&login=<%=login%>" method="post">
                            <input type="hidden" value="<%=id%>" name="id"/>
                            <div class="form-group">
                                <label class="col-form-labell" for="valor">Descrição:</label>  
                                <textarea name="descricao" type="text" placeholder="Digite para que ou por que os materiais listados foram utilizados" class="form-control input-md" required></textarea>
                                <small id="passwordHelpInline" class="text-muted">
                                    Ex: Fonte estava queimada, foi necessário fazer a troca; 
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

        <div class="modal fade" id="alterarDescricao" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Inserir Descrição</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form name="inserir_descricao" action="inserir_descricao.do?&op=<%=op%>&login=<%=login%>" method="post">
                            <input type="hidden" value="<%=id%>" name="id"/>
                            <div class="form-group">
                                <label class="col-form-labell"  >Descrição:</label>  
                                <textarea name="descricao" type="text"  value="<%=p.getDescricao()%>"  placeholder="<%=p.getDescricao()%>" class="form-control input-md" required></textarea>
                                <small id="passwordHelpInline" class="text-muted">
                                    Ex: Fonte estava queimada, foi necessário fazer a troca; 
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
