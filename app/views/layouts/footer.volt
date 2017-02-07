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
  	{{ javascript_include("plugins/notify/pnotify.core.js") }}
	{{ javascript_include("plugins/notify/pnotify.buttons.js") }}
	{{ javascript_include("plugins/notify/pnotify.nonblock.js") }} 
	  
	<div id='notif' style="opacity: 0.7;" class="notif alert  alert-dismissible">
	    <h4><i class="icon fa fa-check"></i> <span class='notif-title'>Alert!</span></h4>
	    <div class='notif-body'>Success alert preview. This alert is dismissable.</div>
	  </div>
</body>
</html>

<script type="text/javascript">

$( document ).ready(function() {
    var link = "{{url('index/menuArea')}}";
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
	var link = "{{url('index/menuUser?id=')}}"+id;
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
	var link = "{{url('index/menuArea')}}";
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