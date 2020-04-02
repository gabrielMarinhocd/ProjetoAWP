<%@page import="java.util.ArrayList"%>
<%@page import="modelo.LocalDAO"%>
<%@page import="modelo.Local"%>
<%
    ArrayList<Local> lista2 = new ArrayList<Local>();
    try {
        LocalDAO lDAO = new LocalDAO();
        lista2 = lDAO.listar();
    } catch (Exception e) {
        out.print("Erro:" + e);
    }
%>

<div class="conteiner">
    <footer id="myFooter">
        <div class="container">
            <div class="row">
                <div class="col-sm-3 info">
                    <div style="padding-top:12%; ">
                        <img class="img-fluid" src="imagens/AWP_LOGO.png" alt=""/>
                    </div>
                </div> 
                <div class="col-sm-3 info">
                    <h5>Loja Principal</h5>
                    <ul>
                        <li><a target="_blank" href="https://goo.gl/maps/4pPRgH8PooZJkhmq9">Loja - AWP Brasil</a></li>
                        <li> <b>Endereço:</b> CLSW 102 Bloco A Loja 39-41 Setor Sudoeste - Brasilia - DF</li>
                    </ul>
                </div>
                <div class="col-sm-3 info">
                    <h5>Contato</h5>
                    <b>Telefone:</b>+55 61 4104-9371<br/>
                    <b>Email:</b> contato@awpbrasil.com.br<br/>
                    <a target="_blank" href="locais_tipo_atendimento.jsp"><b>Endereços</b></a>
                </div>
                <div class="col-sm-3 info">
                    <h5>Locais </h5>
                    <ul>
                        <%int lo1 = 0;
                            for (Local lo : lista2) {
                                if (lo.getSituacao().equals("ativo")) {
                        %>
                        <li><a target="_blank" href=""data-toggle="modal" data-target="#local<%=lo1%>"> <%=lo.getNome()%> </a></li> 
                        <!-- Modal -->
                        <div class="modal fade" id="local<%=lo1%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 style="color: black; " class="modal-title" > <%= lo.getNome() %> </h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body" style="color: black; " >
                                        <b>Endereço:</b> <%= lo.getEndereco()%><br/>
                                        <B>Links: </B><%=lo.getLink()%>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                                lo1++;
                            }
                        %>
                    </ul>
                </div>
            </div>
        </div>
        <div style="background-color: #02060B; text-align: center; padding-bottom: 10px;">
            Site produzido por Gabriel Marinho  <br/>Email de contato: gabrielmarinhodossantocd@gmail.com - Telefone: (61) 99367-2608   
        </div>

    </footer>
</div>          
