<!DOCTYPE html>
<html lang="es">
<head><meta charset="gb18030">
    
<meta name="theme-color" content="#FF9900">

	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	
	<?php
	

		session_start();

		$servidor = Ruta::ctrRutaServidor();

		$plantilla = ControladorPlantilla::ctrEstiloPlantilla();

		echo '<link rel="icon" href="'.$servidor.$plantilla["icono"].'">';

		/*=============================================
		MANTENER LA RUTA FIJA DEL PROYECTO
		=============================================*/
		
		$url = Ruta::ctrRuta();

		/*=============================================
		MARCADO DE CABECERA
		=============================================*/

		$rutas = array();

		if(isset($_GET["ruta"])){

			$rutas = explode("/", $_GET["ruta"]);

			$ruta = $rutas[0];

		}else{

			$ruta = "inicio";

		}

		$cabeceras = ControladorPlantilla::ctrTraerCabeceras($ruta);
		
		if(!$cabeceras["ruta"]){

			$ruta = "inicio";

			$cabeceras = ControladorPlantilla::ctrTraerCabeceras($ruta);

		}
		

	?>
	
		<!-- Load Facebook SDK for JavaScript -->
      <div id="fb-root"></div>
      <script>
        window.fbAsyncInit = function() {
          FB.init({
            xfbml            : true,
            version          : 'v7.0'
          });
        };

        (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = 'https://connect.facebook.net/es_LA/sdk/xfbml.customerchat.js';
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));</script>

      <!-- Your Chat Plugin code -->
      <div class="fb-customerchat"
        attribution=setup_tool
        page_id="115501666515405"
  theme_color="#ff9900"
  logged_in_greeting="Hola...!!! Recibe un Saludo de Aquaria Depot, en que podemos ayudarte."
  logged_out_greeting="Hola...!!! Recibe un Saludo de Aquaria Depot, en que podemos ayudarte.">
      </div>
	
<link rel="icon" href="https://backend.aquariadepot.com/vistas/img/plantilla/icono.png">



	<!--=====================================
	Marcado HTML5
	======================================-->

	<meta name="title" content="<?php echo  $cabeceras['titulo']; ?>">
	<meta name="description" content="<?php echo  $cabeceras['descripcion']; ?>">
	<meta name="keyword" content="<?php echo  $cabeceras['palabrasClaves']; ?>">
	<meta name="author" content="Aquaria Depot">
    <meta name="copyright" content="Propietario Aquaria Depot">
    <meta property="og:image"  content="<?php echo $servidor.$cabeceras['portada'];?>">
	
	<title><?php echo  $cabeceras['titulo']; ?></title>

	<!--=====================================
	Marcado de Open Graph FACEBOOK
    ======================================-->
    
    

	<meta property="og:title"   content="<?php echo $cabeceras['titulo'];?>">
	<meta property="og:url" content="<?php echo $url.$cabeceras['ruta'];?>">
	<meta property="og:description" content="<?php echo $cabeceras['descripcion'];?>">
	<meta property="og:image"  content="<?php echo $servidor.$cabeceras['portada'];?>">
	<meta property="og:type"  content="website">	
	<meta property="og:site_name" content="Aquaria Depot">
	<meta property="og:locale" content="es_CO">

	<!--=====================================
	Marcado para DATOS ESTRUCTURADOS GOOGLE
	======================================-->
	
	<meta itemprop="name" content="<?php echo $cabeceras['titulo'];?>">
	<meta itemprop="url" content="<?php echo $url.$cabeceras['ruta'];?>">
	<meta itemprop="description" content="<?php echo $cabeceras['descripcion'];?>">
	<meta itemprop="image" content="<?php echo $servidor.$cabeceras['portada'];?>">

	<!--=====================================
	Marcado de TWITTER
	======================================-->
	<meta name="twitter:card" content="summary">
	<meta name="twitter:title" content="<?php echo $cabeceras['titulo'];?>">
	<meta name="twitter:url" content="<?php echo $url.$cabeceras['ruta'];?>">
	<meta name="twitter:description" content="<?php echo $cabeceras['descripcion'];?>">
	<meta name="twitter:image" content="<?php echo $servidor.$cabeceras['portada'];?>">
	<meta name="twitter:site" content="@tu-usuario">

	<!--=====================================
	PLUGINS DE CSS
	======================================-->

	<link rel="stylesheet" href="<?php echo $url; ?>vistas/css/plugins/bootstrap.min.css">
	<link rel="stylesheet" href="<?php echo $url; ?>vistas/css/plugins/font-awesome.min.css">
	<link rel="stylesheet" href="<?php echo $url; ?>vistas/css/plugins/flexslider.css">
	<link rel="stylesheet" href="<?php echo $url; ?>vistas/css/plugins/sweetalert.css">
	<link rel="stylesheet" href="<?php echo $url; ?>vistas/css/plugins/dscountdown.css">
	<!--
	<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Ubuntu|Ubuntu+Condensed" rel="stylesheet">
	-->

