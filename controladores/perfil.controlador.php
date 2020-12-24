<?php

class ControladoPerfil{
    
    /*==== MOSTRAR VALORES DE LA BITACORA ====*/
    static public function ctrMostrarPerfil($item, $valor){
      
        $tabla = "perfil";
        $respuesta = ModeloPerfil::mdlMostrarPerfil($tabla, $item, $valor);
        return $respuesta;
        
    }
    /*==== FIN DE MOSTRAR VALORES ====*/
    
    
    /*==== EDITAR DATOS DE LA BITACORA ====*/    
    static public function ctrEditarPerfil($datos){
        
	$tabla = "perfil";
    $respuesta = ModeloPerfil::mdlEditarPerfil($tabla, $datos);
    return $respuesta;
        
    }
    /*==== FIN DE EDITAR DATOS DE LA BITACORA ====*/  
    
   
    /*==== GRABAR DATOS DE LA BITACORA ====*/ 
    static public function ctrGrabarPerfil($datos){
        
    $tabla = "perfil";
    $respuesta = ModeloPerfil::mdlGrabarPerfil($tabla, $datos);
    return $respuesta;
        
    }
    /*==== FIN GRABAR DATOS DE LA BITACORA ====*/    
    
    
    /*==== ELIMINAR DATOS DE LA BITACORA ====*/
    static public function ctrEliminarPerfil($item, $valor){
        
        $tabla = "perfil";
        $respuesta = ModeloPerfil::mdlEliminarPerfil($tabla, $item, $valor);
        return $respuesta;

    }
    /*==== FIN ELIMINAR DATOS DE LA BITACORA ====*/  
    

}