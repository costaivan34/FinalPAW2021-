<?php

namespace App\Controllers;

use App\Core\App;
use App\Core\Controller;
use App\Models\Users;

class UsersController extends Controller{

    public function __construct(){
        
        $this->model = new Users();
      
    }

    /**
     * Show all users.
     */
    public function index(){
        $users = $this->model->get();
        return view('users', compact('users'));
    }

    /**
     * Store a new user in the database.
     */
    public function store(){
        $user = [
            'name' => $_POST['name']
        ];
        $this->model->insert($user);
        return redirect('users');
    }

    public function validarLogin(){
        $user=$_POST["userName"];
        $password=$_POST["password"];
        $statement= $this->model->validarLogin($user, $password); 
        if(($statement)==1){
            // Start the session
            session_start();
            $s = $this->model->getDatosUsuario($user);
            $_SESSION["user"]=$s[0]->nombreUsuario;
            return 1;
        }else{
            unset($_SESSION["user"]);
            return 0;
        }       
    }

    public function actualizarPerfil(){
        var_dump($_POST["nameUser"]);
        $_POST["nombreUser"];
        $_POST["apellidoUser"];
        $_POST["mailUser"];
        $_POST["paisUser"];
        $_POST["nameUser"];
        $_POST["telefonoUser"];
        $datos= $this->model->getUsuario($_SESSION["user"]);

    }

    public function cerrarLogin(){
        session_start();
        unset($_SESSION["user"]);
        unset($datos["user"] );
        session_destroy();
        return 1;
    }

    public function cargarSitios(){
        $datos= $this->model->getUsuario($_SESSION["user"]); 
        return view('/sitios/NearSitios', compact('data'));
    }

    public function dash(){
        session_start();
        $datos['user'] =" ";
        if (isset($_SESSION['user'])){
            $datos['user'] = $_SESSION['user'];
            $datos['data']= $this->model->getUsuario($_SESSION['user']); 
          //  var_dump($datos);
            return view('/users/dashboard', compact('datos'));
        }else{
            header("Location: /");
            exit();
        }
        
    }


    public function dash_sitios(){
        session_start();
        $datos["user"] =" ";
        if (isset($_SESSION["user"])){
            $datos["user"] =  $_SESSION["user"];
            //$datos["data"]= $this->model->getUsuario($_SESSION["user"]);
            $datos["data"]= $this->model->getUsuario($_SESSION["user"]);
            $datos["sitios"]= $this->model->getSitiosUsuario($_SESSION["user"]);
            return view('/users/dashboard-sitios', compact('datos'));
        }else{
            header("Location: /");
            exit();
        }
    }

    public function dash_password(){
        session_start();
        $datos["user"] =" ";
        if (isset($_SESSION["user"])){
            $datos["user"] =  $_SESSION["user"];
            $datos["data"]= $this->model->getUsuario($_SESSION["user"]);
            return view('/users/dashboard-password', compact('datos'));
        }else{
            header("Location: /");
            exit();
        }
    }


}
