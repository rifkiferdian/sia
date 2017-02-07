<?php
use Phalcon\Mvc\View;

class AclController extends \Phalcon\Mvc\Controller
{

	public function initialize()
    {
        if (empty($this->session->get('uid'))) {
            $this->response->redirect('account/loginEnd');
        }
    }

    public function indexAction()
    {
    	$usergroup = RefUsergroup::find()->toArray();

        $phql = "SELECT * from Acl where is_menu = 'Y' and parent = '0' ";
        $parent = $this->modelsManager->executeQuery($phql)->toArray();

        $this->view->usergroup = $usergroup;
    	$this->view->parent = $parent;
    	$this->view->acl = $this->menuAction();

    	$this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    }

    

    public function addAclAction($value='')
    {
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);

        $controller      = $this->request->getPost('controller');
        $action       = $this->request->getPost('action');
        $parent   = $this->request->getPost('parent');
        $is_menu   = $this->request->getPost('is_menu');
        $label_menu   = $this->request->getPost('label_menu');
        $child   = $this->request->getPost('child');
        $usergroup_id   = $this->request->getPost('usergroup');
        $icon   = $this->request->getPost('icon');
        $except_user   = $this->request->getPost('except_user');
        $aktif   = $this->request->getPost('aktif');

        if ($controller != '' || $action != '' ||$usergroup_id != '' ||$parent != '') {
            // JIKA ANAK
            // if ($parent == 0) {
            //     $user = Users::findFirstById($parent);
 
            //     $user->assign(array(
            //         'username' => $this->request->getPost('usr'),
            //         'password' => $this->request->getPost('pwd'),
            //         'role' => $this->request->getPost('optradio'),
            //         )
            //     );
            //     $user->save();
            // }

            $acl = new Acl();
            $acl->assign(array(
                        'controller' => $controller,
                        'action' => $action,
                        'parent' => $parent,
                        'is_menu' => $is_menu,
                        'label_menu' => $label_menu,
                        'child' => $child,
                        'usergroup_id' => $usergroup_id,
                        'icon' => $icon,
                        'except_user' => $except_user,
                        'aktif' => $aktif,
                        )
                    );

            $acl->save();
            echo json_encode(array("status" => true, 'data' => $_POST));
        }else{
    		echo json_encode(array("status" => false, 'data' => $_POST));
        }
    }

    public function deleteAclAction($id)
    {
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
        $del=Acl::findById($id);
        $del->delete();
        echo json_encode(array("status" => true));
    }

    public function cek_anak($phql2,$ug_sql_string)
    {
        
        $uid = $this->session->get('id');
        $query2 = $this->modelsManager->executeQuery($phql2)->toArray();    
        foreach ($query2 as $key2 => $value2) {
            $n = '';
            if ($value2['child'] != '') {
                $q = $value2['id'];
                $asd  = "SELECT * from Acl where is_menu = 'Y' and parent = '$q' and except_user <> ',$uid,' and ($ug_sql_string)";
                $n = $this->cek_anak($asd,$ug_sql_string);
            }

            $as[] = array(
                'id' => $value2['id'], 
                'controller' => $value2['controller'], 
                'action' => $value2['action'], 
                'label_menu' => $value2['label_menu'], 
                'icon' => $value2['icon'], 
                'child' => $n, 
                'anak' => $value2['child'], 
                'usergroup_id' => $value2['usergroup_id'], 
                'except_user' => $value2['except_user'], 
                'aktif' => $value2['aktif'], 
            );
        }
        return $as;
    }

    public function menuAction(){

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

        $phql = "SELECT * from Acl where is_menu = 'Y' and parent = '0' and except_user <> ',$uid,' and ($ug_sql_string)";
        // echo "<pre>".print_r($phql,1)."</pre>";die();
        $query = $this->modelsManager->executeQuery($phql)->toArray();

        foreach ($query as $key => $value) {

            $query2 = '';
            if ($value['child'] != '') {
                $id = $value['id'];
                $phql2  = "SELECT * from Acl where is_menu = 'Y' and parent = '$id' and except_user <> ',$uid,' and ($ug_sql_string)";         
                $query2 = $this->cek_anak($phql2,$ug_sql_string);
            }

            $dt[] = array(
                'id' => $value['id'], 
                'controller' => $value['controller'], 
                'action' => $value['action'], 
                'label_menu' => $value['label_menu'], 
                'icon' => $value['icon'], 
                'child' => $query2, 
                'anak' => $value['child'], 
                'usergroup_id' => $value['usergroup_id'], 
                'except_user' => $value['except_user'], 
                'aktif' => $value['aktif'], 

            );
        }

        return $dt;
    }

}

