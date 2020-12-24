<?php

require_once "conexion.php";

class ModeloPerfil {
    
    public function mdlMostrarPerfil($tabla, $item, $valor){
        
        if($item != null){
            
            $stmt = conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");
            
            $stmt -> bindParam(":".$item, $valor, PDO::PARAM_INT);

            $stmt -> execute();
            
            return $stmt  -> fetch(); 
            
            
        } else {
            
            $stmt = conexion::conectar()->prepare("SELECT * FROM $tabla ORDER BY id DESC");
            $stmt -> execute();
            return $stmt -> fetchAll();
        }
        
        $stmt -> close();
        $stmt -> null;
        
    }
    
    public function mdlGrabarPerfil($tabla, $datos){
        
        $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla (idusuario,fecha,temperatura,salinidad,ph,no2,nh3,no3,po4,ca,mg,kh) VALUES ( :id_usuario, :fecha, :temperatura, :salinidad, :ph, :nitritos, :amoniaco, :nitratos, :fosfatos, :calcio, :magnesio, :alcalinidad)");

		$stmt->bindParam(":id_usuario", $datos["idusuario"], PDO::PARAM_INT);
		$stmt->bindParam(":fecha", $datos["fecha"], PDO::PARAM_STR);
		$stmt->bindParam(":temperatura", $datos["temperatura"], PDO::PARAM_STR);
		$stmt->bindParam(":salinidad", $datos["salinidad"], PDO::PARAM_STR);
		$stmt->bindParam(":ph", $datos["ph"], PDO::PARAM_STR);
		$stmt->bindParam(":nitritos", $datos["nitritos"], PDO::PARAM_STR);
		$stmt->bindParam(":amoniaco", $datos["amoniaco"], PDO::PARAM_STR);
		$stmt->bindParam(":nitratos", $datos["nitratos"], PDO::PARAM_STR);
		$stmt->bindParam(":fosfatos", $datos["fosfatos"], PDO::PARAM_STR);
		$stmt->bindParam(":calcio", $datos["calcio"], PDO::PARAM_STR);
		$stmt->bindParam(":magnesio", $datos["magnesio"], PDO::PARAM_STR);
		$stmt->bindParam(":alcalinidad", $datos["alcalinidad"], PDO::PARAM_STR);

		if($stmt->execute()){
	
			return "ok"; 

		}else{ 

			return "error"; 

		}
		
		$stmt->close();
		$stmt =null;
        
    }
    
        public function mdlEditarPerfil($tabla, $datos){
            
        $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET fecha=:fecha, temperatura=:temperatura, salinidad=:salinidad, ph=:ph,no2=:no2,nh3=:nh3,no3=:no3,po4=:po4,ca=:ca,mg=:mg,kh=:kh WHERE id=:id"); 

		$stmt->bindParam(":id", $datos["id"], PDO::PARAM_INT);
		$stmt->bindParam(":fecha", $datos["fecha"], PDO::PARAM_STR);
		$stmt->bindParam(":temperatura", $datos["temperatura"], PDO::PARAM_STR);
		$stmt->bindParam(":salinidad", $datos["salinidad"], PDO::PARAM_STR);
		$stmt->bindParam(":ph", $datos["ph"], PDO::PARAM_STR);
		$stmt->bindParam(":no2", $datos["nitritos"], PDO::PARAM_STR);
		$stmt->bindParam(":nh3", $datos["amoniaco"], PDO::PARAM_STR);
		$stmt->bindParam(":no3", $datos["nitratos"], PDO::PARAM_STR);
		$stmt->bindParam(":po4", $datos["fosfatos"], PDO::PARAM_STR);
		$stmt->bindParam(":ca", $datos["calcio"], PDO::PARAM_STR);
		$stmt->bindParam(":mg", $datos["magnesio"], PDO::PARAM_STR);
		$stmt->bindParam(":kh", $datos["alcalinidad"], PDO::PARAM_STR);

		if($stmt->execute()){
	
			return "ok"; 

		}else{ 

			return "error"; 

		}
		
		$stmt->close();
		$stmt =null;
        
    }
    
    
    public function mdlEliminarPerfil($tabla, $item, $valor){
        
        $stmt = conexion::conectar()->prepare("DELETE FROM $tabla WHERE $item = :$item");
            
        $stmt -> bindParam(":".$item, $valor, PDO::PARAM_INT);

        if($stmt->execute()){
	
		return "ok"; 
		

		}else{ 

			return "error"; 
	
		}
		
		
		$stmt->close();
		$stmt =null;
        
        
    }
    
}