<?php

require_once "conexion.php";

class ModeloCarrito{

	/*=============================================
	MOSTRAR TARIFAS
	=============================================*/

	static public function mdlMostrarTarifas($tabla){

		$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");

		$stmt -> execute();

		return $stmt -> fetch();

		$stmt -> close();

		$stmt =null;

	}

	/*=============================================
	NUEVAS COMPRAS
	=============================================*/

	static public function mdlNuevasCompras($tabla, $datos){
	    
	    
		$stmt = Conexion::conectar()->prepare("INSERT INTO $tabla (id_usuario, id_producto, email, productos, cantidad, pago, pais, departamento, provincia, distrito, telefono, direccion) VALUES (:id_usuario, :id_producto, :email, :productos, :cantidad, :pago, :pais, :departamento, :provincia, :distrito, :telefono, :direccion)");


		$stmt->bindParam(":id_usuario", $datos["idUsuario"], PDO::PARAM_INT);
		$stmt->bindParam(":id_producto", $datos["idProducto"], PDO::PARAM_INT);
		$stmt->bindParam(":email", $datos["usuarioEmail"], PDO::PARAM_STR);
		$stmt->bindParam(":productos", $datos["tituloArray"], PDO::PARAM_STR);
		$stmt->bindParam(":cantidad", $datos["cantidadArray"], PDO::PARAM_STR);
		$stmt->bindParam(":pago", $datos["valorItemArray"], PDO::PARAM_STR);
		$stmt->bindParam(":pais", $datos["pais"], PDO::PARAM_STR);
		$stmt->bindParam(":departamento", $datos["departamento"], PDO::PARAM_STR);
		$stmt->bindParam(":provincia", $datos["provincia"], PDO::PARAM_STR);
		$stmt->bindParam(":distrito", $datos["distrito"], PDO::PARAM_STR);
		$stmt->bindParam(":telefono", $datos["telefono"], PDO::PARAM_STR);
		$stmt->bindParam(":direccion", $datos["direccion"], PDO::PARAM_STR);

		if($stmt->execute()){ 
	
			return "ok"; 

		}else{ 

			return "error"; 

		}

		$stmt->close();
		$stmt =null;
	}
	/*=============================================
	VERIFICAR PRODUCTO COMPRADO
	=============================================*/

	static public function mdlVerificarProducto($tabla, $datos){

		$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE id_usuario = :id_usuario AND id_producto = :id_producto");

		$stmt->bindParam(":id_usuario", $datos["idUsuario"], PDO::PARAM_INT);
		$stmt->bindParam(":id_producto", $datos["idProducto"], PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetch();

		$stmt -> close();

		$stmt =null;

	}

}