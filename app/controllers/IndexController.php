<?php
use Phalcon\Mvc\View;
use Phalcon\Mvc\Controller;

class IndexController extends ControllerBase
{

    public function initialize()
    {
        if (empty($this->session->get('uid'))) {
            $this->response->redirect('account/loginEnd');
        }
    }

    public function indexAction()
    {

        if (empty($this->session->get('uid'))) {
            $this->response->redirect('account/login');
        }else{
            $this->view->menu=$this->menuAction();
        }
        
        // $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    }


    public function index2Action()
    {

        if (empty($this->session->get('uid'))) {
            $this->response->redirect('account/loginEnd');
        }else{
            $this->view->menu=$this->menuAction();
        }
        
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    }

    public function menuAreaAction()
    {
        if (empty($this->session->get('uid'))) {
            $this->response->redirect('account/loginEnd');
            die();
        }
        $usergroup = $this->session->get('usergroup');
        $uid = $this->session->get('id');
        if (!empty($usergroup)) {
            $ug_arr=explode(",",$usergroup);
            foreach ($ug_arr as $k => $v) {
                if ($v!='') {
                    $ug_sql[]="usergroup_id like '%,$v,%'";
                }
            }
        }
        $ug_sql_string=implode(" or ",$ug_sql);

        $phql = "SELECT * from Acl where is_menu = 'Y' and parent = 'area' and ($ug_sql_string) ";
        $menu = $this->modelsManager->executeQuery($phql)->toArray();
        $this->view->menuArea = $menu;
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    }

    public function menuUserAction()
    {
        $id = $_GET['id'];
        $this->view->menu=$this->menuAction($id);
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    }

    
    public function menuAction($id){

        $usergroup = $this->session->get('usergroup');
        $uid = $this->session->get('id');
        if (!empty($usergroup)) {
            $ug_arr=explode(",",$usergroup);
            foreach ($ug_arr as $k => $v) {
                if ($v!='') {
                    $ug_sql[]="usergroup_id like '%,$v,%'";
                }
            }
        }
        $ug_sql_string=implode(" or ",$ug_sql);

        $phql = "SELECT id,controller,action,label_menu,icon,child from Acl where area LIKE '%,$id,%' and is_menu = 'Y' and parent = '0' and except_user not LIKE '%,$uid,%' and ($ug_sql_string) ";
        // echo "<pre>".print_r($phql,1)."</pre>";die();
        $query = $this->modelsManager->executeQuery($phql)->toArray();

        foreach ($query as $key => $value) {

            $query2 = '';
            if ($value['child'] != '') {
                $id = $value['id'];
                $phql2  = "SELECT id,controller,action,label_menu,icon,child from Acl where is_menu = 'Y' and parent = '$id' and except_user not LIKE '%,$uid,%' and ($ug_sql_string) ";         
                $query2 = $this->cek_anak($phql2,$ug_sql_string);
            }

            $dt[] = array(
                'id' => $value['id'], 
                'controller' => $value['controller'], 
                'action' => $value['action'], 
                'label_menu' => $value['label_menu'], 
                'icon' => $value['icon'], 
                'child' => $query2, 

            );
        }

        return $dt;       
    }

    public function cek_anak($phql2,$ug_sql_string)
    {
        
        $uid = $this->session->get('id');
        $query2 = $this->modelsManager->executeQuery($phql2)->toArray();    
        foreach ($query2 as $key2 => $value2) {
            $n = '';
            if ($value2['child'] != '') {
                $q = $value2['id'];
                $asd  = "SELECT id,controller,action,label_menu,icon,child from Acl where is_menu = 'Y' and parent = '$q' and except_user not LIKE '%,$uid,%' and ($ug_sql_string) ";
                $n = $this->cek_anak($asd,$ug_sql_string);
            }

            $as[] = array(
                'id' => $value2['id'], 
                'controller' => $value2['controller'], 
                'action' => $value2['action'], 
                'label_menu' => $value2['label_menu'], 
                'icon' => $value2['icon'], 
                'child' => $n, 
            );
        }
        return $as;
    }

}

