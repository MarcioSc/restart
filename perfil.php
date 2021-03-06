<?php
  include 'classes/usuario.class.php';
include 'classes/log.class.php';
include 'classes/ocorrencia.class.php';
$pageTitle  = "Atualizar perfil";
  include 'nucleo/cabecario.php';
  include("nucleo/barraLateral.php");
      // Verifica se algum form foi enviado
    if (!empty($_POST)) {
$LOG = new LOG;
      // Verifica se as variáveis relacionadas ao cadastro/edição existem
      if (isset($_POST['nome'])) {
        include_once 'nucleo/funcoes.php';
        include_once 'upload_image.php';
        $nome   = $_POST['nome'];
        $sobrenome   = $_POST['sobrenome'];
        $email    = $_POST['email'];
        if ($_POST['senhaRadio'] == 0) {
            $senha    = $_POST['antigasenha'];//A senha já está criptografada
          } else if ($_POST['senhaRadio'] == 1) {
              $senha    = $_POST['novasenha'];
              $senha = ((strlen($senha) != 60) && (strlen($senha) != 0)) ? criptografar_senha($senha) : $senha ;
          }
        $telefone_residencial    = $_POST['telefone_residencial'];
        $telefone_celular    = $_POST['telefone_celular'];
        // Verifica se será realizado EDIÇÃO
        if ($_POST['acao'] == 'atualiza') {
          $editUser = new Usuario;
          $result = $editUser->atualizarPerfil($_SESSION['matricula'], $nome, $sobrenome, $email, $senha, $telefone_residencial, $telefone_celular, $avatar);
           if (is_bool($result)) {
              echo "<!-- Modal -->
                    <div class='modal fade bs-modal-sm' id='modal_editPerfil' tabindex='-1' role='dialog' aria-labelledby='modal_editPerfilLabel' aria-hidden='true'>
                      <div class='modal-dialog modal-sm'>
                        <div class='modal-content panel-success'>
                          <div class='modal-header panel-heading'>
                            <button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>
                            <h4 class='modal-title' id='modal_editPerfilLabel'>Perfil atualizado!</h4>
                          </div>
                        </div>
                      </div>
                    </div> <meta http-equiv='refresh' content='2'>";
            }
            else {
              echo "<!-- Modal -->
                    <div class='modal fade' id='modal_editPerfil' tabindex='-1' role='dialog' aria-labelledby='modal_editPerfilLabel' aria-hidden='true'>
                      <div class='modal-dialog'>
                        <div class='modal-content panel-danger'>
                          <div class='modal-header panel-heading'>
                            <button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>
                            <h4 class='modal-title' id='modal_editPerfilLabel'>Não foi possível atualizar seu perfil</h4>
                          </div>
                          <div class='modal-body'>
                            <p>".$result."</p>
                          <br><br><p><b>Contate à COLINF</b></p>
                          </div>
                        </div>
                      </div>
                    </div>";
            }
          unset($editUser);
          echo "<script>$('#modal_editPerfil').modal('show');</script>";
        }
      }
  }
  $user = new Usuario;
    ?>
    <div id="page-wrapper">
      <div class="row">
        <div class="col-lg-12">
          <h1>Atualizar perfil</h1>
          <ol class="breadcrumb">
            <li class="active"><i class="glyphicon glyphicon-user"></i> Perfil</li>
          </ol>
        </div>
      </div><!-- /.row -->
      <form role="form" class="validatedForm"  id="perfil" action="perfil.php" method="post" enctype='multipart/form-data'>
      <div class="row">
        <div class="col-lg-4" align="center">
            <div class="form-group">
              <div class="fileinput fileinput-new" data-provides="fileinput">
                <div class="fileinput-new thumbnail" style="width: 120px; height: 120px;">
                  <img src="img/<?php echo $user->obterDados('avatar', $_SESSION['matricula']);?>">
                </div>
                <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 120px; max-height: 120px;"></div>
                <div>
                  <span class="btn btn-default btn-file">
                    <span class="fileinput-new">Selecionar uma imagem</span>
                    <span class="fileinput-exists">Mudar</span>
                    <input type="file" name="avatar" accept="image/jpeg,image/pjpeg,image/bmp,image/gif,image/jpeg,image/png"/>
                  </span>
                  <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remover</a>
                </div>
              </div>
            </div>
        </div>
            <div class="col-lg-4">
              <input type="hidden" name="acao" value="atualiza">
              <div class="form-group">
                <label>Nome</label>
                <input class="form-control" type="text" id="nome" name="nome" value="<?php echo $user->obterDados('nome', $_SESSION['matricula']);?>" required autocomplete="off">
              </div>
              <div class="form-group">
                <label>Sobrenome</label>
                <input class="form-control" id="sobrenome" name="sobrenome" value ="<?php echo $user->obterDados('sobrenome', $_SESSION['matricula']);?>" required autocomplete="off">
              </div>
              <div class="radio">
                  <input type="radio" name="senhaRadio" id="senhaRadio" value="0" onClick="Disab(this.value)" checked>
                  <input type="hidden" id="antigasenha" name="antigasenha" value="<?php echo $user->obterDados('senha', $_SESSION['matricula']);?>">
                  <label> Desejo continuar com a mesma senha</label>
              </div>
              <div class="form-group">
                <label>
                  <div class="radio">
                    <input type="radio" name="senhaRadio" id="senhaRadio" value="1"  onClick="Disab(this.value)">
                    <input class="form-control" type="password" maxlength="10" id="novasenha" placeholder="Nova senha" name="novasenha" required autocomplete="off">
                    <input class="form-control" type="password" maxlength="10" placeholder="Confirma" id="confirma" name="confirmsenha" required autocomplete="off">
                  </div>
                </label>
              </div>
            </div>
        <div class="col-lg-4">
            <div class="form-group">
              <label>Email</label>
              <input type="email" class="form-control" id="email" name="email" value="<?php echo $user->obterDados('email', $_SESSION['matricula']);?>" required autocomplete="off">
            </div>
            <div class="form-group">
              <label>Telefone Residencial</label>
              <input class="form-control" type="text" id="telefone_residencial" name="telefone_residencial" value="<?php echo $user->obterDados('telefone_residencial', $_SESSION['matricula']);?>" data-mask="(99) 9999-9999" required autocomplete="off">
            </div>
            <div class="form-group">
              <label>Telefone celular</label>
              <input class="form-control" type="text" id="telefone_celular" name="telefone_celular" value="<?php echo $user->obterDados('telefone_celular', $_SESSION['matricula']);?>" data-mask="(99) 9999-9999" required autocomplete="off">
            </div>
            <div class="form-group" align="right"><br>
              <button type="submit" class="btn btn-default">Atualizar</button>
              <button type="reset" class="btn btn-default">Desfazer</button>
            </div>
        </div>
      </div><!-- /.row -->
      </form>
