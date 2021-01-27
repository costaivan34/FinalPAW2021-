<?php

namespace App\Core\Database;

use PDO;
use Exception;

class QueryBuilder
{
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
    public function __construct($pdo, $logger = null)
    {
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
    public function insert($table, $parameters)
    {
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

    private function sendToLog(Exception $e)
    {
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
    private function cleanParameterName($parameters)
    {
        $cleaned_params = [];
        foreach ($parameters as $name => $value) {
            $cleaned_params[str_replace('-', '', $name)] = $value ;
        }
        return $cleaned_params;
    }


    public function validarLogin($table, $usuario ,$password){
     
        $statement = $this->pdo->prepare(
            "SELECT * FROM usuarios
            WHERE mail='{$usuario}' AND password='{$password}' "
        );
        $statement->execute();
        return $statement->fetchAll(PDO::FETCH_CLASS);
    }

/**
 * 
 * 
 * INICIO DE CONSULTAS PARA SITIO
 * 
 */

/**
 *
 *  INICIO DE CONSULTAS RECUPERAR SITIO
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
     valoracionAmbiente, valoracionServicio,idlistaHorario,idListaPago, idUbicacion, idListaCarac, 
     idListaComent FROM sitio WHERE idSitio= $idSitio");

    */
    $statement = $this->pdo->prepare("SELECT idsitio, nombre, descripcion FROM sitios
                                             WHERE idSitio= $idSitio ");
     $statement->execute();
     
    return $statement->fetchAll(PDO::FETCH_CLASS);
}

public function selectPlatos($idSitio){
    $statement = $this->pdo->prepare("SELECT 'idPlato',`nombre` FROM 'plato' WHERE `idSitio`= $idSitio");
    $statement->execute();
    return $statement->fetchAll(PDO::FETCH_CLASS);
}


public function selectUbicacion($idUbicacion){
    $statement = $this->pdo->prepare("SELECT idUbicacion, direccion, ciudad, provincia, x, y FROM ubicacion
     WHERE idUbicacion = $idUbicacion");
    $statement->execute();
    return $statement->fetchAll(PDO::FETCH_CLASS);
}
 
public function selectHorarios($idListaHorario){
    $statement = $this->pdo->prepare("SELECT hh.idHorario, hh.dia,hh.horaInicio,hh.horaFin
         FROM listahorario lh 
         INNER JOIN horario hh  ON  lh.idHorario=hh.idHorario
         WHERE lh.idListaH = $idListaHorario");
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


public function selectListaCaractSitio($idListaCarac){ 
    $statement = $this->pdo->prepare("SELECT cs.nombre,cs.descripcion FROM listacaractsitio lcs 
         INNER JOIN caracteristicasitio cs  ON  lpc.idListaCaract = cs.idCaracteristica 
         WHERE lps.idListaCaract = $$idListaCarac");
    $statement->execute();
    return $statement->fetchAll(PDO::FETCH_CLASS);
}

public function selectListaComentSitio($idListaComent){ 
    $statement = $this->pdo->prepare("SELECT cs.descripcion, cs.valoracion,cs.fecha,u.alias,u.fotoPerfil
         FROM listacomentsitios lcs 
         INNER JOIN comentariositio cs  ON  lps.idComent=cs.idComentario 
         INNER JOIN usuarios u ON cs.idUsuario=u.idUsuario
         WHERE lpc.idLista = $idListaComent");
    $statement->execute();
    return $statement->fetchAll(PDO::FETCH_CLASS);
}


public function selectImagenesSitio($idSitio){ 
    $statement = $this->pdo->prepare("SELECT cs.idImagen,cs.nombre, cs.descripcion,  cs.datos
     FROM  imagenessitio imgs WHERE imgs.idSitio = $$idSitio");
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

public function selectAllPlato($table){ 
    $statement = $this->pdo->prepare("SELECT idPlato,nombre, valoracion FROM {$table}");
    $statement->execute();
    return $statement->fetchAll(PDO::FETCH_CLASS);
}

/**
 *
 *  INICIO DE CONSULTAS RECUPERAR PLATO
 *
 */
//recuperar plato 
//ListaImagenes
public function selectPlato($idPlato){ 
    $statement = $this->pdo->prepare("SELECT nombre,descripcion,valoracion,
    idSitio,idListaInfo,idListaCarac,idListaComent FROM plato WHERE idPlato= $idPlato");
    $statement->execute();
    return $statement->fetchAll(PDO::FETCH_CLASS);
}

//recuperar sitio de plato X
public function selectNombresitio($idSitio){
    $statement = $this->pdo->prepare("SELECT 'idSitio',`nombre` FROM 'sitio' WHERE `idSitio`= $idSitio");
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
//recuperar ListaComent de plato X
public function selectListaComent($idListaComent){ 
    $statement = $this->pdo->prepare("SELECT cp.descripcion,cp.valoracion,cp.fecha,u.alias,u.fotoPerfil
         FROM listacomentplatos lcp 
         INNER JOIN comentarioplato cp  ON  lpc.idComent=cp.idComentario 
         INNER JOIN usuarios u ON cp.idUsuario=u.idUsuario
         WHERE lpc.idLista = $idListaComent");
    $statement->execute();
    return $statement->fetchAll(PDO::FETCH_CLASS);
}
/**
 *
 *  FIN DE CONSULTAS RECUPERAR PLATO
 *
 */

/**
 * 
 * 
 * FIN DE CONSULTAS PARA PLATO
 * 
 */

}
