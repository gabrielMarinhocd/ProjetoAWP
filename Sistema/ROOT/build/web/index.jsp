<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="link_inicio.jsp" %>
    </head>
    <body>
        <%@include file="banner_inicio.jsp" %>
     <div class="container container-padrao">
        <div class="card">
            <div id="quem-somos" class="card-body">
                <h2 class="center">Quem somos</h2>
                <hr />
                <p>
                    Somos a mais nova empresa do ramo, mas não há nenhum desafio muito grande ou muito pequeno que
                    possamos fazer, dedicamos
                    nossa máxima energia em cada projeto assumido. Estratégias e planos Cada cliente é único. É por isso
                    que personalizamos
                    cada um de nossos planos a fim de atender exatamente às suas expectativas. Seja uma estratégia
                    simples ou um
                    empreendimento abrangente, sentaremos com você, ouviremos suas solicitações e prepararemos um plano
                    personalizado.

                </p>

                <div id="img-quem-somos">
                    <img class="img-fluid" src="https://atcawpbrasil.com.br/imagens/AWP_LOGO.png" alt="">
                </div>

                <br />
                <h2>
                    Testes Padrão
                </h2>
                <hr />
                <ul>
                    <li>Faça as seguintes procedimentos antes de pedir assisência.</li>
                </ul>
                <ul id="verificacoes">
                    <li><b>1-)</b> Verifique se o o produto está ligado na tomada;</li>
                    <li><b>2-)</b> Verifique se a tomada está funcionando;</li>
                    <li><b>3-)</b> Verifique se o botão está em "ON";</li>
                    <li><b>4-)</b> Verifique se a voltagem do aparelho e compatível com a tomada.</li>
                </ul>

                <p>
                    Se caso após as verificações produto continuar apresentando defeitos clique em “Assistência
                    Técnica". Cadastre-se e peça assistência ao seu produto.
                </p>

                <div class="bottom-center">
                    <a href="login.jsp"> <button type="submit" name="button" class="btn login_btn">Assistência
                            Técnica</button></a>
                </div>
            </div>
        </div>
    </div>
        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %>
    </body>
</html>
