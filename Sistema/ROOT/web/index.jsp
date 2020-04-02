<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="link_inicio.jsp" %>
        <script type="text/javascript">
            alert("O sistema tem um funcionamento melhor quando o aparelho está na horizontal! ");
        </script>
    </head>
    <body>
        <%@include file="banner_inicio.jsp" %>
        <div style="margin: 3% 10% 3% 10%;" >
            <div class="card">
                <div class="card-body" style="font-size: 20px;" >
                    <h3 align="center"> Quem somos?</h3>
                    <hr>
                    <p  style="font-family:Serif;">
                        Somos a mais nova empresa do ramo, mas não há nenhum desafio muito grande ou muito pequeno que possamos fazer, dedicamos nossa máxima energia em cada projeto assumido.
                        Estratégias e planos
                        Cada cliente é único. É por isso que personalizamos cada um de nossos planos a fim de atender exatamente às suas expectativas.
                        Seja uma estratégia simples ou um empreendimento abrangente, sentaremos com você, ouviremos suas solicitações e prepararemos um plano personalizado. 
                    </p>
                    <div align="center">
                        <img style=" max-width: 200px; max-height: 150px;" src="imagens/AWP_LOGO.png" alt=""/>
                    </div>
                    <h3 style="margin-left: 20px;">
                        Testes Padrão
                    </h3>
                    <hr>

                    <div style="margin-left: 30px; font-size: 20px;"> &bull; Faça os seguintes procedimentos antes de pedir assistência.</div>
                    <div style="margin-left: 50px;" >
                        <p style="font-family:Serif;">
                            <b>1-)</b> Verifique se o produto está ligado na tomada.<br/>
                            <b>2-)</b> Verifique se a tomada esta funcionado;<br/>
                            <b>3-)</b> Verifique se o botão está em "ON";<br/>
                            <b>4-)</b> Verifique se a voltagem do aparelho e compatível com a tomada.
                        </p>
                        <p style="font-family:Serif;">
                            Se caso após as verificações produto continuar apresentando defeitos clique em “Assistência Técnica". Cadastre-se e peça assistência ao seu produto.
                        </p>
                        <div align="center" >
                            <div align="center" style="width: 255px" class="d-flex justify-content-center mt-3 login_container">
                                <a href="login.jsp"> <button type="submit" name="button" class="btn login_btn">Assistência Técnica</button></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %>
    </body>
</html>
