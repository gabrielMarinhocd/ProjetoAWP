<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int op = Integer.parseInt(request.getParameter("op"));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="link_inicio.jsp" %>
        <link href="css/login_1.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
        <script >
            function minuscula(z) {
                v = z.value.toLowerCase();
                z.value = v;
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
        </script>
        
        <script src="javascripts/locastyle.js" type="text/javascript"></script>

    </head>
    <body>
        <%@include file="banner_inicio.jsp" %>
            <div class="d-flex justify-content-center h-100">
                <div class="user_card" >
                    <div class="d-flex justify-content-center">
                        <div class="brand_logo_container">
                            <img  style=" max-width: 90%; max-height: 90%;" src="imagens/AWP_LOGO.png" alt=""/>
                        </div>
                    </div>
                    <div style="padding: 10px;" class="d-flex justify-content-center form_container">

                        <form name="esqueci_senha" action="esqueci_senha.do" method="post"  data-ls-module="form">
                            <h5 align="center">Esqueci minha senha  <button type="button" class="btn btn-light btn-md" data-toggle="modal" data-target="#exampleModalCenter">?</button></h5>
                            <% if (op == 0) { %>
                            <div align="center">
                                <h5>Selecione opção de cadastro, preencha os campos com seus dados e clique em "proximo".</h5>
                                <div class="form-check form-check-inline">
                                    <a href="esqueci_senha.jsp?op=1 ">   <button type="button" class="btn login_btn" >CPF</button> </a>
                                    <label class="form-check-label" for="inlineRadio1"></label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <a href="esqueci_senha.jsp?op=2 ">   <button type="button" class="btn login_btn" >CNPJ</button> </a>

                                </div>
                            </div>
                            <% } %>
                            <%  if (op == 1) {%>
                            <div class="input-group mb-3">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" name="cpf" class="ls-mask-cpf form-control input-user" maxlength="14"  placeholder="CPF" required="">
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-append">
                                    <span class="input-group-text">@</span>
                                </div>
                                <input type="email" name="email" class="form-control input_user" maxlength="40" onkeyup="minuscula(this)"  placeholder="email" required="" >
                            </div> 
                            <div class="d-flex justify-content-center mt-3 login_container">
                                <button type="submit" name="button" class="btn login_btn">Proximo</button>
                            </div>
                            <% } else if (op == 2) {%>
                            <div class="input-group mb-3">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" name="cpf" class="ls-mask-cnpj form-control input_user" maxlength="20"  placeholder="CNPJ" required="">

                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-append">
                                    <span class="input-group-text">@</span>
                                </div>
                                <input type="email" name="email" class="form-control input_user" maxlength="40" onkeyup="minuscula(this)"  placeholder="email" required="" >
                            </div> 
                            <div class="d-flex justify-content-center mt-3 login_container">
                                <button type="submit" name="button" class="btn login_btn">Proximo</button>
                            </div>
                            <% }%>
                        </form>
                    </div>
                    <div class="mt-4">
                        <div class="d-flex justify-content-center links">
                            <a href="login.jsp">Login cliente</a>
                        </div>
                    </div>
                </div>
            </div>


        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Ajuda</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Tente digitar seu cpf (000.000.000-00), CNPJ (00.000.000/0000-00). Caso não consiga acessar ou tenha alguma duvida ligue para nossa loja +55 61 4104-9371
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
