
<?php

/*=============================================
CREADOR DE IP
=============================================*/

//https://www.browserling.com/tools/random-ip

$ip = $_SERVER['REMOTE_ADDR'];

//http://www.geoplugin.net/

$informacionPais = file_get_contents("http://www.geoplugin.net/json.gp?ip=".$ip);

$datosPais = json_decode($informacionPais);

$pais = $datosPais->geoplugin_countryName;
$codigo = $datosPais->geoplugin_countryCode;

$enviarIp = ControladorVisitas::ctrEnviarIp($ip, $pais, $codigo);

$totalVisitas = ControladorVisitas::ctrMostrarTotalVisitas();

?>

<!--=====================================
BREADCRUMB VISITAS
======================================

<div class="container-fluid well well-sm barraProductos">

			<div class="container">
				
				<div class="row">
					
					<div class="col-xs-12 organizarProductos">

						<div class="btn-group pull-right">

			<h4 class="pull-right"><small>Tu eres nuestro visitante #  echo $totalVisitas["total"];?></small></h4>
							
						</div>		

					</div>

				</div>

			</div>

		</div>-->

<!--=====================================
MÓDULO VISITAS
======================================

<div class="container-fluid">
	
	<div class="container">
		
		<div class="row">

		

		$paises = ControladorVisitas::ctrMostrarPaises();

		$coloresPaises = array("#09F","#900","#059","#260","#F09","#02A");	

		$indice = -1;

		foreach($paises as $key => $value){

			$promedio = $value["cantidad"] * 100 / $totalVisitas["total"];

			$indice++;
	
			echo '<div class="col-md-2 col-sm-4 col-xs-12 text-center">
				
					<h2 class="text-muted">'.$value["pais"].'</h2>

					<input type="text" class="knob" value="'.round($promedio).'" data-width="90" data-height="90" data-fgcolor="'.$coloresPaises[$indice].'" data-readonly="true">
 
					<p class="text-muted text-center" style="font-size:12px"> '.round($promedio).'% de las visitas</p>
	
				</div>';
		}


		?>

		</div>

	</div>

</div>-->