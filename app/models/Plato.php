<?php

namespace App\Models;

use App\Core\Model;

class Plato extends Model{
    protected $idSitio;
    protected $idPlato;
    protected $table = 'plato';

    public function getAll(){
        $todos = $this->db->selectAllPlato('plato');
        $All = json_decode(json_encode($todos), True);
        return $All; 
    }


    public function getOne($idSitio,$idPlato){
        /*
        public function selectPlatos($idSitio){
        public function selectUbicacion($idUbicacion){
        public function selectHorarios($idListaHorario){
        public function selectMediosPagos($idListaMedios){
        public function selectListaCaractSitio($idListaCarac){ 
        public function selectListaComentSitio($idListaComent){ 
        public function selectImagenesSitio($idSitio){ 
        */
        $basic = $this->db->selectPlato($idSitio,$idPlato);
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
}