<%@page import="modelo.TipoAtendimentoDAO"%>
<%@page import="modelo.TipoAtendimento"%>
<%@page import="modelo.LocalDAO"%>
<%@page import="modelo.Local"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Local> lista = new ArrayList<Local>();
    try {
        LocalDAO lDAO = new LocalDAO();
        lista = lDAO.listar();
    } catch (Exception e) {
        out.print("Erro:" + e);
          out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde ate 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/login.jsp';"
                + "        </script>");
            response.sendRedirect("login.jsp");
    }
%>
<%
    ArrayList<TipoAtendimento> lista1 = new ArrayList<TipoAtendimento>();
    try {
        TipoAtendimentoDAO tpDAO = new TipoAtendimentoDAO();
        lista1 = tpDAO.listar();
    } catch (Exception e) {
        out.print("Erro:" + e);
          out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde ate 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/login.jsp';"
                + "        </script>");
            response.sendRedirect("login.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/form_table.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(nome, id) {
                if (confirm("Tem certeza que deseja desativar o local:" + nome + "?")) {
                    window.open("desativar_local.do?id=" + id, "_self");
                }
            }
            function excluir1(nome, id) {
                if (confirm("Tem certeza que deseja desativar o local:" + nome + "?")) {
                    window.open("desativar_tipo_atendimento.do?id=" + id, "_self");
                }
            }

            $('#myModal').on('shown.bs.modal', function () {
                $('#myInput').trigger('focus')
            })

        </script>

        <style>
            .to_show{
                display:none;
            }
            .to_show1{
                display:none;
            }
        </style>
        <%@include file="link_inicio.jsp" %>
    </head>
    <body>
        <%@include file="banner.jsp" %>

        <div class="container container-padrao" >
            <div align="center">
                <button class="btn btn-secondary btn-sm" id="locais">Locais</button> <button class="btn btn-secondary btn-sm" id="atendimento">Tipo de Atendimento</button>
            </div>
            <hr>

            <div class="to_show" >
                <h2  class="titulo-tabela" >Lista de Locais <span align="right"> <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Novo</button></span></h2>
              
                <div class="table-responsive-lg table-hover">
                    <table class="table table-hover table-responsive-md" id="table">
                        <tr>
                            <th>Nome</th>
                            <th>Endereço</th>
                            <th>link</th>
                            <th>Situação</th>
                            <th>Opções</th>
                        </tr>
                        <%for (Local l : lista) {
                        %>
                        <tr>
                            <td><%=l.getNome()%></td>
                            <td><%=l.getEndereco()%></td>
                            <td><%=l.getLink()%> </td>
                            <td><%=l.getSituacao()%> </td>
                            <td>
                                <a data-toggle="modal" data-target="#alterar<%=l.getId()%>" data-whatever="@mdo" ><img src="imagens/icones/lapis_preto.png" /></a> 

                                <div class="modal fade" id="alterar<%=l.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Alterar Local </h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form name="alterar_local" action="alterar_local.do" method="post">
                                                    <div class="form-group">
                                                        <input type="hidden" value="<%=l.getId()%>" name="id"/>
                                                        <input type="hidden" value="<%=fLogado.getId()%>" name="idFuncionario"/>
                                                        <label class="col-form-label" for="titulo">Nome:</label>   
                                                        <input name="nome" value="<%=l.getNome()%>" type="text" placeholder="Nome" class="form-control input-md" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-form-labell" for="quantidade">Endereço:</label>  
                                                        <input name="endereco" value="<%=l.getEndereco()%>" type="text" placeholder="Endereço" class="form-control input-md" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-form-labell" for="valor">Link do Google Maps:</label>  
                                                        <input name="link" value="<%=l.getLink()%>" type="text" placeholder="link" class="form-control input-md" >
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
                                <% if (l.getSituacao().equals("ativo")) {%>
                                <a href="#" onclick="excluir('<%=l.getNome()%>',<%=l.getId()%>)"><img src="imagens/icones/lixeira.png" /></a>
                                    <% } else {%>
                                <a href="ativar_local.do?id=<%=l.getId()%>"><button type="button" class="btn btn-primary btn-sm">ativar</button></a>
                                <% } %>
                            </td>
                        </tr>            
                        <%
                            }
                        %>   
                    </table>
                </div>
                
            </div>

            <div class="to_show1" >
                <h2 class="titulo-tabela" >Tipo de Atendimento <span align="right" > <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#inserirTP" data-whatever="@mdo">Novo</button></span></h2>
                <div class="table-responsive-lg table-hover">
                    <table class="table" id="table">
                        <tr>
                            <th>Nome</th>
                            <th>Endereço</th>
                            <th>Situação</th>
                            <th>Opções</th>
                        </tr>
                        <%for (TipoAtendimento tp : lista1) {
                        %>
                        <tr>
                            <td><%=tp.getNome()%></td>
                            <td><%=tp.getDescricao()%></td>
                            <td><%=tp.getSituacao()%> </td>
                            <td>
                                <a data-toggle="modal" data-target="#alterarTP<%=tp.getId()%>" data-whatever="@mdo" ><img src="imagens/icones/lapis_preto.png" /></a> 

                                <div class="modal fade" id="alterarTP<%=tp.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Alterar Local </h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form name="alterar_tipo_atendimento" action="alterar_tipo_atendimento.do" method="post">
                                                    <div class="form-group">
                                                        <input type="hidden" value="<%=tp.getId()%>" name="id"/>
                                                        <input type="hidden" value="<%=fLogado.getId()%>" name="idFuncionario"/>
                                                        <label class="col-form-label" for="titulo">Nome:</label>   
                                                        <input name="nome" value="<%=tp.getNome()%>" type="text" placeholder="Nome" class="form-control input-md" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-form-labell" for="quantidade">Descrição:</label>  
                                                        <input name="descricao" value="<%=tp.getDescricao()%>" type="text" placeholder="descricao" class="form-control input-md" >
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
                                <% if (tp.getSituacao().equals("ativo")) {%>
                                <a href="#" onclick="excluir1('<%=tp.getNome()%>',<%=tp.getId()%>)"><img src="imagens/icones/lixeira.png" /></a>
                                    <% } else {%>
                                <a href="ativar_tipo_atendimento.do?id=<%=tp.getId()%>"><button type="button" class="btn btn-primary btn-sm">ativar</button></a>
                                <% } %>
                            </td>
                        </tr>            
                        <%
                            }
                        %>   
                    </table>
                </div>
                
            </div>


            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Cadastrar Local</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form name="inserir_local" action="inserir_local.do" method="post">
                                <div class="form-group">
                                    <input type="hidden" value="<%=fLogado.getId()%>" name="idFuncionario"/>
                                    <label class="col-form-label" for="titulo">Nome:</label>   
                                    <input name="nome" type="text" placeholder="Nome" class="form-control input-md" required="">
                                </div>
                                <div class="form-group">
                                    <label class="col-form-labell" for="quantidade">Endereço:</label>  
                                    <input name="endereco" type="text" placeholder="Endereço" class="form-control input-md" required>
                                </div>
                                <div class="form-group">
                                    <label class="col-form-labell" for="valor">Link do Google Maps:</label>  
                                    <input name="link" type="text"  placeholder="link" class="form-control input-md" >
                                    <small id="passwordHelpInline" class="text-muted">
                                        Opcional
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


            <div class="modal fade" id="inserirTP" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Cadastrar Tipo de Atendimento</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form name="inserir_tipo_atendimento" action="inserir_tipo_atendimento.do" method="post">
                                <div class="form-group">
                                    <input type="hidden" value="<%=fLogado.getId()%>" name="idFuncionario"/>
                                    <label class="col-form-label" for="titulo">Nome:</label>   
                                    <input name="nome" type="text" placeholder="Nome" class="form-control input-md" required="">
                                </div>
                                <div class="form-group">
                                    <label class="col-form-labell" for="quantidade">Descrição:</label>  
                                    <input name="descricao" type="text" placeholder="descricao" class="form-control input-md" required>
                                    <small id="passwordHelpInline" class="text-muted">
                                        Opcional
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

        <script>
            const locais = document.querySelector("#locais");
            const gerenciamento = document.querySelector("#atendimento");
            let cont = 0;

            locais.addEventListener('click', () => {
              $(".to_show").toggle('slow');

            });

            gerenciamento.addEventListener("click", () => {
              $(".to_show1").toggle('slow');
            })

         </script>

        <%@include file="rodape_cf.jsp" %>
        <%@include file="importacoes2.jsp" %>
        <script src="javascripts/locastyle.js" type="text/javascript"></script>
    </body>
</html>
