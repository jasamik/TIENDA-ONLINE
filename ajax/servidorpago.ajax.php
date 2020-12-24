<?php

    require_once "../controladores/carrito.controlador.php";
    require_once "../modelos/carrito.modelo.php";
            
    $respuesta = ControladorCarrito::ctrMostrarTarifas();
	$llaveSecretaCulqi = $respuesta["llaveSecretaCulqi"];

try {
  // Usando Composer (o puedes incluir las dependencias manualmente)
  require_once '../culqi/vendor/autoload.php'; 
  require_once '../culqi/lib/culqi.php' ; 
  
  // Configurar tu API Key y autenticaci¨®n
  $SECRET_KEY = $llaveSecretaCulqi;
  $culqi = new Culqi\Culqi(array('api_key' => $SECRET_KEY));
  // Creando Cargo a una tarjeta

// Creamos Cargo a una tarjeta
$charge = $culqi->Charges->create(
    array(
      "amount" => (int) $_POST['monto']*100,
      "capture" => true,
      "currency_code" => "PEN",
      "description" => $_POST['descripcion'],
      "email" => $_POST['email'],
      "installments" => (int) $_POST['installments'],
      "antifraud_details" => array(
          "address" => $_POST['direccion'],
          "address_city" => $_POST['ciudad'],
          "country_code" => $_POST['pais'],
          "first_name" => $_POST['nombre'],
          "last_name" => $_POST['apellido'],
          "phone_number" => $_POST['telefono'],
      ),
      "source_id" => $_POST['token']
    )
);

//Respuesta
echo json_encode($charge);


} catch (Exception $e) {
  echo json_encode($e->getMessage());
}


