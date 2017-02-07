<section class="content-header">
  <h1>
    Access Control LIST
    <small>it all starts here</small>
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
    <li><a href="#">Examples</a></li>
    <li class="active">Blank page</li>
  </ol>
</section>

<!-- Main content -->
<section class="content"> 

<?php //echo "<pre>".print_r($parent,1)."</pre>"; ?>


<div class="col-md-12">
  <div class="box">
      <div class="box-header">
        <h3 class="box-title">Add</h3>
      </div><!-- /.box-header -->
      <div class="box-body">
        <div class="form-inline">
          <div class="form-group">
            <label>Controller:</label><br>
            <input type="text" class="form-control" id="controller">
          </div>
          <div class="form-group">
            <label>Action:</label><br>
            <input type="text" class="form-control" id="action">
          </div>
          <div class="form-group">
            <label for="sel1">is menu:</label><br>
            <select class="form-control" id="is_menu">
              <option value="Y">Y</option>
              <option value="N">N</option>
            </select>
          </div>
          <div class="form-group">
            <label>Label Menu:</label><br>
            <input type="text" class="form-control" id="label_menu">
          </div>
          <div class="form-group">
            <label>Icon Menu:</label><br>
            <input type="text" class="form-control" id="icon">
          </div>
          <div class="form-group">
            <label>Parent:</label><br>
            <input type="text" class="form-control" id="parent" value="0">
          </div>
          <div class="form-group">
            <label>child:</label><br>
            <input type="text" class="form-control" id="child">
          </div>
          <div class="form-group">
            <label>Usergroup:</label><br>
            <input type="text" class="form-control" id="usergroup">
          </div>

          <div class="form-group">
            <label>Multiple</label>
            <select id="asd" class="form-control select2" multiple="multiple" data-placeholder="Select a State" style="width: 100%;">
              <?php foreach ($usergroup as $key => $value): ?>
                <option value="<?= $value['id'] ?>"><?= $value['nama'] ?></option>            
              <?php endforeach ?>
            </select>
          </div>
          <div class="form-group">
            <label>Kecuali User:</label><br>
            <input type="text" class="form-control" id="except_user">
          </div>
          <div class="form-group">
            <label for="sel1">Aktif:</label><br>
            <select class="form-control" id="aktif">
              <option value="Y">Y</option>
              <option value="N">N</option>
            </select>
          </div>

          <button style="    margin-top: 25px;" onclick="add_acl()" class="btn btn-default">Submit</button>
        </div>
      </div>
  </div>
