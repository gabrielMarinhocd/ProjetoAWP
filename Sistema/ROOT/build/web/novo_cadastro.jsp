<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="link_inicio.jsp" %>
        <link href="stylesheets/locastyle.css" rel="stylesheet" type="text/css"/>
        <script>
            function validarSenha() {
                NovaSenha = document.getElementById('NovaSenha').value;
                CNovaSenha = document.getElementById('CNovaSenha').value;
                if (NovaSenha != CNovaSenha) {
                    alert("SENHAS DIFERENTES!");
                } else {
                    document.FormSenha.submit();
                }
            }
            function validarSenha1() {
                NovaSenha1 = document.getElementById('NovaSenha1').value;
                CNovaSenha1 = document.getElementById('CNovaSenha1').value;
                if (NovaSenha1 != CNovaSenha1) {
                    alert("SENHAS DIFERENTES!");
                } else {
                    document.FormSenha1.submit();
                }
            }
            function formatar(src, mask)
            {
                var i = src.value.length;
                var saida = mask.substring(0, 1);
                var texto = mask.substring(i)
                if (texto.substring(0, 1) != saida)
                {
                    src.value += texto.substring(0, 1);
                }
            }
            function minuscula(z) {
                v = z.value.toLowerCase();
                z.value = v;
            }
            function maiuscula(z) {
                v = z.value.toUpperCase();
                z.value = v;
            }
            $('#myModal').on('shown.bs.modal', function () {
                $('#myInput').trigger('focus')
            })
        </script>
        <script src="javascripts/locastyle.js" type="text/javascript"></script>
    <body>
        <%@include file="banner_inicio.jsp" %>
        <div class="container" style="margin-top:3%;" >
            <div class="card">
                <div class="card-body" style="font-size: 20px;"  >
                    <div class="ls-tabs-btn-nav">
                        <h5 align="center">Selecione opção de cadastro, preencha os campos e clique em "proximo".</h5>
                        <hr>
                        <div align="center" >
                            <div class="form-check form-check-inline">
                                <a data-ls-module="button" data-target="#tab1"> <button type="button" class="btn login_btn" >CPF</button></a>
                            </div>
                            <div class="form-check form-check-inline">
                                <a data-ls-module="button" data-target="#tab2"> <button type="button" class="btn login_btn" >CNPJ</button></a>
                            </div>
                        </div>
                        <div class="ls-tabs-container">
                            <hr>
                            <div id="tab1" class="ls-tab-content">
                                <form action="cadastrar_cliente.do" method="POST" id="FormSenha" name="FormSenha" data-ls-module="form">
                                    <div class="form-row" align="center">
                                        <div class="col-md-6 ">
                                            <label for="validationDefault01">CPF</label>
                                            <input name="cpfCnpj" type="text" class="ls-mask-cpf form-control" placeholder="EX: 000.000.000-00 " required>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="validationDefault02">Nome Completo</label>
                                            <input name="nome" type="text" class="form-control" id="validationDefault02" placeholder="Ex: Pedro Álvares Cabral" onkeyup="maiuscula(this)" required="" >
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="form-row" align="center">
                                        <div class="col-md-6 ">
                                            <label for="validationDefaultUsername">Email</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="inputGroupPrepend2">@</span>
                                                </div>
                                                <input name="eMail" type="EMAIL" class="form-control"  placeholder="Email" size="50" onkeyup="minuscula(this)" />
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="validationDefault04">Telefone Fixo</label>
                                            <input name="telefone" type="text" class="form-control ls-mask-phone8_with_ddd"   id="validationDefault04" placeholder="Telefone Fixo" >
                                        </div>
                                        <div class="col-md-3">
                                            <label for="validationDefault05">Celular</label>
                                            <input name="celular" type="text" class="form-control ls-mask-phone9_with_ddd"  id="validationDefault05" placeholder="Celular" >
                                        </div>
                                    </div> 
                                    <br/>
                                    <div align="center" class="form-row">
                                        <br/>
                                        <div class="col-md-6 ">
                                            <label for="validationDefault05">Senha</label>
                                            <input name="senha" type="password" placeholder="************" class="form-control" maxlength="10" id="NovaSenha" />
                                        </div>
                                        <div class="col-md-6">
                                            <label for="validationDefault06">Confirme sua senha</label>
                                            <input type="password" placeholder="************" class="form-control" maxlength="10" id="CNovaSenha" />
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="form-check form-check-inline">
                                        <input type="checkbox" id="categoria" class="form-check-input" required="" >                                    
                                        <button type="button" class="btn btn-link" data-toggle="modal" data-target="#exampleModalCenter">
                                            Política de privacidade
                                        </button>
                                    </div>
                                    <div align="center">
                                        <div style="width: 255px" class="d-flex justify-content-center mt-3 login_container">
                                            <br/>
                                            <button type="button" class="btn login_btn"  id="adicionar" onClick="validarSenha()">Proximo</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <!-- divisa -->

                            <div id="tab2" class="ls-tab-content">
                                <form action="cadastrar_cliente.do" method="POST" id="FormSenha1" name="FormSenha1" data-ls-module="form">
                                    <div class="form-row" align="center">
                                        <div class="col-md-6">
                                            <label for="validationDefault01">CNPJ</label>
                                            <input name="cpfCnpj" type="text" class="ls-mask-cnpj form-control " maxlength="20" id="validationDefault01"  placeholder="00.000.000/0000-00 " required>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="validationDefault02">Nome Completo</label>
                                            <input name="nome" type="text" class="form-control" id="validationDefault02" placeholder="Ex: Pedro Álvares Cabral" onkeyup="maiuscula(this)" required>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-row" align="center">
                                        <div class="col-md-6 ">
                                            <label for="validationDefaultUsername">Email</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="inputGroupPrepend2">@</span>
                                                </div>
                                                <input name="eMail" type="EMAIL" class="form-control"  placeholder="Email" size="50" onkeyup="minuscula(this)" />
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="validationDefault04">Telefone Fixo</label>
                                            <input name="telefone" type="text" class="form-control ls-mask-phone8_with_ddd" id="validationDefault04" placeholder="Telefone Fixo" >
                                        </div>
                                        <div class="col-md-3">
                                            <label for="validationDefault05">Celular</label>
                                            <input name="celular" type="text" class="form-control ls-mask-phone9_with_ddd" id="validationDefault05" placeholder="Celular" >
                                        </div>
                                    </div> 
                                    <br/>
                                    <div align="center" class="form-row">
                                        <br/>
                                        <div class="col-md-6 ">
                                            <label for="validationDefault05">Senha</label>
                                            <input name="senha" type="password" placeholder="*************" class="form-control" maxlength="10" id="NovaSenha1" />
                                        </div>
                                        <div class="col-md-6">
                                            <label for="validationDefault06">Confirme sua senha</label>
                                            <input type="password" placeholder="*************" class="form-control" maxlength="10" id="CNovaSenha1" />
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="form-check form-check-inline">
                                        <input type="checkbox" id="categoria1" class="form-check-input" required="" >
                                        <button type="button"  class="btn btn-link" data-toggle="modal" data-target="#exampleModalCenter">
                                            Política de privacidade
                                        </button>
                                    </div>
                                    <div align="center">
                                        <div style="width: 255px" class="d-flex justify-content-center mt-3 login_container">
                                            <br/>
                                            <button type="button" class="btn login_btn"  id="adicionar1" onClick="validarSenha1()">Proximo</button>
                                        </div>
                                    </div>
                                </form>


                            </div>

                        </div>
                    </div>
                    <a href="javascript:history.back()">  <button class="btn btn-outline-secondary btn-sm" >voltar</button></a>
                </div>
            </div>

        </div>

        <!-- Button trigger modal -->


        <!-- Modal -->
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
       <script>
                  $("#adicionar1").prop('disabled', true);

                $('#categoria1').on('input', function () {
                    $('#adicionar1').prop('disabled', !this.value);
                });
                $("#adicionar").prop('disabled', true);

                $('#categoria').on('input', function () {
                    $('#adicionar').prop('disabled', !this.value);
                });
            </script>
        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %>
    </body>
</html>
