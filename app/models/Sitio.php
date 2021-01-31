<?php

namespace App\Models;

use App\Core\Model;

class Sitio extends Model{
    protected $table;
    protected $idSitio;
    protected $idUbicacion;
    protected $idHorario;
    protected $idMedios;
    protected $idCarac;
    protected $idComent;

    public function getAll(){
        $todos = $this->db->selectAllSitios();
        $All = json_decode(json_encode($todos), True);
        return $All; 
    }

    public function getOne($idSitio){
        /*
        public function selectPlatos($idSitio){
        public function selectUbicacion($idUbicacion){
        public function selectHorarios($idListaHorario){
        public function selectMediosPagos($idListaMedios){
        public function selectListaCaractSitio($idListaCarac){ 
        public function selectListaComentSitio($idListaComent){ 
        public function selectImagenesSitio($idSitio){ 
        */
        
        $basic = $this->db->selectSitio($idSitio);
        $basicSitio = json_decode(json_encode($basic), True);
        
        /*$datos["sitio"] = $this->db->selectPlatos($basicSitio['idSitio']);
        $datos["ubicacion"] = $this->db->selectUbicacion($basicSitio['idUbicacion']);
        $datos["horarios"]  = $this->db->selectHorarios($basicSitio['idlistaHorario']);
        $datos["medios"]  = $this->db->selectMediosPagos($basicSitio['idListaPago']);
        $datos["caracteristicas"]  = $this->db->selectListaCaractSitio($basicSitio['idListaCarac']);
        $datos["comentarios"]  = $this->db->selectListaComentSitio($basicSitio['idListaComent']);
        */       
        return $basic;
    }

    public function getUbicacion($idSitio){
        $ubicacion = $this->db->selectUbicacion($idSitio);
        //$basicUbicacion = json_decode(json_encode($basic), True);
        return $ubicacion;
    }

    public function getHorario($idSitio){
        $horario = $this->db->selectHorarios($idSitio);
        $s="";
        for($i = 0, $size = count($horario); $i < $size; ++$i) {
            $s= $s + $horario[$i];
        }
        //$basicUbicacion = json_decode(json_encode($basic), True);
        return $s;
    }
    public function getImagenesSitio($idSitio){
        $Imagenes = $this->db->selectImagenesSitio($idSitio);
        //$basicUbicacion = json_decode(json_encode($basic), True);
        return $Imagenes;
    }


    
    
}