<link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed&display=swap" rel="stylesheet">

	<!--=====================================
	CSS PARA LOS DATATABLES
	======================================-->
	
	<link rel="stylesheet" href="<?php echo $url; ?>backend/vistas/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
	<link rel="stylesheet" href="<?php echo $url; ?>backend/vistas/bower_components/datatables.net-bs/css/responsive.bootstrap.min.css">
	
	<!--=====================================
	CSS IMAGEN DE LOADING DATA
	======================================-->
	<link rel="stylesheet"  type="text/css" href="<?php echo $url; ?>vistas/css/plugins/loading-bar.css">

	<!--=====================================
	CSS PARA EL DATAPICKER
	======================================-->
	<link rel="stylesheet" href="<?php echo $url; ?>backend/vistas/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">


	<!--=====================================
	HOJAS DE ESTILO PERSONALIZADAS
	======================================-->
	
	<link rel="stylesheet" href="<?php echo $url; ?>vistas/css/plantilla.css">
	<link rel="stylesheet" href="<?php echo $url; ?>vistas/css/cabezote.css">
	<link rel="stylesheet" href="<?php echo $url; ?>vistas/css/slide.css">
	<link rel="stylesheet" href="<?php echo $url; ?>vistas/css/productos.css">
	<link rel="stylesheet" href="<?php echo $url; ?>vistas/css/infoproducto.css">
	<link rel="stylesheet" href="<?php echo $url; ?>vistas/css/perfil.css">
	<link rel="stylesheet" href="<?php echo $url; ?>vistas/css/carrito-de-compras.css">
	<link rel="stylesheet" href="<?php echo $url; ?>vistas/css/ofertas.css">
	<link rel="stylesheet" href="<?php echo $url; ?>vistas/css/footer.css">
	
	<!--=====================================
	PLUGINS DE JAVASCRIPT
	======================================-->

	<script src="<?php echo $url; ?>vistas/js/plugins/jquery.min.js"></script>
	<script src="<?php echo $url; ?>vistas/js/plugins/bootstrap.min.js"></script>
	<script src="<?php echo $url; ?>vistas/js/plugins/jquery.easing.js"></script>
	<script src="<?php echo $url; ?>vistas/js/plugins/jquery.scrollUp.js"></script>
	<script src="<?php echo $url; ?>vistas/js/plugins/jquery.flexslider.js"></script>
	<script src="<?php echo $url; ?>vistas/js/plugins/sweetalert.min.js"></script>
	<script src="<?php echo $url; ?>vistas/js/plugins/md5-min.js"></script>
	<script src="<?php echo $url; ?>vistas/js/plugins/dscountdown.min.js"></script>
	<script src="<?php echo $url; ?>vistas/js/plugins/knob.jquery.js"></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	
	  <!-- IMAGEN DE LOADING JS -->
	<script type="text/javascript" src="<?php echo $url; ?>vistas/js/plugins/loading-bar.js"></script>
	

	<!--=====================================
	CAPTCHA
	======================================-->
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>

	<!--=====================================
	Pixel de Facebook
	======================================-->

	<?php echo $plantilla["pixelFacebook"]; ?>
	


</head>

<body>
    
    <script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1668989089899154',
      xfbml      : true,
      version    : 'v7.0'
    });
    FB.AppEvents.logPageView();
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
    


    <!--=====================================
	JS PARA CULQI
	======================================-->
    <!-- Incluyendo Culqi Checkout -->
    <script src="https://checkout.culqi.com/js/v3"></script>    


<?php

/*=============================================
CABEZOTE
=============================================*/

include "modulos/cabezote.php";

/*=============================================
CONTENIDO DINÁMICO
=============================================*/

$rutas = array();
$ruta = null;
$infoProducto = null;

