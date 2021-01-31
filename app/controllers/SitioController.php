<?php

namespace App\Controllers;

use App\Core\Controller;

use App\Models\Sitio;

class SitioController extends Controller{

    public function __construct(){
        $this->model = new Sitio();
        session_start();
    }
    
   public function getAll(){
    $infoBasica = $this->model->getAll();
    $datos['AllSitios'] = $infoBasica;
    return view('restauranteSingle',compact('datos'));
   }
   

    public function getOne(){
        $infoBasica = $this->model->getOne($_GET['Sitio']);
        $infoUbicacion = $this->model->getUbicacion($_GET['Sitio']);
        $infoHorario = $this->model->getHorario($_GET['Sitio']);
        $infoImagenes = $this->model->getImagenesSitio($_GET['Sitio']);
        $datos['OneSitio'] = $infoBasica;
        $datos['Ubicacion'] = $infoUbicacion;
        $datos['Horario'] = $infoHorario;
        $datos['Imagenes'] = $infoImagenes;
        var_dump($infoHorario);
        $datos['imagen'] = "public/res/banner2.jpg";
        return view('/sitios/OneSitio',compact('datos'));
        

    }

    public function index(){
     $todosSitios = $this->model->getAll(); 
        $datos['todosSitios'] = $todosSitios;
    /*    $datos["userLogueado"] = $_SESSION['user'];*/
        return view('/restaurant/restauranteTodos', compact('datos'));
    }
   
}