</div>
     <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-heading"><h3>ACL</h3></div>

          <div class="panel-body">

            <table class="table table-condensed" style="border-collapse:collapse;">
                <thead>
                    <tr>
                        <th style="width: 25px;">id</th>
                        <th style="width: 100px;">Label</th>
                        <th style="width: 100px;">Controller</th>
                        <th style="width: 100px;">Action</th>
                        <th style="width: 100px;">Anak</th>
                        <th style="width: 100px;">Usergrop</th>
                        <th style="width: 100px;">Kecuali User</th>
                        <th style="width: 100px;">Aktif</th>
                        <th style="width: 130px;">action</th>
                    </tr>
                </thead>
                <tbody>

            <?php 

            function loop($acl)
            {
              foreach ($acl as $key => $value) {
                if (!empty($value['child'])) {

                  if ($value['action'] == '') {$ac = 'Index';}else{$ac = $value['action'];}
                  if ($value['anak'] == '') {$ana = 'NULL';}else{$ana = $value['anak'];}
            ?>

                  <tr style="color: blue;" data-toggle="collapse" data-target="#demo<?=$value['id']?>" class="accordion-toggle">

                          <td style="width: 25px;"><?=$value['id']?></td>
                          <td style="width: 100px;"><i class="fa <?= $value['icon'] ?>"></i> <?=$value['label_menu']?></td>
                          <td style="width: 100px;"><?=$value['controller']?></td>
                          <td style="width: 100px;"><?=$ac?></td>
                          <td style="width: 100px;"><?=$ana?></td>
                          <td style="width: 100px;"><?=$value['usergroup_id']?></td>
                          <td style="width: 100px;"><?=$value['except_user']?></td>
                          <td style="width: 100px;"><?=$value['aktif']?></td>
                          <td style="width: 130px;">

                            <div class="btn-group">
                                <button type="button" class="btn btn-xs btn-flat btn-info"><i class="fa fa-pencil"></i> Edit</button>
                                <button onclick=" delete_acl('<?=$value['id']?>')" type="button" class="btn btn-xs btn-flat btn-danger"><i class="fa fa-trash"></i> Delete</button>
                              </div>

                          </td>
                      </tr>
                      <tr>
                          <td colspan="6" class="hiddenRow">
                            <div style="    width: 148%; " id="demo<?=$value['id']?>" class="accordian-body collapse">
                              <table class="table table-condensed" style="border-collapse:collapse;">
                              <tr>
                                <th style="width: 25px;">id</th>
                                <th style="width: 100px;">Label</th>
                                <th style="width: 100px;">Controller</th>
                                <th style="width: 100px;">Action</th>
                                <th style="width: 100px;">Anak</th>
                                <th style="width: 100px;">Usergrop</th>
                                <th style="width: 100px;">Kecuali User</th>
                                <th style="width: 100px;">Aktif</th>
                                <th style="width: 130px;">Action</th>
                            </tr>

                                <tbody>

                                  <?php loop($value['child']);  ?>
                                            
                                </tbody>

                              </table>
                            </div>
                            </td>
                      </tr> 

            <?php }else{
                  if ($value['action'] == '') {$ac = 'Index';}else{$ac = $value['action'];}
                  if ($value['anak'] == '') {$ana = 'NULL';}else{$ana = $value['anak'];}
            ?>
                  <tr>
                            <td style="width: 25px;"><?=$value['id']?></td>
                            <td style="width: 100px;"><i class="fa <?= $value['icon'] ?>"></i> <?=$value['label_menu']?></td>
                            <td style="width: 100px;"><?=$value['controller']?></td>
                            <td style="width: 100px;"><?=$ac?></td>
                            <td style="width: 100px;"><?=$ana?></td>
                            <td style="width: 100px;"><?=$value['usergroup_id']?></td>
                            <td style="width: 100px;"><?=$value['except_user']?></td>
                            <td style="width: 100px;"><?=$value['aktif']?></td>
                            <td style="width: 130px;">

                              <div class="btn-group">
                                <button type="button " class="btn btn-xs btn-flat btn-info"><i class="fa fa-pencil"></i> Edit</button>
                                <button onclick=" delete_acl('<?=$value['id']?>') " type="button" class="btn btn-xs btn-flat btn-danger"><i class="fa fa-trash"></i> Delete</button>
                              </div>

                            </td>
                    </tr>
            <?php
                }
              }
            }
            ?>
            <?php loop($acl); ?> 
            </tbody>
            </table>
          </div>              
        </div>         
      </div>

<div class="col-md-12">
  <div class="box">
      <div class="box-header">
        <h3 class="box-title">Usergroup</h3>
      </div><!-- /.box-header -->
      <div class="box-body">
        <table id="example1" class="table table-bordered table-hover">
          <thead>
            <tr>
              <th>Id</th>
              <th>Nama</th>
              <th>Deskripsi</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($usergroup as $key => $value): ?>
  
              <tr>
                <td><?= $value['id'] ?></td>
                <td><?= $value['nama'] ?></td>
                <td><?= $value['deskripsi'] ?></td>
              </tr>
            
            <?php endforeach ?>
            
          </tbody>
        </table>
      </div><!-- /.box-body -->
  </div>
</div>
      
</section><!-- /.content -->

<script>
  $(function () {
    $("#example1").DataTable();
    $(".select2").select2();
  });

  function add_acl() {
    var controller = $("#controller").val();
    var action = $("#action").val();
    var is_menu = $("#is_menu").val();
    var label_menu = $("#label_menu").val();
    var icon = $("#icon").val();
    var parent = $("#parent").val();
    var child = $("#child").val();
    var usergroup = $("#usergroup").val();
    var except_user = $("#except_user").val();
    var aktif = $("#aktif").val();

    var datas = "controller="+controller+"&action="+action+"&is_menu="+is_menu+"&label_menu="+label_menu+"&icon="+icon+"&parent="+parent+"&child="+child+"&usergroup="+usergroup+"&except_user="+except_user+ "&aktif="+ aktif;
    var urel = '{{ url("acl/addAcl") }}';
    $.ajax({
       type: "POST",
       url: urel,
       dataType : "JSON",
       data: datas
    }).done(function( data ) {
       console.log(data);
        if( data.status == true ) {
          reload_page('acl','acl');
          notif('success','Data Update','Saved!!');        
        }else {  
          notif('warning','Warning','Error Saved!!');        
        }
    });
  }

  function delete_acl(id){
    // alert('asdasd');
    var urel = '{{ url("acl/deleteAcl") }}/'+id;
    if(confirm('Apakah Anda Yakin menghapus data ini?')){
      $.ajax({
          type: "POST",
          dataType: "JSON",
          url: urel,
          success: function(data){ 
              console.log(data);
              reload_page('acl','acl');
              if( data.status == true ) {
                notif('success','Deleted','Delete Berhasil!!');
              }else {  
                notif('warning','Warning','Delete Error!!');        
              }
          }
      });
    }
  }

</script>
