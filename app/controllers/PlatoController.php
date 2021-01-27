<?php

namespace App\Controllers;

use App\Core\Controller;

use App\Models\Plato;

class PlatoController extends Controller{

    public function __construct(){
        $this->model = new Plato();
        session_start();
    }
    


    public function index(){
     $todosPlatos = $this->model->getAll(); 
        $datos['todosPlatos'] = $todosPlatos;
    /*    $datos["userLogueado"] = $_SESSION['user'];*/
        return view('/plato/platoTodos', compact('datos'));
    }
   
}
