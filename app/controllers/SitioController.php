<?php

namespace App\Controllers;

use App\Core\Controller;

use App\Models\Sitio;

class SitioController extends Controller{
    protected $idSitio;

    public function __construct(){
        $this->model = new Sitio();
        session_start();
    }
    
   public function getAll(){
    $infoBasica = $this->model->getAll();
    $datos['AllSitios'] = $infoBasica;
    return view('restauranteSingle',compact('datos'));
   }
   
   public function sendComentario(){
       $nombre = htmlspecialchars($_POST['NAME']);
       $mail = htmlspecialchars($_POST['EMAIL']);
       $texto = htmlspecialchars($_POST['COMMENT']);
       $vPrecio = htmlspecialchars($_POST['COMMENT']);
       $vAmbiente = htmlspecialchars($_POST['COMMENT']);
       $vsabor = htmlspecialchars($_POST['COMMENT']); 
       $this->getOne();
   }

    public function getOne(){
        $idSitio = htmlspecialchars($_GET['Sitio']);
        $datos['OneSitio'] = $this->model->getOne($idSitio);
        $datos['Ubicacion'] = $this->model->getUbicacion($idSitio);
        $datos['Horario'] = $this->model->getHorario($idSitio);
        $datos['Imagenes'] = $this->model->getImagenesSitio($idSitio);
        $datos['Valoracion'] =  $this->model->getValoracionSitio($idSitio);
        $datos['Caract'] =  $this->model->getCaractSitio($idSitio);
        //$datos['Comentarios'] = $this->model->getComentariosSitio($idSitio);
        //$datos['PaginacionPlatos'] =  $this->model->getPaginacionPlatos($idSitio);
        //$datos['PlatosPag1'] =  $this->model->getAllPlatos($idSitio,1);
       var_dump($datos );
        return view('/sitios/OneSitio',compact('datos'));
    }

    public function getPlatoPageN(){
        $idSitio = htmlspecialchars($_GET['Sitio']);
        $pageN = htmlspecialchars($_GET['platopage']);
        $datos['PaginacionPlatos'] =  $this->model->getPaginacionPlatos($idSitio);
        $datos['PlatosPag'] =  $this->model->getAllPlatos($idSitio,$pageN);
        //var_dump($datos);
        return $datos;
    }

    public function getComentarioPageN(){
        $idSitio = htmlspecialchars($_GET['Sitio']);
        $pageN = htmlspecialchars($_GET['comentarioPage']);
        $datos['PaginacionComentarios'] =  $this->model->getPaginacionComentarios($idSitio);
        $datos['ComentarioPag'] =  $this->model->getAllComentarios($idSitio,$pageN);
        //var_dump($datos);
        return $datos;
    }

    public function index(){
     $todosSitios = $this->model->getAll(); 
        $datos['todosSitios'] = $todosSitios;
    /*    $datos["userLogueado"] = $_SESSION['user'];*/
        return view('/restaurant/restauranteTodos', compact('datos'));
    }


    public function getCategorias(){
        $datos['categorias'] =  $this->model->getCategorias();
        //var_dump($datos);
        return  $this->model->getCategorias();
    }
    
    public function cerca(){
        $palabra = htmlspecialchars($_POST["clave"]);
        $categoria = htmlspecialchars($_POST["categorias"]);
        $ubicacion = htmlspecialchars($_POST["provincias"]);
        // $datos["consulta"] = $this->model->busqueda($clave,$categoria,$ubicacion);
        //var_dump($categoria);
        return view('/sitios/NearSitios', compact('datos'));
    }
   
}
