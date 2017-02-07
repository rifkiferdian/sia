<ul class="sidebar-menu">
    <li class="header">MAIN NAVIGATION </li>

    <li><a href="<?= BASE_URL ?>/" class="historyAPI" onclick="return load_page('index/index2','index2')"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
    <?php 

    function loop($menu)
    {
      foreach ($menu as $key => $value) {
        if (!empty($value['child'])) {

          echo "<li class=\"treeview\">
          <a href=\"#\" >

            <i class=\"fa ".$value['icon']."\"></i> 
            <span>".$value['label_menu']."</span> 
            <i class=\"fa fa-angle-left pull-right\"></i>
            
          </a>
          <ul class=\"treeview-menu\"> ";
            loop($value['child']);
          echo "</ul>
        </li> ";
        }else{
          echo "<li><a href=\"".BASE_URL.$value['controller'].'/'.$value['action']."\" class=\"historyAPI\" onclick=\"return load_page('".$value['controller'].'/'.$value['action']."','page_".$value['controller'].'/'.$value['action']."')\" ><i class=\"fa ".$value['icon']."\"></i> <span>".$value['label_menu']."</span></a>";
        }
      }
    }

    ?>
    <?php loop($menu); ?>    

    <li class="header">Back</li>     
  	<li><a href="javascript:void(0)" onclick="back_menu()"><i class="fa fa-circle-o text-yellow"></i> <span>Pilih Area</span></a></li>         
    
  </ul>