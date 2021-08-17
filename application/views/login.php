<!DOCTYPE html>
<html>

<head>
  <title><?php echo $aplikasi->title; ?> | Login</title>
  <link rel="stylesheet" href="<?php echo base_url(); ?>assets/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="<?= base_url(); ?>assets/login/css/style.css">
  <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/a81368914c.js"></script>
  <link rel="stylesheet" href="<?php echo base_url(); ?>assets/modules/izitoast/css/iziToast.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
  <img class="wave" src="<?= base_url(); ?>assets/login/img/wave.png">
  <div class="container">
    <div class="img">
      <img src="<?= base_url(); ?>assets/login/img/log.svg">
    </div>
    <div class="login-content">
      <form id="loginForm" action="">
        <img style="text-align:center;"src="<?php echo base_url();?>assets/foto/logo/<?php echo $aplikasi->logo; ?>">
        <h2 class="title"><?php echo $aplikasi->nama_aplikasi; ?></h2>
        <div class="form-group">
          <label>Username</label>
          <div class="input-group kosong">
            <div class="input-group-prepend">
              <div class="input-group-text">
                <i class="fas fa-user"></i>
              </div>
            </div>
            <input type="text" class="form-control" id="username" name="username" required="" autocomplete="off">
          </div>
        </div>
        <div class="form-group">
          <label style="text-align:left;">password</label>
          <div class="input-group kosong">
            <div class="input-group-prepend">
              <div class="input-group-text">
                <i class="fas fa-lock"></i>
              </div>
            </div>
            <input type="password" class="form-control" id="password" name="password" autocomplete="off" required>

          </div>
          <div class="">

          </div>
        </div>


        <button type="button" id="login" class="btn btn-primary float-right btn-inline mb-2">Login</button>
      </form>
    </div>
  </div>
  <script src="<?= base_url(); ?>assets/login/js/main.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
  <script src="<?php echo base_url();?>assets/modules/jquery-validation/jquery.validate.min.js"></script>
  <script src="<?php echo base_url();?>assets/modules/jquery-validation/additional-methods.min.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/izitoast/js/iziToast.min.js"></script>
  <script src="<?php echo base_url(); ?>assets/modules/bootstrap/js/bootstrap.min.js"></script>
  <script>
    $(document).ready(function () {
      $("#login").click(function (e) {
        e.preventDefault();
        $.ajax({
          url: '<?php echo base_url('Login/login') ?>',
          type: 'POST',
          data: $('#loginForm').serialize(),
          dataType: 'JSON',
          success: function (data) {
            if (data.status) {
              iziToast.success({
                title: 'Sukses!',
                message: 'Berhasil Login',
                position: 'topRight'
              });
              setTimeout(function () {
                var url = '<?php echo base_url('dist') ?>';
                window.location = url;
              }, 1500);

            } else if (data.error) {
              iziToast.error({
                title: 'Gagal!',
                message: data.pesan,
                position: 'topRight'
              });
            } else {
              for (var i = 0; i < data.inputerror.length; i++) {
                $('[name="' + data.inputerror[i] + '"]').addClass('is-invalid');
                $('[name="' + data.inputerror[i] + '"]').closest('.kosong').append('<span></span>');
                $('[name="' + data.inputerror[i] + '"]').next().text(data.error_string[i]).addClass(
                  'invalid-feedback');
              }
            }
          }
        });

      });

      $("input").change(function () {
        $(this).parent().parent().removeClass('has-error');
        $(this).next().empty();
        $(this).removeClass('is-invalid');
      });
    });
  </script>

</body>


</html>