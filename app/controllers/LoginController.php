<?php

namespace App\Controllers;

use App\Core\Controller;

use App\Models\Users;

class LoginController extends Controller{
    public function __construct(){
        $this->model = new Users();
    }

    public function validarLogin(){
        $user=$_POST["userName"];
        $password=$_POST["password"];
        $statement= $this->model->validarLogin($user, $password); 
        if(($statement)==0){
            return 0;
        }else{
            return 1;
        }       
    }
}
