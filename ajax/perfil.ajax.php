<?php
require_once "../controladores/perfil.controlador.php";
require_once "../modelos/perfil.modelo.php";

class TablaPerfil {
    

    
    public function mostrarTabla(){
        
        $item = null;
        $valor = null;
        
        $Bitacora = ControladoPerfil::ctrMostrarPerfil($item, $valor);

        $datosJson =  '{
          "data": [ ';
         
        for($i = 0; $i < count($Bitacora); $i++){
             
        $acciones = "<div class='btn-group'><button class='btn btn-warning btn-xs btnEditarPerfil' idPerfil='".$Bitacora[$i]["id"]."' data-toggle='modal' data-target='#editarBitacora'><span class='glyphicon glyphicon-edit'></span></button> <button class='btn btn-danger btn-xs btnEliminarPerfil' idPerfilEliminar='".$Bitacora[$i]["id"]."' data-toggle='modal' data-target='#modalEliminarPerfil'> <span class='glyphicon glyphicon-trash'></span></button></div>";
          
        $datosJson .= '[
              "'.($i+1).'",
              "'.$Bitacora[$i]["fecha"].'",
              "'.$Bitacora[$i]["temperatura"].'",
              "'.$Bitacora[$i]["salinidad"].'",
              "'.$Bitacora[$i]["ph"].'",
              "'.$Bitacora[$i]["no2"].'",
              "'.$Bitacora[$i]["nh3"].'",
              "'.$Bitacora[$i]["no3"].'",
              "'.$Bitacora[$i]["po4"].'",
              "'.$Bitacora[$i]["ca"].'",
              "'.$Bitacora[$i]["mg"].'",
              "'.$Bitacora[$i]["kh"].'",
              "'.$acciones.'"
            ],';
             
        }    
        
        $datosJson = substr($datosJson, 0, -1);
  	    
        $datosJson .= ']
        }';
        
        echo $datosJson;
    }
}

$activar = new TablaPerfil();
$activar -> mostrarTabla();



?>