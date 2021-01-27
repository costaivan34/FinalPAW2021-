<?php

namespace App\Models;

use App\Core\Model;

class Plato extends Model
{
    protected $table = 'plato';

    public function getAll(){
        $todos = $this->db->selectAllPlato('plato');
        $All = json_decode(json_encode($todos), True);
        return $All; 
    }

}