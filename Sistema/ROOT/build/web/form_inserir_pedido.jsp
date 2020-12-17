<%@page import="modelo.TipoAtendimentoDAO"%>
<%@page import="modelo.TipoAtendimento"%>
<%@page import="modelo.LocalDAO"%>
<%@page import="modelo.Local"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<Local> lista = new ArrayList<Local>();
    try {
        LocalDAO lDAO = new LocalDAO();
        lista = lDAO.listar();
    } catch (Exception e) {
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
        out.print("<script type='text/javascript'>"
                + "            alert('O servidor esta processando as informações, Aquarde ate 1 minuto e logue novamente');"
                + "            window.location.href = 'https://atcawpbrasil.com.br/login.jsp';"
                + "        </script>");
        response.sendRedirect("login.jsp");
    }
%>
<html>
    <head>
        <%@include file="link_inicio.jsp" %>
    </head>
    <body>
        <%@include file="banner_cliente.jsp" %>
        <div  id="form-novo-pedido" class="container container-padrao" >
            <div class="card">
                <div class="card-body" style="font-size: 20px;" >
                    <h3 align="center">Cadastrar Produto</h3>
                    <hr/>
                    <h5 align="center">Preencha os campos com os dados do produto e clique em "proximo".</h5>
                    <hr>
                    <form  name="inserir_pedido" action="gerenciar_carrinho.do?op=add&red=catalogo" method="post">
                        <div class="form-row" >
                            <div class="col-md-4 input">
                                <label> Fabricante:</label> 
                                <input name="fabricante" type="text" placeholder="Fabricante" class="form-control input-md" required="">
                                <small id="passwordHelpInline" class="text-muted">
                                    Nome do fabricante.
                                </small>
                            </div>
                            <div class="col-md-4 input">
                                <label> Modelo:</label>
                                <input name="modelo" type="text" placeholder="Modelo" class="form-control input-md" required="">
                                 <small id="passwordHelpInline" class="text-muted">
                                   
                                </small>
                            </div>
                            <div class="col-md-4 input">
                                <label>Potencia: </label> 
                                <input name="potencia" type="text" placeholder="Potencia" class="form-control input-md" required="">
                                <small id="passwordHelpInline" class="text-muted">
                                </small>
                            </div>
                        </div>
                        <div class="form-row">
                            <br/><div class="col-md-4 input ">
                                <label  >Tensão Entrada: </label> 
                                <input name="tensaoEntrada" type="text" placeholder="Tensão Entrada" class="form-control input-md" required="">
                                <small id="passwordHelpInline" class="text-muted">
                                </small>
                            </div>
                            <div class="col-md-4 input">
                                <label  >Tensão Saida: </label> 
                                <input name="tensaoSaida" type="text" placeholder="Tensão Saida" class="form-control input-md" required="">
                                <small id="passwordHelpInline" class="text-muted">
                                </small>
                            </div>
                            <div class="col-md-4 input">
                                <label  >Numero de Série: </label> 
                                <input name="numeroSerie" type="text" placeholder="Numero de Série" class="form-control input-md" required="">
                                <small id="passwordHelpInline" class="text-muted">

                                </small>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="col-md-4 input">
                                <label  >Problema Reclamado: </label> 
                                <textarea  name="problema" placeholder="Problema" class="form-control" aria-label="With textarea"></textarea>
                                <small id="passwordHelpInline" class="text-muted">
                                    informe os problemas.
                                </small>
                            </div>
                            <div class="col-md-4 input">
                                <label >Tipo de Atendimento:</label> 
                                <select name="meioPagamento" size="1" class="form-control input-md" required >
                                    <%for (TipoAtendimento tp : lista1) {
                                            if (tp.getSituacao().equals("ativo")) {
                                    %>
                                    <option value="<%=tp.getNome()%> "><%=tp.getNome()%></option>
                                    <% }
                                        } %>
                                </select>
                                <small id="passwordHelpInline" class="text-muted">
                                    Forma de Pagamento ou Garantia;
                                </small>
                            </div>  
                            <div class="col-md-4 input">
                                <label >Local Desejado: </label> 
                                <select name="local" size="1" class="form-control input-md" required >
                                 
                                    <%for (Local l : lista) {
                                            if (l.getSituacao().equals("ativo")) {

                                    %>
                                    <option value="<%=l.getNome()%> "><%=l.getNome()%></option>
                                    <% }
                                        }%>
                                </select>
                                <small id="passwordHelpInline" class="text-muted">
                                    Local que deseja deixar o equipamento;
                                </small>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <input type="checkbox" class="form-check-input" required="" >
                            <small id="passwordHelpInline" class="text-muted">
                                Se possível entregar  de segunda a sexta 
                                apartir das 8h da manhã. A entrega deve ser em ate 48hs, após  isso o pedido de assistência sera cancelado.
                            </small>
                        </div>
                        <br/>
                        <div >
                            <input type="checkbox" class="form-check-input" required="" >
                            <small id="passwordHelpInline" class="text-muted">
                                <button type="button" class="btn btn-link" data-toggle="modal" data-target="#exampleModalCenter">
                                    Política de privacidade
                                </button>
                            </small>
                        </div>
                        <div align="center" >
                            <div align="center" style="width: 255px" class="d-flex justify-content-center mt-3 login_container">
                                <button type="submit" name="button" class="btn login_btn">Proximo</button>
                            </div>
                        </div>
                    </form>
                    <div align="rigth" >
                        <a href="javascript:history.back()">  <button class="btn btn-outline-secondary btn-sm" >voltar </button></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Política de privacidade</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>SEÇÃO 1 - O QUE FAREMOS COM ESTA INFORMAÇÃO?</h4>
                        <p>
                            Quando você realiza alguma transação com nossa loja, como parte do processo de compra e venda,coletamos as informações pessoais que você nos dá tais como: nome, e-mail e endereço.
                        </p>
                        <p>
                            Quando você acessa nosso site, também recebemos automaticamente o protocolo de internet do seu
                            computador, endereço de IP, a fim de obter informações que nos ajudam a aprender sobre seu
                            navegador e sistema operacional.
                        </p>
                        <p>
                            Email Marketing será realizado apenas caso você permita. Nestes emails você poderá receber
                            notícia sobre nossa loja, novos produtos e outras atualizações.
                        </p>
                        <h4>
                            SEÇÃO 2 - CONSENTIMENTO
                        </h4>
                        <p>Como vocês obtêm meu consentimento? </p>
                        <p>
                            Quando você fornece informações pessoais como nome, telefone e endereço, para completar: uma
                            transação, verificar seu cartão de crédito, fazer um pedido, providenciar uma entrega ou retornar
                            uma compra. Após a realização de ações entendemos que você está de acordo com a coleta de dados
                            para serem utilizados pela nossa empresa.
                        </p>
                        <p>
                            Se pedimos por suas informações pessoais por uma razão secundária, como marketing, vamos lhe
                            pedir diretamente por seu consentimento, ou lhe fornecer a oportunidade de dizer não.
                        </p>
                        <p>
                            Se após você nos fornecer seus dados, você mudar de ideia, você pode retirar o seu consentimento
                            para que possamos entrar em contato, para a coleção de dados contínua, uso ou divulgação de suas
                            informações, a qualquer momento, entrando em contato conosco em assistenciaawp@gmail.com
                            ou nos enviando uma correspondência em: <b>UPS Quality CLSW 102 Bloco A Loja 39-41 Setor
                                Sudoeste - Brasilia - DF</b>
                        </p>
                        <h4>
                            SEÇÃO 3 - DIVULGAÇÃO
                        </h4>
                        <p>
                            Podemos divulgar suas informações pessoais caso sejamos obrigados pela lei para fazê-lo ou se
                            você violar nossos Termos de Serviço.
                        </p>
                        <h4>
                            SEÇÃO 4 - SERVIÇOS DE TERCEIROS
                        </h4>
                        <p>
                            No geral, os fornecedores terceirizados usados por nós irão apenas coletar, usar e divulgar suas
                            informações na medida do necessário para permitir que eles realizem os serviços que eles nos
                            fornecem. 
                        </p>
                        <p>
                            Entretanto, certos fornecedores de serviços terceirizados, tais como gateways de pagamento e outros
                            processadores de transação de pagamento, têm suas próprias políticas de privacidade com respeito à
                            informação que somos obrigados a fornecer para eles de suas transações relacionadas com compras.
                        </p>
                        <p>
                            Para esses fornecedores, recomendamos que você leia suas políticas de privacidade para que você
                            possa entender a maneira na qual suas informações pessoais serão usadas por esses fornecedores.
                        </p>
                        <p>
                            Em particular, lembre-se que certos fornecedores podem ser localizados em ou possuir instalações
                            que são localizadas em jurisdições diferentes que você ou nós. Assim, se você quer continuar com
                            uma transação que envolve os serviços de um fornecedor de serviço terceirizado, então suas
                            informações podem tornar-se sujeitas às leis da(s) jurisdição(ões) nas quais o fornecedor de serviço
                            ou suas instalações estão localizados.
                        </p>
                        <p>
                            Uma vez que você deixe o site da nossa loja ou seja redirecionado para um aplicativo ou site de
                            terceiros, você não será mais regido por essa Política de Privacidade ou pelos Termos de Serviço do
                            nosso site.
                        </p>
                        <p>
                            Links
                        </p>
                        <p>
                            Quando você clica em links na nossa loja, eles podem lhe direcionar para fora do nosso site. Não
                            somos responsáveis pelas práticas de privacidade de outros sites e lhe incentivamos a ler as
                            declarações de privacidade deles.
                        </p>
                        <h4> 
                            SEÇÃO 5 - SEGURANÇA
                        </h4>
                        <p>
                            Para proteger suas informações pessoais, tomamos precauções razoáveis e seguimos as melhores
                            práticas da indústria para nos certificar que elas não serão perdidas inadequadamente, usurpadas,
                            acessadas, divulgadas, alteradas ou destruídas.3
                        </p>
                        <p>
                            Se você nos fornecer as suas informações de cartão de crédito, essa informação é criptografada
                            usando tecnologia "secure socket layer" (SSL) e armazenada com uma criptografia AES-256.
                            Embora nenhum método de transmissão pela Internet ou armazenamento eletrônico é 100% seguro,
                            nós seguimos todos os requisitos da PCI-DSS e implementamos padrões adicionais geralmente
                            aceitos pela indústria.
                        </p>
                        <h4>
                            SEÇÃO 6 - ALTERAÇÕES PARA ESSA POLÍTICA DE PRIVACIDADE
                        </h4>
                        <p>
                            Reservamos o direito de modificar essa política de privacidade a qualquer momento, então por
                            favor, revise-a com frequência. Alterações e esclarecimentos vão surtir efeito imediatamente após
                            sua publicação no site. Se fizermos alterações de materiais para essa política, iremos notificá-lo aqui
                            que eles foram atualizados, para que você tenha ciência sobre quais informações coletamos, como
                            as usamos, e sob que circunstâncias, se alguma, usamos e/ou divulgamos elas.
                        </p>
                        <p>
                            Se nossa loja for adquirida ou fundida com outra empresa, suas informações podem ser transferidas
                            para os novos proprietários para que possamos continuar a vender produtos para você.
                        </p>
                        <br/>
                        <div align="center">
                            <img style=" max-width: 200px; max-height: 150px;" src="imagens/logo-ups.png"/>
                            <img style=" max-width: 200px; max-height: 150px;" src="imagens/logo_protecline_colorida.png" alt=""/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %> 
    </body>
</html>