<?php
unset($user);
?>
    </div><!-- /#page-wrapper -->
  </div><!-- /#wrapper -->
  <script src="js/inputmask.js"></script>
  <script src="js/jquery.validate.js"></script>
  <script>
jQuery('.validatedForm').validate({
      rules : {
        confirmsenha : {
          equalTo : "#novasenha"
        }
      }
    });
$('submit-button').click(function(){
    console.log($('.validatedForm').valid());
});
$("#senhaRadio").click(function () {
  $("div.form-group").find('label.error').remove();
  $("div.form-group").find('input').removeClass('valid error');
});
</script>
  <SCRIPT LANGUAGE="JavaScript">
function Disab (val) {
if(document.getElementById('senhaRadio').checked) {
  document.getElementById('novasenha').disabled = true;
  document.getElementById('confirma').disabled = true;
  document.getElementById('novasenha').value = "";
  document.getElementById('confirma').value = "";
}
else {
  document.getElementById('novasenha').disabled = false;
  document.getElementById('confirma').disabled = false;
}
}
if(document.getElementById('senhaRadio').checked) {
  document.getElementById('novasenha').disabled = true;
  document.getElementById('confirma').disabled = true;
  document.getElementById('novasenha').value = "";
  document.getElementById('confirma').value = "";
}
else {
  document.getElementById('novasenha').disabled = false;
  document.getElementById('confirma').disabled = false;
}
$('.fileinput').fileinput();
</script>
  <?php ?>
</body>
</html>