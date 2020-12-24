 <?php
 
require_once "../controladores/carrito.controlador.php";
require_once "../modelos/carrito.modelo.php";
require_once "../modelos/usuarios.modelo.php";

require_once "../controladores/productos.controlador.php";
require_once "../modelos/productos.modelo.php";

require_once "../controladores/notificaciones.controlador.php";
require_once "../modelos/notificaciones.modelo.php";

require_once "../extensiones/PHPMailer/PHPMailerAutoload.php";
require_once "../extensiones/vendor/autoload.php";



if(isset($_POST["total"])){
    
    $productosid = explode("," , $_POST["idProductoArray"]);
    $productostitulo = explode("," , $_POST["tituloArray"]);
    $productoscantidad = explode("," , $_POST["cantidadArray"]);
    $productosvalor = explode("," , $_POST["valorItemArray"]);

	$total = $_POST["total"];
	$totalEncriptado = $_POST["totalEncriptado"];
	$impuesto = $_POST["impuesto"];
	$envio = $_POST["envio"];
	$subtotal = $_POST["subtotal"];
	$tituloArray = $_POST["tituloArray"];
	$cantidadArray = $_POST["cantidadArray"];
	$valorItemArray = $_POST["valorItemArray"];
	$idProductoArray = $_POST["idProductoArray"];;
	$pais = $_POST["pais"];
	$departamento = $_POST["departamento"];
	$provincia = $_POST["provincia"];
	$distrito = $_POST["distrito"];
	$telefono = $_POST["telefono"];
	$direccion = $_POST["direccion"];
	$idUsuario = $_POST["idUsuario"];
	$usuarioNombre = $_POST["usuarioNombre"];
	$usuarioEmail = $_POST["usuarioEmail"];

	
   #Actualizamos la base de datos
   for($i = 0; $i < count($productosid); $i++){
       
       				$datos = array("idUsuario"=>$idUsuario,
				                "idProducto"=>$productosid[$i],
				                "usuarioEmail"=>$usuarioEmail,
				                "tituloArray"=>$productostitulo[$i],
				                "cantidadArray"=>$productoscantidad[$i],
				                "valorItemArray"=>$productosvalor[$i],
				                "pais"=>$pais,
				                "departamento"=>$departamento,
				                "provincia"=>$provincia,
				                "distrito"=>$distrito,
								"telefono"=>$telefono,
								"direccion"=>$direccion,
					);
 
        $respuesta = ControladorCarrito::ctrNuevasCompras($datos);
        
        $ordenar = "id";
   		$item = "id";
   		$valor = $productosid[$i];

   		$productosCompra = ControladorProductos::ctrListarProductos($ordenar, $item, $valor);

   		foreach ($productosCompra as $key => $value) {

   			$item1 = "ventas";
   			$valor1 = $value["ventas"] + $productoscantidad[$i];
   			$item2 = "id";
   			$valor2 =$value["id"];

   			$actualizarCompra = ControladorProductos::ctrActualizarProducto($item1, $valor1, $item2, $valor2);
   			
   		}

   		if($respuesta == "ok" && $actualizarCompra == "ok"){


     		}

     }
     
    
    /*=============================================
	ENVIO DE CORREO 
	=============================================*/
	
	date_default_timezone_set("America/Lima");
	
	$mail = new PHPMailer;
	$mail->CharSet = 'UTF-8';
	$mail->isMail();
	$mail->setFrom('ventas@aquariadepot.com','Nueva Compra - Aquaria Depot');
	$mail->addReplyto('jasamik@hotmail.com','Nueva Compra - Aquaria Depot');
	$mail->Subject = "Ud. realizo una nueva compra en Aquaria Depot";
	$mail->addAddress($_POST["usuarioEmail"]);
	$mail->msgHTML('<div style="width:100%; background:#eee; position:relative; font-family:sans-serif; padding-bottom:40px">
	
	<div style="position:relative; margin:auto; width:600px; background:white; padding:20px">
	
		<center>
		<img style="padding:20px; width:15%" src="http://tutorialesatualcance.com/tienda/icon-email.png">
	<center>
		<img style="padding:20px; width:50%" src="https://www.aquariadepot.com/backend/vistas/img/plantilla/logo.png">
	</center>
		<h3 style="font-weight:100; color:#999">SU COMPRA SE REALIZO CON EXITO</h3>

		<hr style="border:1px solid #ccc; width:80%">
		<h4 style="font-weight:100; color:#999; padding:0 20px">Para hacer el seguimiento de sus productos puede ir a la opcion Ver Perfil y Mis Compras</h4>
		<a href="https://aquariadepot.com/perfil" target="_blank" style="text-decoration:none">
		<div style="line-height:60px; background:#ff9900; width:60%; color:white">Ver tus Compras</div>
		</a>
		<br>
		<hr style="border:1px solid #ccc; width:80%">
		<h5 style="font-weight:100; color:#999">Si no realizo ninguna compra, puede ignorar este correo electrónico y la cuenta se eliminará.</h5>
		</center>

	</div>

</div>');

    $envio = $mail->send();

    if(!$envio){
        
        		echo '<script> 

							swal({
								  title: "¡ERROR!",
								  text: "¡Ha ocurrido un problema enviando verificación de correo electrónico a '.$_POST["usuarioEmail"].$mail->ErrorInfo.'!",
								  type:"error",
								  confirmButtonText: "Cerrar",
								  closeOnConfirm: false
								},

								function(isConfirm){

									if(isConfirm){
										history.back();
									}
							});

						</script>';
        
        
    } else {
		
         
         echo '<script> 

							swal({
								  title: "¡OK!",
								  text: "¡Por favor revise la bandeja de entrada o la carpeta de SPAM de su correo electrónico '.$_POST["usuarioEmail"].' para verificar la cuenta!",
								  type:"success",
								  confirmButtonText: "Cerrar",
								  closeOnConfirm: false
								},

								function(isConfirm){

									if(isConfirm){
										history.back();
									}
							});

						</script>';
        
	
	
    }
     
}


