<?php

namespace App\Core\Database;

use PDO;
use Exception;

class QueryBuilder{
    /**
     * The PDO instance.
     *
     * @var PDO
     */
    protected $pdo;

    /**
     * Create a new QueryBuilder instance.
     *
     * @param PDO $pdo
     */
    public function __construct($pdo, $logger = null){
        $this->pdo = $pdo;
        $this->logger = ($logger) ? $logger : null;
    }

    /**
     * Select all records from a database table.
     *
     * @param string $table
     */
    public function selectAll($table){
        $statement = $this->pdo->prepare(
            "SELECT * FROM {$table}"
        );
        $statement->execute();
        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Insert a record into a table.
     *
     * @param  string $table
     * @param  array  $parameters
     */
    public function insert($table, $parameters){
        $parameters = $this->cleanParameterName($parameters);
        $sql = sprintf(
            'insert into %s (%s) values (%s)',
            $table,
            implode(', ', array_keys($parameters)),
            ':' . implode(', :', array_keys($parameters))
        );

        try {
            $statement = $this->pdo->prepare($sql);
            $statement->execute($parameters);
        } catch (Exception $e) {
            $this->sendToLog($e);
        }
    }

    private function sendToLog(Exception $e){
        if ($this->logger) {
            $this->logger->error('Error', ["Error" => $e]);
        }
    }

    /**
     * Limpia guiones - que puedan venir en los nombre de los parametros
     * ya que esto no funciona con PDO
     *
     * Ver: http://php.net/manual/en/pdo.prepared-statements.php#97162
     */
    private function cleanParameterName($parameters){
        $cleaned_params = [];
        foreach ($parameters as $name => $value) {
            $cleaned_params[str_replace('-', '', $name)] = $value ;
        }
        return $cleaned_params;
    }


    public function validarLogin($usuario ,$password){
        $statement = $this->pdo->prepare(
            "SELECT count(*) as cuenta FROM usuarios
            WHERE mail=$usuario AND password=$password "
        );
        $statement->execute();
        return $statement;
    }

/**
 * 
 * 
 * INICIO DE CONSULTAS PARA SITIO
 * 
 */

 //recuperar listado de todos los sitios
public function selectAllSitios(){ 
  /*  $statement = $this->pdo->prepare("SELECT `nombre`,`telefono`,`valoracionPrecio`,
    `valoracionAmbiente`, `valoracionServicio`,`idUbicacion` FROM sitio ");*/
    $statement = $this->pdo->prepare("SELECT idsitio, nombre, descripcion FROM sitios ");
   $statement->execute();
   return $statement->fetchAll(PDO::FETCH_CLASS);
}

public function selectSitio($idSitio){
    /*
    $statement = $this->pdo->prepare("SELECT idsitio, nombre, descripcion, telefono, sitioweb, valoracionPrecio,
     valoracionAmbiente, valoracionServicio FROM sitio WHERE idSitio= $idSitio");

    */
    $statement = $this->pdo->prepare("SELECT * FROM sitios WHERE idSitio= $idSitio");
     $statement->execute();
     
    return $statement->fetchAll(PDO::FETCH_CLASS);
}

public function selectUbicacion($idSitio){
    $statement = $this->pdo->prepare("SELECT idUbicacion, direccion, ciudad, provincia, x, y FROM ubicacion
     WHERE idSitio = $idSitio");
    $statement->execute();
    return $statement->fetchAll(PDO::FETCH_CLASS);
}
 
public function selectHorarios($idSitio){
    $statement = $this->pdo->prepare("SELECT h.idDia, h.HDesde, h.HHasta, sd.nombre FROM horario h INNER JOIN semanasdias sd ON h.idDia=sd.idDia  WHERE idSitio = $idSitio");
    $statement->execute();
    return $statement->fetchAll(PDO::FETCH_CLASS);
}

public function selectMediosPagos($idListaMedios){
    $statement = $this->pdo->prepare("SELECT mp.idMedio, mp.nombre,mp.coutas
    FROM listamediospagos lmp 
    INNER JOIN mediospago mp  ON  lmp.idMedio=mp.idMedio
    WHERE lmp.idListaPagos = $idListaMedios");
$statement->execute();
return $statement->fetchAll(PDO::FETCH_CLASS);
} 


public function selectListaCaractSitio($idSitio){ 
    $statement = $this->pdo->prepare("SELECT cs.nombre FROM listacaractsitio lcs 
         INNER JOIN caracteristicasitio cs  ON  lcs.idCaract = cs.idCaracteristica 
         WHERE lcs.idSitio = $idSitio");
    $statement->execute();
    return $statement->fetchAll(PDO::FETCH_CLASS );
}

public function selectImagenesSitio($idSitio){ 
    $statement = $this->pdo->prepare("SELECT cs.idImagen, cs.path
     FROM  imagenessitios cs WHERE cs.idSitio = $idSitio");
    $statement->execute();
    return $statement->fetchAll(PDO::FETCH_CLASS);
}


public function selectValoracionSitio($idSitio){ 
    $statement = $this->pdo->prepare
    ("SELECT avg(cs.valoracionSabor) as valoracionSabor,avg( cs.valoracionPrecio)as valoracionPrecio,
    avg(cs.valoracionAmbiente)as valoracionAmbiente  FROM comentariositios cs WHERE cs.idsitio = $idSitio");
    $statement->execute();
    return $statement->fetchAll(PDO::FETCH_CLASS);
}

public function selectAllComentarios($idSitio,$offset,$per_page){ 
    $statement = $this->pdo->prepare
    ("SELECT cs.nombre, cs.descripcion,cs.fecha,cs.valoracionSabor,
                cs.valoracionPrecio,cs.valoracionAmbiente
         FROM comentariositios cs WHERE cs.idsitio = $idSitio LIMIT $offset, $per_page");
    $statement->execute();
    return $statement->fetchAll(PDO::FETCH_CLASS);
}

public function selectAllPlatos($idSitio,$offset, $per_page){ 
    //$statement = $this->pdo->prepare(" SELECT p.idPlato, p.nombre, p.precio, ip.path FROM platos p 
    //INNER JOIN imagenesplatos ip on p.idPlato=ip.idPlato WHERE p.idSitio=$idSitio LIMIT $offset, $per_page" );
     $statement = $this->pdo->prepare(" SELECT p.idPlato, p.nombre, p.precio FROM platos p 
      WHERE p.idSitio=$idSitio LIMIT $offset, $per_page" );
    $statement->execute();
    return $statement->fetchAll(PDO::FETCH_CLASS);
}

public function getPages($idSitio,$tabla){ 
    $total_pages_sql =  $this->pdo->prepare(" SELECT count(*) 
    FROM $tabla p WHERE p.idSitio=$idSitio" );
    $total_pages_sql->execute();
    return $total_pages_sql->fetchColumn();
}

public function getCategorias(){ 
    $statement =  $this->pdo->prepare("SELECT * 
    FROM categorias" );
    $statement->execute();
    return $statement->fetchAll(PDO::FETCH_CLASS);
}

/**
 *
 *  FIN DE CONSULTAS RECUPERAR SITIO
 *
 */

 /**
 * 
 * 
 * FIN DE CONSULTAS PARA SITIO
 * 
 */

/**
 * 
 * 
 * INICIO DE CONSULTAS PARA PLATO
 * 
 */
//recuperar listado de todos los platos




//recuperar plato 
//ListaImagenes
public function selectPlato($idSitio,$idPlato){ 
    $statement = $this->pdo->prepare("SELECT nombre,descripcion,precio
     FROM platos WHERE idPlato= $idPlato and idSitio=$idSitio");
    $statement->execute();
    return $statement->fetchAll(PDO::FETCH_CLASS);
}


//recuperar ListaInfo de plato X
public function selectListaInfo($idListaInfo){ 
    $statement = $this->pdo->prepare( "SELECT inf.nombre, vn.valor FROM  listainfo li 
     INNER JOIN valornutricional vn  ON  li.idValor = vn.idValor 
     INNER JOIN infonutricional inf  ON  vn.idInfo = inf.idInfo
     WHERE li.idListaInfo = $$idListaInfo");
    $statement->execute();
    return $statement->fetchAll(PDO::FETCH_CLASS);
}

//recuperar ListaCaract de plato X
public function selectListaCaract($idListaCarac){ 
    $statement = $this->pdo->prepare("SELECT cp.nombre,cp.descripcion FROM listacaractplato lcp 
         INNER JOIN caracteristicaplato cp  ON  lpc.idListaCaract = cp.idCaracteristica 
         WHERE lpc.idListaCaract = $$idListaCarac");
    $statement->execute();
    return $statement->fetchAll(PDO::FETCH_CLASS);
}

/**
 * 
 * 
 * FIN DE CONSULTAS PARA PLATO
 * 
 */

}
