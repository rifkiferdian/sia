
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>SIAKAD</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.4/css/buttons.bootstrap.min.css">
   <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="plugins/select2/select2.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="css/skins/_all-skins.min.css">
  <!-- <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.4/css/buttons.dataTables.min.css"> -->
  <link rel="stylesheet" href="css/asilah.css">
  <link rel="stylesheet" href="css/AdminLTE.css">


  <?= $this->tag->javascriptInclude('plugins/jQuery/jquery-2.2.4.min.js') ?>
  <?= $this->tag->javascriptInclude('js/asilah.js') ?>

<script type="text/javascript">
  var base_url = '<?= BASE_URL; ?>';
  localStorage.setItem('base_url', base_url);
</script>
  </head>
  <body class=" skin-purple hold-transition skin-blue sidebar-mini">
  <?php 
 // echo "<pre>".print_r($menu,1)."</pre>"; 
 ?>
    <!-- Site wrapper -->
    <div class="wrapper">

      <header class="main-header">
        <!-- Logo -->
        <a href="../../index2.html" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>A</b>LT</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>Admin</b>LTE</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->
              <li class="dropdown messages-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-envelope-o"></i>
                  <span class="label label-success">4</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 4 messages</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li><!-- start message -->
                        <a href="#">
                          <div class="pull-left">
                            <img src="img/user1-128x128.jpg" class="img-circle" alt="User Image">
                          </div>
                          <h4>
                            Support Team
                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li><!-- end message -->
                    </ul>
                  </li>
                  <li class="footer"><a href="#">See All Messages</a></li>
                </ul>
              </li>
              <!-- Notifications: style can be found in dropdown.less -->
              <li class="dropdown notifications-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-bell-o"></i>
                  <span class="label label-warning">10</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 10 notifications</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li>
                        <a href="#">
                          <i class="fa fa-users text-aqua"></i> 5 new members joined today
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="footer"><a href="#">View all</a></li>
                </ul>
              </li>
              <!-- Tasks: style can be found in dropdown.less -->
              <li class="dropdown tasks-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-flag-o"></i>
                  <span class="label label-danger">9</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 9 tasks</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li><!-- Task item -->
                        <a href="#">
                          <h3>
                            Design some buttons
                            <small class="pull-right">20%</small>
                          </h3>
                          <div class="progress xs">
                            <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                              <span class="sr-only">20% Complete</span>
                            </div>
                          </div>
                        </a>
                      </li><!-- end task item -->
                    </ul>
                  </li>
                  <li class="footer">
                    <a href="#">View all tasks</a>
                  </li>
                </ul>
              </li>
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="img/user1-128x128.jpg" class="user-image" alt="User Image">
                  <span class="hidden-xs"><?= $this->session->get('nama'); ?></span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="img/user1-128x128.jpg" class="img-circle" alt="User Image">
                    <p>
                      Alexander Pierce - Web Developer
                      <small>Member since Nov. 2012</small>
                    </p>
                  </li>
                  <!-- Menu Body -->
                  <li class="user-body">
                    <div class="col-xs-4 text-center">
                      <a href="#">Followers</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Sales</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Friends</a>
                    </div>
                  </li>
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Profile</a>
                    </div>
                    <div class="pull-right">
                      <a href="account/logout" class="btn btn-default btn-flat">Sign out</a>
                    </div>
                  </li>
                </ul>
              </li>
              <!-- Control Sidebar Toggle Button -->
              <li>
                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
              </li>
            </ul>
          </div>
        </nav>
      </header>

      <!-- =============================================== -->

      <!-- Left side column. contains the sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="img/user1-128x128.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p><?= $this->session->get('nama'); ?></p>
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>
          <div id="manu">
          
          </div>
        </section>
        <!-- /.sidebar -->
      </aside>


<div class="content-wrapper" style="height: 1500px;">
	<?= $this->getContent() ?>
</div>
	<footer class="main-footer">
	    <div class="container">
	      <strong>Copyright &copy; 2016 <a href="#"> As-Shilah</a>.</strong> All rights
	      reserved.
	    </div>
	    <!-- /.container -->
	</footer>
	</div>
	<!-- ./wrapper -->

	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
	
	<!-- Bootstrap 3.3.6 -->
	<script src="bootstrap/js/bootstrap.min.js"></script>

	<script src="js/jquery.maskMoney.min.js"></script>
	<!-- jquery InputMask -->
	<script src="plugins/input-mask/jquery.inputmask.js"></script>
	<script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script src="plugins/input-mask/jquery.inputmask.numeric.extensions.js"></script>

	<!-- DataTables -->
	<script src="plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>

	<script src="https://cdn.datatables.net/buttons/1.2.4/js/dataTables.buttons.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.2.4/js/buttons.bootstrap.min.js"></script>
	<script src="//cdn.datatables.net/buttons/1.2.4/js/buttons.flash.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
	<script src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
	<script src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
	<script src="//cdn.datatables.net/buttons/1.2.4/js/buttons.html5.min.js"></script>
	<script src="//cdn.datatables.net/buttons/1.2.4/js/buttons.print.min.js "></script>

	<script src="plugins/select2/select2.full.min.js"></script>

	<!-- bootstrap datepicker -->
	<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
	<!-- SlimScroll -->
	<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="js/demo.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<!-- PNotify -->
  	<?= $this->tag->javascriptInclude('plugins/notify/pnotify.core.js') ?>
	<?= $this->tag->javascriptInclude('plugins/notify/pnotify.buttons.js') ?>
	<?= $this->tag->javascriptInclude('plugins/notify/pnotify.nonblock.js') ?> 
	  
	<div id='notif' style="opacity: 0.7;" class="notif alert  alert-dismissible">
	    <h4><i class="icon fa fa-check"></i> <span class='notif-title'>Alert!</span></h4>
	    <div class='notif-body'>Success alert preview. This alert is dismissable.</div>
	  </div>
</body>
</html>

<script type="text/javascript">

$( document ).ready(function() {
    var link = "<?= $this->url->get('index/menuArea') ?>";
    $.ajax({
        method: "GET",
        dataType: "html",
        url: link,
        success: function(res){
            $('#manu').html(res);
        }
    });
});

function menu(id){
	var link = "<?= $this->url->get('index/menuUser?id=') ?>"+id;
	// alert(link);
	$.ajax({
          type: "GET",
          dataType: "html",
          url: link,
          success: function(data){
          	// console.log(data); 
              $('#manu').html(data);
          }
    });
	
}

function back_menu(){
	var link = "<?= $this->url->get('index/menuArea') ?>";
    $.ajax({
        method: "GET",
        dataType: "html",
        url: link,
        success: function(res){
            $('#manu').html(res);
        }
    });
}

</script>