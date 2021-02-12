<?php

namespace App\Models;

use App\Core\Model;

class Sitio extends Model{
    protected $table;
    protected $idSitio;
    protected $n_per_plato = 2;
    protected $n_per_coment = 2;

    public function getAll(){
        $todos = $this->db->selectAllSitios();
        $All = json_decode(json_encode($todos), True);
        return $All; 
    }

    public function getOne($idSitio){
        $basic = $this->db->selectSitio($idSitio);
        $basicSitio = (json_encode($basic,true));    
        return $basic;
    }

    public function getUbicacion($idSitio){
        $ubicacion = $this->db->selectUbicacion($idSitio);
        //$basicUbicacion = json_decode(json_encode($basic), True);
        return $ubicacion;
    }

    public function getHorario($idSitio){
        $horario = $this->db->selectHorarios($idSitio);
        //$basicUbicacion = json_decode(json_encode($basic), True);
        return $horario;
    }
    public function getImagenesSitio($idSitio){
        $Imagenes = $this->db->selectImagenesSitio($idSitio);
        //$basicUbicacion = json_decode(json_encode($basic), True);
        return $Imagenes;
    }

    public function getValoracionSitio($idSitio){
        $Valoracion = $this->db->selectValoracionSitio($idSitio);
        //$basicUbicacion = json_decode(json_encode($basic), True);
        return $Valoracion;
    }
    public function getCaractSitio($idSitio){
        $Caract = $this->db->selectListaCaractSitio($idSitio);
        $basicCaract = json_encode($Caract);
        return $basicCaract;
    }

    public function getPaginacionPlatos($idSitio){
        $total_rows = 
        $this->db->getPages($idSitio,"platos");
        $total_pages = ceil($total_rows / $this->no_of_records_per_page);
        return $total_pages;
    }

    public function getPaginacionComentarios($idSitio){
        //  $offset = ($pagenro-1) * $this->no_of_records_per_page;
          $total_rows = 
          $this->db->getPages($idSitio,"comentariositios");
          $total_pages = ceil($total_rows / $this->no_of_records_per_page);
          return $total_pages;
      }

    public function getAllPlatos($idSitio,$page){
        $offset = ($page-1) * $this->no_of_records_per_page;
        $Platos = $this->db->selectAllPlatos($idSitio,$offset,$this->n_per_plato);
        $basicPlatos = json_encode($Platos);
        return $basicPlatos;
    }
    
    public function getAllComentarios($idSitio,$page){
        $offset = ($page-1) * $this->no_of_records_per_page;
        $Comentarios = $this->db->selectAllComentarios($idSitio,$offset,$this->n_per_coment);
        //$basicComentarios = json_encode($Comentarios);
        return $Comentarios;
    }

    
    public function getCategorias(){
        $Categorias = $this->db->getCategorias();
        $basicCategorias = json_encode($Categorias);
        return $basicCategorias;
    }


    public function busqueda(){
        $Categorias = $this->db->getCategorias();
        $basicCategorias = json_encode($Categorias);
        return $basicCategorias;
    }
    

    
}

