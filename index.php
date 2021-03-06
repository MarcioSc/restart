<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login</title>
    <!-- Núcleo CSS do Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- Add custom CSS here -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"> <link rel="icon" type="image/png" href="favicon.png" />
  </head>
<body onLoad="document.frmEnviaDados.usuario.focus();">
      <div class="col-lg-4"></div>
        <div class="col-lg-4">
          <div class="panel panel-default" style="border: 1px solid #D0D0D0;">
            <!-- Default panel contents -->
            <?php
              if (!empty($_POST)) {
                if (isset($_POST['usuario'], $_POST['senha'])) {
                  include_once 'classes/usuario.class.php';
                  $usuario = $_POST['usuario'];
                  $senha = $_POST['senha'];
                  $query  = new Usuario;
                  $result = $query->login($usuario, $senha);
                  if(is_bool($query) && $_POST['cookieCheck']=="yep"){
                      setcookie('login', $usuario, (time() + (24 * 3600)));
                      setcookie('senha', $senha, (time() + (24 * 3600)));
                  }
                  unset($query);
                }
              }
            ?>
            <div class="panel-body">
              <center><p><img src="logo.png" class="img-responsive" alt="Restart"></p></center>
              <?php if (isset($result)){ if (!is_bool($result)){ echo "<div id='login_error' style='color:#D00000;'>".$result."</div>";}}else{echo "<br>";}?><br>
              <form role="form" method="post" name="frmEnviaDados" action="index.php">
                <div class="input-group">
                  <span class="input-group-addon"><i placeholder="Matrícula" class="glyphicon glyphicon-user"></i></span>
                  <input type="text" class="form-control" name="usuario" value="<?php if (isset($usuario)){ echo $usuario;}?>" placeholder="Matrícula" required autocomplete="off">
                </div>
                <div class="input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                  <input type="password" class="form-control" name="senha" placeholder="Senha" required autocomplete="off">
                </div>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="cookieCheck" value="yep"> Mantenha-me conectado
                  </label>
                </div>
                <br>
              <button type="submit" class="btn btn-default">Entrar</button>
              <br><br>
              <div class="input-group">
                <a href="recuperarSenha.php">Esqueceu sua senha?</a>
              </div>
              </form>
            </div>
        </div><!-- /.row -->
      <div class="col-lg-4"></div>
 <!-- JavaScript -->
    <script src="js/jquery-2.0.3.min.js"></script>
    <script src="js/bootstrap.js"></script>
  </body>
</html>