if(isset($_GET["ruta"])){

	$rutas = explode("/", $_GET["ruta"]);

	$item = "ruta";
	$valor =  $rutas[0];

	/*=============================================
	URL'S AMIGABLES DE CATEGORÍAS
	=============================================*/

	$rutaCategorias = ControladorProductos::ctrMostrarCategorias($item, $valor);

	if($rutas[0] == $rutaCategorias["ruta"] && $rutaCategorias["estado"] == 1){

		$ruta = $rutas[0];

	}

	/*=============================================
	URL'S AMIGABLES DE SUBCATEGORÍAS
	=============================================*/

	$rutaSubCategorias = ControladorProductos::ctrMostrarSubCategorias($item, $valor);

	foreach ($rutaSubCategorias as $key => $value) {
		
		if($rutas[0] == $value["ruta"] && $value["estado"] == 1){

			$ruta = $rutas[0];

		}

	}

	/*=============================================
	URL'S AMIGABLES DE PRODUCTOS
	=============================================*/

	$rutaProductos = ControladorProductos::ctrMostrarInfoProducto($item, $valor);
	
	if($rutas[0] == $rutaProductos["ruta"] && $rutaProductos["estado"] == 1){

		$infoProducto = $rutas[0];

	}

	/*=============================================
	LISTA BLANCA DE URL'S AMIGABLES
	=============================================*/

	if($ruta != null || $rutas[0] == "videos-recomendados" || $rutas[0] == "lo-mas-vendido" || $rutas[0] == "lo-mas-visto"){

		include "modulos/productos.php";

	}else if($infoProducto != null){

		include "modulos/infoproducto.php";

	}else if($rutas[0] == "buscador" || $rutas[0] == "verificar" || $rutas[0] == "salir" || $rutas[0] == "perfil" || $rutas[0] == "carrito-de-compras" || $rutas[0] == "error" || $rutas[0] == "finalizar-compra" || $rutas[0] == "finalizar-compra-payu" || $rutas[0] == "curso" || $rutas[0] == "ofertas"){

		include "modulos/".$rutas[0].".php";

	}else if($rutas[0] == "inicio"){

		include "modulos/slide.php";
		include "modulos/destacados.php";

	}else{

		include "modulos/error404.php";

	}

}else{

	include "modulos/slide.php";
	include "modulos/destacados.php";
	
	
	include "modulos/visitas.php";
	include "modulos/referencia.php";

}


include "modulos/footer.php";

?>


<input type="hidden" value="<?php echo $url; ?>" id="rutaOculta">
<!--=====================================
JAVASCRIPT PERSONALIZADO
======================================-->

<script src="<?php echo $url; ?>vistas/js/cabezote.js"></script>
<script src="<?php echo $url; ?>vistas/js/plantilla.js"></script>
<script src="<?php echo $url; ?>vistas/js/slide.js"></script>
<script src="<?php echo $url; ?>vistas/js/buscador.js"></script>
<script src="<?php echo $url; ?>vistas/js/infoproducto.js"></script>
<script src="<?php echo $url; ?>vistas/js/usuarios.js"></script>
<script src="<?php echo $url; ?>vistas/js/registroFacebook.js"></script>
<script src="<?php echo $url; ?>vistas/js/carrito-de-compras.js"></script>
<script src="<?php echo $url; ?>vistas/js/visitas.js"></script>
<script src="<?php echo $url; ?>vistas/js/perfil.js"></script>

<!--=====================================
https://developers.facebook.com/
======================================-->

<?php echo $plantilla["apiFacebook"]; ?>

<script>

  /*=============================================
	COMPARTIR EN FACEBOOK
	https://developers.facebook.com/docs/      
	=============================================*/
	
	$(".btnFacebook").click(function(){

		FB.ui({

			method: 'share',
			display: 'popup',
	        href: '<?php echo $url.$cabeceras['ruta'];?>',
		}, function(response){});
		
	})

	/*=============================================
	COMPARTIR EN WHATSAPP
	https://developers.google.com/+/web/share/     
	=============================================*/

	$(".btnGoogle").click(function(){
	    
	    window.location.href = "whatsapp://send?text=https://<?php  echo $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];  ?> " + "- Entra al Link, tienes una recomendación en: Aquaria Depot";
		return false;

	})

</script>

	<!--=====================================
	GOOGLE ANALYTICS
	======================================-->

	<?php echo $plantilla["googleAnalytics"]; ?>


  <!-- DataTables https://datatables.net/-->
  <script src="<?php echo $url; ?>backend/vistas/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
  <script src="<?php echo $url; ?>backend/vistas/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
  <script src="<?php echo $url; ?>backend/vistas/bower_components/datatables.net-bs/js/dataTables.responsive.min.js"></script>
  <script src="<?php echo $url; ?>backend/vistas/bower_components/datatables.net-bs/js/responsive.bootstrap.min.js"></script>

  <!-- DataPicker JS -->
  <script src="<?php echo $url; ?>backend/vistas/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
  <script src="<?php echo $url; ?>backend/vistas/bower_components/bootstrap-datepicker/dist/locales/bootstrap-datepicker.es.min.js"></script>  

	<!--=====================================
	VISTA MODAL DE POP-UP
	======================================-->
	
	
<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="popup" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>This is a large modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>


</body>


</html>