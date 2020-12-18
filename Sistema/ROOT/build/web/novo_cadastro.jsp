<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>AWP - Brasil</title>
  <link rel="icon" href="https://atcawpbrasil.com.br/imagens/AWP_LOGO_icone.png">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
    crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/style.css">

  <link href="stylesheets/locastyle.css" rel="stylesheet" type="text/css" />

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
    function formatar(src, mask) {
      var i = src.value.length;
      var saida = mask.substring(0, 1);
      var texto = mask.substring(i)
      if (texto.substring(0, 1) != saida) {
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
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#"><img class="img-logo img-fluid"
          src="https://atcawpbrasil.com.br/imagens/AWP_LOGO.png" alt="Logo-AWP"></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown"
        aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item"> <a class="nav-link" href="login.jsp"> Login Cliente</a></li>
          <li class="nav-item"> <a class="nav-link" href="acesso_restrito.jsp"> Login Funcionário</a></li>
          <li class="nav-item"><a href="logof.jsp"> </a></li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
          <ul class="navbar-nav mr-auto">
            <li>
              <a class="nav-link" href="login.jsp">
                <button type="button" class="btn btn-danger btn-sm">Fazer login</button>
              </a>
            </li>
          </ul>
        </form>
      </div>
    </div>
  </nav>

  <div id="form-novo-cadastro" class="container container-padrao">
    <div class="card">
      <div class="card-body">
        <div class="ls-tabs-btn-nav" role="tablist">
          <h5 class="center">Selecione opção de cadastro, preencha os campos e clique em "proximo".</h5>
          <div class="center">
            <hr>
            <div class="form-check form-check-inline">
              <a data-ls-module="button" data-target="#tab1"> <button type="button"
                  class="btn button_cadastrar">CPF</button></a>
            </div>
            <div class="form-check form-check-inline">
              <a data-ls-module="button" data-target="#tab2"> <button type="button"
                  class="btn button_cadastrar">CNPJ</button></a>
            </div>
            <hr>
          </div>
          <div class="ls-tabs-container">
            <div id="tab1" class="ls-tab-content">
              <form action="cadastrar_cliente.do" method="POST" id="FormSenha" name="FormSenha" data-ls-module="form">
                <div class="form-row" align="center">
                  <div class="col-md-6 input">
                    <label for="validationDefault01">CPF</label>
                    <input name="cpfCnpj" type="text" class="ls-mask-cpf form-control" placeholder="EX: 000.000.000-00 "
                      required="" maxlength="14">
                  </div>
                  <div class="col-md-6 input">
                    <label for="validationDefault02">Nome Completo</label>
                    <input name="nome" type="text" class="form-control" id="validationDefault02"
                      placeholder="Ex: Pedro Álvares Cabral" onkeyup="maiuscula(this)" required="">
                  </div>
                </div>

                <div class="form-row" align="center">
                  <div class="col-md-6 input ">
                    <label for="validationDefaultUsername">Email</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroupPrepend2">@</span>
                      </div>
                      <input name="eMail" type="EMAIL" class="form-control" placeholder="Email" size="50"
                        onkeyup="minuscula(this)">
                    </div>
                  </div>
                  <div class="col-md-3 input">
                    <label for="validationDefault04">Telefone Fixo</label>
                    <input name="telefone" type="text" class="form-control ls-mask-phone8_with_ddd"
                      id="validationDefault04" placeholder="Telefone Fixo" maxlength="14">
                  </div>
                  <div class="col-md-3 input">
                    <label for="validationDefault05">Celular</label>
                    <input name="celular" type="text" class="form-control ls-mask-phone9_with_ddd"
                      id="validationDefault05" placeholder="Celular" maxlength="15">
                  </div>
                </div>

                <div align="center" class="form-row">

                  <div class="col-md-6  input">
                    <label for="validationDefault05">Senha</label>
                    <input name="senha" type="password" placeholder="***********" class="form-control" maxlength="10"
                      id="NovaSenha">
                  </div>
                  <div class="col-md-6 input">
                    <label for="validat ionDefault06">Confirme sua senha</label>
                    <input type="password" placeholder="***********" class="form-control" maxlength="10"
                      id="CNovaSenha">
                  </div>
                </div>
                <br>
                <div class="form-check form-check-inline politica">
                  <input type="checkbox" id="categoria" class="form-check-input" required="">
                  <button type="button" class="btn btn-link" data-toggle="modal" data-target="#exampleModalCenter">
                    Política de privacidade
                  </button>
                </div>
                <div class="center">
                  <div class="d-flex justify-content-center mt-3 login_container">
                    <br>
                    <button type="button" class="btn login_btn" id="adicionar" onclick="validarSenha()"
                      disabled="">Proximo</button>
                  </div>
                </div>
              </form>
            </div>

            <!-- divisa -->

            <div id="tab2" class="ls-tab-content">
              <form action="cadastrar_cliente.do" method="POST" id="FormSenha1" name="FormSenha1" data-ls-module="form">
                <div class="form-row" align="center">
                  <div class="col-md-6 input">
                    <label for="validationDefault01">CNPJ</label>
                    <input name="cpfCnpj" type="text" class="ls-mask-cnpj form-control " maxlength="18"
                      id="validationDefault01" placeholder="00.000.000/0000-00 " required="">
                  </div>
                  <div class="col-md-6 input">
                    <label for="validationDefault02">Nome Completo</label>
                    <input name="nome" type="text" class="form-control" id="validationDefault02"
                      placeholder="Ex: Pedro Álvares Cabral" onkeyup="maiuscula(this)" required="">
                  </div>
                </div>

                <div class="form-row " align="center">
                  <div class="col-md-6 input">
                    <label for="validationDefaultUsername">Email</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroupPrepend2">@</span>
                      </div>
                      <input name="eMail" type="EMAIL" class="form-control" placeholder="Email" size="50"
                        onkeyup="minuscula(this)">
                    </div>
                  </div>
                  <div class="col-md-3 input">
                    <label for="validationDefault04">Telefone Fixo</label>
                    <input name="telefone" type="text" class="form-control ls-mask-phone8_with_ddd"
                      id="validationDefault04" placeholder="Telefone Fixo" maxlength="14">
                  </div>
                  <div class="col-md-3 input">
                    <label for="validationDefault05">Celular</label>
                    <input name="celular" type="text" class="form-control ls-mask-phone9_with_ddd"
                      id="validationDefault05" placeholder="Celular" maxlength="15">
                  </div>
                </div>

                <div align="center" class="form-row">

                  <div class="col-md-6 input ">
                    <label for="validationDefault05">Senha</label>
                    <input name="senha" type="password" placeholder="***********" class="form-control" maxlength="10"
                      id="NovaSenha1">
                  </div>
                  <div class="col-md-6 input">
                    <label for="validationDefault06">Confirme sua senha</label>
                    <input type="password" placeholder="***********" class="form-control" maxlength="10"
                      id="CNovaSenha1">
                  </div>
                </div>
                <br>
                <div class="form-check form-check-inline politica">
                  <input type="checkbox" id="categoria1" class="form-check-input" required="">
                  <button type="button" class="btn btn-link" data-toggle="modal" data-target="#exampleModalCenter">
                    Política de privacidade
                  </button>
                </div>
                <div align="center">
                  <div class="d-flex justify-content-center mt-3 login_container">
                    <br>
                    <button type="button" class="btn login_btn" id="adicionar1" onclick="validarSenha1()"
                      disabled="">Proximo</button>
                  </div>
                </div>
              </form>
            </div>

          </div>
        </div>
        <a href="javascript:history.back()"> <button class="btn btn-outline-secondary btn-sm">voltar</button></a>
      </div>
    </div>
  </div>

  <footer id="myFooter">
    <div class="container">
      <div class="row">
        <div class="col-sm-3 info">
          <div id="img-footer">
            <img class=" img-fluid" src="https://atcawpbrasil.com.br/imagens/AWP_LOGO.png" alt="">
          </div>
        </div>
        <div class="col-sm-3 info">
          <h5>Loja Principal</h5>
          <a target="_blank" href="https://goo.gl/maps/4pPRgH8PooZJkhmq9">Loja - AWP Brasil</a></li>
        </div>
        <div class="col-sm-3 info">
          <h5>Contato</h5>
          <b>Telefone:</b><a href="tel:+556141049371">+55 61 4104-9371</a> <br>
          <b>Email:</b> <a href="mailto:contato@awpbrasil.com.br">contato@awpbrasil.com.br</a> <br>
        </div>
        <div class="col-sm-3 info">
          <h5><a target="_blank" href="locais_tipo_atendimento.jsp">Endereços</a> </h5>
          <p>SOFN Sofn Q 4 Conjunto A, 5 - Quadra 3, Lote Zona Industrial, Brasília - DF, 70634-300</p>
        </div>
      </div>
    </div>
    <div class="direitos">
         Site produzido por Gabriel Marinho <br>
         <a href="mailto:gabrielmarinhodossantocd@gmail.com"><img class="img-direitos" width="16px" height="16px"
                 src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTIiIHhtbDpzcGFjZT0icHJlc2VydmUiIGNsYXNzPSIiPjxnPjxwYXRoIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgZD0ibTQ2NyA2MWgtNDIyYy0yNC44MTMgMC00NSAyMC4xODctNDUgNDV2MzAwYzAgMjQuODEzIDIwLjE4NyA0NSA0NSA0NWg0MjJjMjQuODEzIDAgNDUtMjAuMTg3IDQ1LTQ1di0zMDBjMC0yNC44MTMtMjAuMTg3LTQ1LTQ1LTQ1em0tNjUuMTkgMzAtMTQ1LjgxIDEwOC43ODUtMTQ1LjgxLTEwOC43ODV6bS0zNTYuODEgMGgxNS4wMjFsMTg3LjAwOSAxMzkuNTIzYzIuNjYxIDEuOTg1IDUuODE1IDIuOTc3IDguOTcgMi45NzdzNi4zMDktLjk5MiA4Ljk3LTIuOTc3bDE4Ny4wMDktMTM5LjUyM2gxNS4wMjFjOC4yNjUgMCAxNC45ODkgNi43MTkgMTQuOTk5IDE0Ljk4MmwtMjI1Ljk5OSAxNjguNzk2LTIyNS45OTktMTY4Ljc5NmMuMDEtOC4yNjMgNi43MzQtMTQuOTgyIDE0Ljk5OS0xNC45ODJ6bTIwMi4wMjQgMjE0LjUxOGMyLjY2MiAxLjk4OCA1LjgxOSAyLjk4MiA4Ljk3NiAyLjk4MnM2LjMxNC0uOTk0IDguOTc2LTIuOTgybDE1Ny4wMjQtMTE3LjI4djIzMi43NjJoLTMzMnYtMjMyLjc2MnptLTIxNy4wMjQgMTAwLjQ4MnYtMjYyLjU3NWwzMCAyMi40MDd2MjU1LjE2OGgtMTVjLTguMjcxIDAtMTUtNi43MjktMTUtMTV6bTQzNyAxNWgtMTV2LTI1NS4xNjhsMzAtMjIuNDA3djI2Mi41NzVjMCA4LjI3MS02LjcyOSAxNS0xNSAxNXoiIGZpbGw9IiNmZmZmZmYiIGRhdGEtb3JpZ2luYWw9IiMwMDAwMDAiIHN0eWxlPSIiIGNsYXNzPSIiPjwvcGF0aD48L2c+PC9zdmc+" /></a>
         <a target="_blank"
             href="https://api.whatsapp.com/send?phone=5561993672608&text=Ol%C3%A1%20gostei%20do%20site%20AWP%2C%20podemos%20conversar%20sobre%20ele%3F%20%20">
             <img class="img-direitos" width="16px" height="16px"
                 src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDY4MiA2ODIuNjY2NjkiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTIiIHhtbDpzcGFjZT0icHJlc2VydmUiPjxnPjxwYXRoIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgZD0ibTU0NC4zODY3MTkgOTMuMDA3ODEyYy01OS44NzUtNTkuOTQ1MzEyLTEzOS41MDM5MDctOTIuOTcyNjU1OC0yMjQuMzM1OTM4LTkzLjAwNzgxMi0xNzQuODA0Njg3IDAtMzE3LjA3MDMxMiAxNDIuMjYxNzE5LTMxNy4xNDA2MjUgMzE3LjExMzI4MS0uMDIzNDM3IDU1Ljg5NDUzMSAxNC41NzgxMjUgMTEwLjQ1NzAzMSA0Mi4zMzIwMzIgMTU4LjU1MDc4MWwtNDQuOTkyMTg4IDE2NC4zMzU5MzggMTY4LjEyMTA5NC00NC4xMDE1NjJjNDYuMzI0MjE4IDI1LjI2OTUzMSA5OC40NzY1NjIgMzguNTg1OTM3IDE1MS41NTA3ODEgMzguNjAxNTYyaC4xMzI4MTNjMTc0Ljc4NTE1NiAwIDMxNy4wNjY0MDYtMTQyLjI3MzQzOCAzMTcuMTMyODEyLTMxNy4xMzI4MTIuMDM1MTU2LTg0Ljc0MjE4OC0zMi45MjE4NzUtMTY0LjQxNzk2OS05Mi44MDA3ODEtMjI0LjM1OTM3NnptLTIyNC4zMzU5MzggNDg3LjkzMzU5NGgtLjEwOTM3NWMtNDcuMjk2ODc1LS4wMTk1MzEtOTMuNjgzNTk0LTEyLjczMDQ2OC0xMzQuMTYwMTU2LTM2Ljc0MjE4N2wtOS42MjEwOTQtNS43MTQ4NDQtOTkuNzY1NjI1IDI2LjE3MTg3NSAyNi42Mjg5MDctOTcuMjY5NTMxLTYuMjY5NTMyLTkuOTcyNjU3Yy0yNi4zODY3MTgtNDEuOTY4NzUtNDAuMzIwMzEyLTkwLjQ3NjU2Mi00MC4yOTY4NzUtMTQwLjI4MTI1LjA1NDY4OC0xNDUuMzMyMDMxIDExOC4zMDQ2ODgtMjYzLjU3MDMxMiAyNjMuNjk5MjE5LTI2My41NzAzMTIgNzAuNDA2MjUuMDIzNDM4IDEzNi41ODk4NDQgMjcuNDc2NTYyIDE4Ni4zNTU0NjkgNzcuMzAwNzgxczc3LjE1NjI1IDExNi4wNTA3ODEgNzcuMTMyODEyIDE4Ni40ODQzNzVjLS4wNjI1IDE0NS4zNDM3NS0xMTguMzA0Njg3IDI2My41OTM3NS0yNjMuNTkzNzUgMjYzLjU5Mzc1em0xNDQuNTg1OTM4LTE5Ny40MTc5NjhjLTcuOTIxODc1LTMuOTY4NzUtNDYuODgyODEzLTIzLjEzMjgxMy01NC4xNDg0MzgtMjUuNzgxMjUtNy4yNTc4MTItMi42NDQ1MzItMTIuNTQ2ODc1LTMuOTYwOTM4LTE3LjgyNDIxOSAzLjk2ODc1LTUuMjg1MTU2IDcuOTI5Njg3LTIwLjQ2ODc1IDI1Ljc4MTI1LTI1LjA5Mzc1IDMxLjA2NjQwNi00LjYyNSA1LjI4OTA2Mi05LjI0MjE4NyA1Ljk1MzEyNS0xNy4xNjc5NjggMS45ODQzNzUtNy45MjU3ODItMy45NjQ4NDQtMzMuNDU3MDMyLTEyLjMzNTkzOC02My43MjY1NjMtMzkuMzMyMDMxLTIzLjU1NDY4Ny0yMS4wMTE3MTktMzkuNDU3MDMxLTQ2Ljk2MDkzOC00NC4wODIwMzEtNTQuODkwNjI2LTQuNjE3MTg4LTcuOTM3NS0uMDM5MDYyLTExLjgxMjUgMy40NzY1NjItMTYuMTcxODc0IDguNTc4MTI2LTEwLjY1MjM0NCAxNy4xNjc5NjktMjEuODIwMzEzIDE5LjgwODU5NC0yNy4xMDU0NjkgMi42NDQ1MzItNS4yODkwNjMgMS4zMjAzMTMtOS45MTc5NjktLjY2NDA2Mi0xMy44ODI4MTMtMS45NzY1NjMtMy45NjQ4NDQtMTcuODI0MjE5LTQyLjk2ODc1LTI0LjQyNTc4Mi01OC44Mzk4NDQtNi40Mzc1LTE1LjQ0NTMxMi0xMi45NjQ4NDMtMTMuMzU5Mzc0LTE3LjgzMjAzMS0xMy42MDE1NjItNC42MTcxODctLjIzMDQ2OS05LjkwMjM0My0uMjc3MzQ0LTE1LjE4NzUtLjI3NzM0NC01LjI4MTI1IDAtMTMuODY3MTg3IDEuOTgwNDY5LTIxLjEzMjgxMiA5LjkxNzk2OS03LjI2MTcxOSA3LjkzMzU5NC0yNy43MzA0NjkgMjcuMTAxNTYzLTI3LjczMDQ2OSA2Ni4xMDU0NjlzMjguMzk0NTMxIDc2LjY4MzU5NCAzMi4zNTU0NjkgODEuOTcyNjU2YzMuOTYwOTM3IDUuMjg5MDYyIDU1Ljg3ODkwNiA4NS4zMjgxMjUgMTM1LjM2NzE4NyAxMTkuNjQ4NDM4IDE4LjkwNjI1IDguMTcxODc0IDMzLjY2NDA2MyAxMy4wNDI5NjggNDUuMTc1NzgyIDE2LjY5NTMxMiAxOC45ODQzNzQgNi4wMzEyNSAzNi4yNTM5MDYgNS4xNzk2ODggNDkuOTEwMTU2IDMuMTQwNjI1IDE1LjIyNjU2Mi0yLjI3NzM0NCA0Ni44Nzg5MDYtMTkuMTcxODc1IDUzLjQ4ODI4MS0zNy42Nzk2ODcgNi42MDE1NjMtMTguNTExNzE5IDYuNjAxNTYzLTM0LjM3NSA0LjYxNzE4Ny0zNy42ODM1OTQtMS45NzY1NjItMy4zMDQ2ODgtNy4yNjE3MTgtNS4yODUxNTYtMTUuMTgzNTkzLTkuMjUzOTA2em0wIDAiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZmlsbD0iI2ZmZmZmZiIgZGF0YS1vcmlnaW5hbD0iIzAwMDAwMCIgc3R5bGU9IiI+PC9wYXRoPjwvZz48L3N2Zz4=" />
         </a>
     </div>

  </footer>

  <!-- Button trigger modal -->


  <!-- Modal -->
  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
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
            Quando você realiza alguma transação com nossa loja, como parte do processo de compra e venda,coletamos as
            informações pessoais que você nos dá tais como: nome, e-mail e endereço.
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
          <br />
          <div class="center">
            <img style=" max-width: 200px; max-height: 150px;" src="imagens/logo-ups.png" />
            <img style=" max-width: 200px; max-height: 150px;" src="imagens/logo_protecline_colorida.png" alt="" />
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
        </div>
      </div>
    </div>
  </div>


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
  <script src="javascripts/locastyle.js" type="text/javascript"></script>
</body>

</html>