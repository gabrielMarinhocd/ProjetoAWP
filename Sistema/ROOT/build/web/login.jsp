<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="link_inicio.jsp" %>
        <link href="css/login_1.css" rel="stylesheet" type="text/css"/>
         <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="banner_inicio.jsp" %>
       
            <div class="d-flex justify-content-center h-100">
                <div class="user_card">
                    <div class="d-flex justify-content-center">
                        <div class="brand_logo_container">
                           <img  style=" max-width: 90%; max-height: 90%;" src="imagens/AWP_LOGO.png" alt=""/>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center form_container">
                        <form name="login_cliente" action="valida_cliente.do" method="post" >
                            <div class="input-group mb-3">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="email" name="email" class="form-control input_user" maxlength="40"  placeholder="email" required >
                            </div>
                            <div class="input-group mb-2">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input name="senha" type="password"  class="form-control input_pass" placeholder="senha" required>
                            </div>
                            <div class="d-flex justify-content-center mt-3 login_container">
                                <button type="submit" name="button" class="btn login_btn">Entrar</button>
                            </div>
                        </form>
                    </div>

                    <div class="mt-4">
                        <div class="d-flex justify-content-center links">
                            Não e cadastrado? <a href="novo_cadastro.jsp?op=0" >Cadastrar-se</a>
                        </div>
                         <div class="d-flex justify-content-center links">
                            <a href="esqueci_senha.jsp?op=0" > Esqueci minha senha?</a>
                        </div>
                        <div class="d-flex justify-content-center links">
                            <a href="acesso_restrito.jsp">Login funcionário</a>
                        </div>
                    </div>
                </div>
            </div>

        <%@include file="rodape_cf.jsp" %> 
        <%@include file="importacoes2.jsp" %>
    </body>
</html>