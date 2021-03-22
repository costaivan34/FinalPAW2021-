<?php

namespace App\Models;

use App\Core\Model;

class Users extends Model
{
    protected $table = 'usuarios';

    public function insert(array $user)
    {
        $this->db->insert($this->table, $user);
    }

    public function validarLogin($user, $password){
        $password= md5($password,false);
        $datos = $this->db->validarLogin($user, $password);
        return $datos;
    }

    public function getUsuario($user, $password){
        $password= md5($password,false);
        $datos = $this->db->validarLogin($this->table,$user, $password);
        return json_decode(json_encode($datos),true);
    }

    public function getDatosUsuario($user){
        $datos = $this->db->getDatosUsuario($user);
        //return json_encode($datos);
       return $datos;
    }

    public function getSitiosUsuario($user){
        $datos = $this->db->getSitiosUsuario($user);
        //return json_decode(json_encode($datos),true);
        return$datos;
    }
}



