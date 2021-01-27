<?php

namespace App\Controllers;

use App\Core\Controller;

use App\Models\Users;

class LoginController extends Controller{
    public function __construct(){
        $this->model = new Users();
    }

    public function validarLogin(){
        $user=$_POST['mail'];
        $password=$_POST['password'];
        $statement= $this->model->getUsuario($user,$password); 
        if(empty($statement)){
            $datos['error'] = true;
            return view ('/login/login',compact('datos'));
        }else{
            session_start();
            $_SESSION['user']=$_POST['mail'];
            redirect('');         
        }       
    }
}
