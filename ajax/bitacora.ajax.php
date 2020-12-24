<?php
require_once "../controladores/perfil.controlador.php";
require_once "../modelos/perfil.modelo.php";

class AjaxBitacora {

   /*Editar Bitacora */ 
    public $idBitacora;
    
    public function ajaxEditarBitacora(){
        
        $item = "id";
        $Valor = $this->idBitacora; 
        
        $respuesta = ControladoPerfil::ctrMostrarPerfil($item, $Valor);
        echo json_encode($respuesta);
        
    }
    /*Fin de Editar Bitacora*/
    
     /*Eliminar Bitacora */ 
   
    public $idEliminar;
    
    public function ajaxEliminarBitacora(){
        
        $item = "id";
        $Valor = $this->idEliminar; 
        
        $respuesta = ControladoPerfil::ctrEliminarPerfil($item, $Valor);
        return $respuesta;
                echo json_encode($respuesta);


    }
    /*Fin de Eliminar Bitacora*/
   
}

 
    /*Editar Todo Bitacora */ 

    if(isset($_POST["editarIdBitacora"])){
        
    $id = $_POST["editarIdBitacora"];
    $fecha = $_POST["fecha2"];
    $temperatura = $_POST["temperatura2"];
    $salinidad = $_POST["salinidad"];
	$ph = $_POST["ph"];
	$nitritos = $_POST["nitritos"];
	$amoniaco = $_POST["amoniaco"];
	$nitratos = $_POST["nitratos"];
	$fosfatos = $_POST["fosfatos"];
	$calcio = $_POST["calcio"];
	$magnesio = $_POST["magnesio"];
	$alcalinidad = $_POST["alcalinidad"];

	       				$datos = array("id"=>$id,
				                "fecha"=>$fecha,
				                "temperatura"=>$temperatura,
				                "salinidad"=>$salinidad,
				                "ph"=>$ph,
				                "nitritos"=>$nitritos,
				                "amoniaco"=>$amoniaco,
				                "nitratos"=>$nitratos,
				                "fosfatos"=>$fosfatos,
				                "calcio"=>$calcio,
								"magnesio"=>$magnesio,
								"alcalinidad"=>$alcalinidad
					);
					
    $respuesta = ControladoPerfil::ctrEditarPerfil($datos);
    return $respuesta;
  
    }
    /*Fin de Editar Todo*/
    
    


/* AGREGAR BITACORA */

if(isset($_POST["temperatura"])){ 

	$fecha = $_POST["fecha"];
	$temperatura = $_POST["temperatura"];
	$salinidad = $_POST["salinidad"];
	$ph = $_POST["ph"];
	$nitritos = $_POST["nitritos"];
	$amoniaco = $_POST["amoniaco"];
	$nitratos = $_POST["nitratos"];
	$fosfatos = $_POST["fosfatos"];
	$calcio = $_POST["calcio"];
	$magnesio = $_POST["magnesio"];
	$alcalinidad = $_POST["alcalinidad"];
	$idusuario = $_POST["idusuario"];

	       				$datos = array("idusuario"=>$idusuario,
				                "fecha"=>$fecha,
				                "temperatura"=>$temperatura,
				                "salinidad"=>$salinidad,
				                "ph"=>$ph,
				                "nitritos"=>$nitritos,
				                "amoniaco"=>$amoniaco,
				                "nitratos"=>$nitratos,
				                "fosfatos"=>$fosfatos,
				                "calcio"=>$calcio,
								"magnesio"=>$magnesio,
								"alcalinidad"=>$alcalinidad
					);
					
					

$respuesta = ControladoPerfil::ctrGrabarPerfil($datos);
return $respuesta;

}

/* FIN DE AGREGAR BITACORA */



/* INSTANCIAR MOSTRAR LA BITACORA */
if(isset($_POST["idBitacora"])){

    $editar = new AjaxBitacora();
    $editar -> idBitacora = $_POST["idBitacora"];
    $editar -> ajaxEditarBitacora();
    
}
/* FIN DE INSTANCIAR MOSTRAR LA BITACORA */

/* INSTANCIAR ELIMINAR LA BITACORA */
if(isset($_POST["idEliminar"])){
    
    $eliminar = new AjaxBitacora();
    $eliminar -> idEliminar = $_POST["idEliminar"];
    $eliminar -> ajaxEliminarBitacora();

}
/* FIN DE INSTANCIAR ELIMINAR LA BITACORA */





