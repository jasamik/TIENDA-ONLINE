<!--=====================================
VALIDAR SESIÓN
======================================-->

<?php

$url = Ruta::ctrRuta();
$servidor = Ruta::ctrRutaServidor();

if(!isset($_SESSION["validarSesion"])){

	echo '<script>
	window.location = "'.$url.'";
	</script>';

	exit();

}

if(isset($_GET["merchantId"])){

  echo '<script>

    localStorage.removeItem("listaProductos");
    localStorage.removeItem("cantidadCesta");
    
    localStorage.removeItem("sumaCesta");

    </script>';

}

?>

<!--=====================================
BREADCRUMB PERFIL
======================================-->

<div class="container-fluid well well-sm">
	
	<div class="container">
		
		<div class="row">
			
			<ul class="breadcrumb fondoBreadcrumb text-uppercase">
				
				<li><a href="<?php echo $url;  ?>">INICIO</a></li>
				<li class="active pagActiva"><?php echo $rutas[0] ?></li>

			</ul>

		</div>

	</div>

</div>

<!--=====================================
SECCIÓN PERFIL
======================================-->

<div class="container-fluid">

	<div class="container">

		<ul class="nav nav-tabs">
		  
	  		<li class="active">	  			
			  	<a data-toggle="tab" href="#compras">
			  	<i class="fa fa-list-ul"></i> Mis Compras </a>
	  		</li>

	  		<li> 				
		  		<a data-toggle="tab" href="#deseos">
		  		<i class="fa fa-gift"></i> Mis Deseados </a>
	  		</li>

	  		<li>				
	  			<a data-toggle="tab" href="#perfil">
	  			<i class="fa fa-user"></i> Editar Perfil </a>
	  		</li>

	  		<li>				
		 	 	<a href="<?php echo $url; ?>ofertas">
		 	 	<i class="fa fa-star"></i>	Ofertas </a>
	  		</li>
	  		
	  		<li> 				
		  		<a data-toggle="tab" href="#videos">
		  		<i class="fa fa-play-circle"></i> Mis videos </a>
	  		</li>
	  		
	  		<li> 				
		  		<a data-toggle="tab" href="#tools">
		  		<i class="fa fa-clipboard"></i> Herramientas </a>
	  		</li>
	  		
	  		<li>				
	  			<a data-toggle="tab" href="#libros">
	  			<i class="fa fa-book"></i> Libros Gratuitos </a>
	  		</li>
		
		</ul>

<div class="tab-content">
		    
		    
		    
<!--=====================================
MIS VIDEOS
======================================-->

<div id="videos" class="tab-pane fade">
		    	
			<?php

				$item = $_SESSION["id"];
				$videos = ControladorUsuarios::ctrMostrarVideos($item);
		

				if(!$videos){
		    
					echo '<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center error404">
			    		<h1><small>¡Oops!</small></h1>
	    	    		<h2>Aún no tiene Videos Favoritos en su lista de Videos</h2>
    			  		</div>';
			
				}else{

					foreach ($videos as $key => $value1) {

						$ordenar = "id";
						$valor = $value1["id_producto"];
						$item = "id";

						$productos = ControladorProductos::ctrListarProductos($ordenar, $item, $valor);

						echo '<ul class="grid0">';

							foreach ($productos as $key => $value2) {
							
							echo '<li class="col-md-3 col-sm-6 col-xs-12">

									<figure>
                                    	<a href="'.$url.$value2["ruta"].'" class="pixelProducto">
										<img src="'.$servidor.$value2["portada"].'" class="img-responsive">
    									</a>
									</figure>

									<h4>
							
									<small>
										<a href="'.$url.$value2["ruta"].'" class="pixelProducto">
										
												'.$value2["titulo"].'<br>

												<span style="color:rgba(0,0,0,0)">-</span>';

												if($value2["nuevo"] != 0){

													echo '<span class="label label-warning fontSize">Nuevo</span> ';

												}

												if($value2["oferta"] != 0){

													echo '<span class="label label-warning fontSize">'.$value2["descuentoOferta"].'% off</span>';

												}

											echo '</a>	

										</small>			

									</h4>

									<div class="col-xs-6 precio">';

									if($value2["precio"] == 0){

										echo '<h2 style="margin-top:-10px"><small>GRATIS</small></h2>';

									}else{

										if($value2["oferta"] != 0){

											echo '<h2 style="margin-top:-10px">

													<small>
								
														<strong class="oferta" style="font-size:12px">S/. '.$value2["precio"].'</strong>

													</small>

													<small>$'.$value2["precioOferta"].'</small>
												
												</h2>';

										}else{

											echo '<h2 style="margin-top:-10px"><small>S/. '.$value2["precio"].'</small></h2>';

										}
										
									}
													
									echo '</div>

									<div class="col-xs-6 enlaces">
										
										<div class="btn-group pull-right">
											
											<button type="button" class="btn btn-danger btn-xs quitarDeseo" idDeseo="'.$value1["id"].'" data-toggle="tooltip" title="Quitar de mi lista de deseos">
												
												<i class="fa fa-heart" aria-hidden="true"></i>

											</button>';

											if($value2["tipo"] == "virtual" && $value2["precio"] != 0){

												if($value2["oferta"] != 0){

													echo '<button type="button" class="btn btn-default btn-xs agregarCarrito"  idProducto="'.$value2["id"].'" imagen="'.$servidor.$value2["portada"].'" titulo="'.$value2["titulo"].'" precio="'.$value2["precioOferta"].'" tipo="'.$value2["tipo"].'" peso="'.$value2["peso"].'" data-toggle="tooltip" title="Agregar al carrito de compras">

													<i class="fa fa-shopping-cart" aria-hidden="true"></i>

													</button>';

												}else{

													echo '<button type="button" class="btn btn-default btn-xs agregarCarrito"  idProducto="'.$value2["id"].'" imagen="'.$servidor.$value2["portada"].'" titulo="'.$value2["titulo"].'" precio="'.$value2["precio"].'" tipo="'.$value2["tipo"].'" peso="'.$value2["peso"].'" data-toggle="tooltip" title="Agregar al carrito de compras">

													<i class="fa fa-shopping-cart" aria-hidden="true"></i>

													</button>';

												}

											}

											echo '<a href="'.$url.$value2["ruta"].'" class="pixelProducto">
											
												<button type="button" class="btn btn-default btn-xs" data-toggle="tooltip" title="Ver producto">
													
													<i class="fa fa-eye" aria-hidden="true"></i>

												</button>	
											
											</a>

										</div>

									</div>

								</li>';
							}

						echo '</ul>';


					}

				}

			?>


		  	</div>
		    
		    
		     <!--=====================================
			MIS HERRAMIENTAS
			======================================-->
			
			<?php
			echo '<input type="hidden" id="usuarioID" value="'.$_SESSION["id"].'">'
            ?>
			
				

<div id="tools" class="tab-pane fade">
    
<!--=====================================
INICIO DE BITACORA
======================================-->

<div class="panel-group">
<div class="panel-body">
        
<div class="row">
<div class="col-md-12 col-sm-12 col-xs-12">
	    	    
<div class="panel panel-primary ">
<div class="panel-heading">Bitacora de Valores de Test</div>
<div class="panel-body">
  
<section class="content">

<div class="box">

      <div class="box-header with-border">
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#agregarBitacora" data-title="Agregar"><i class="fa fa-plus-circle"></i>
            Agregar Valores
          </button>
          <br>
      </div>
 <br>
      <div class="box-body">
        <table class="table table-bordered table-striped dt-responsive tbl_herramientas" width="100%">
          <thead>
            <tr>
                <th style="width:10px">#</th>
                <th>Fecha</th>
                <th>Temperatura</th>
                <th>Salinidad</th>
                <th>PH</th>
                <th>NO2</th>
                <th>NH3</th>
                <th>NO3</th>
                <th>PO4</th>
                <th>CA</th>
                <th>MG</th>
                <th>KH</th>
                <th>Acciones</th>
            </tr>
         </thead>
        </table> 
        </div>
        </div>
        </section>
        
        </div>
        </div>
        </div>
        </div>
        </div>
        </div>
<!--=====================================
FIN DE BITACORA
======================================-->


<!--=====================================
INICIO DE CALCULADORA
======================================-->

<div class="panel-group">
<div class="panel-body">
        
<div class="row">
<div class="col-md-12 col-sm-12 col-xs-12">
	    	    
<div class="panel panel-primary ">
<div class="panel-heading">Calculadora para Armado de Acuario y volumen de Agua.</div>
<div class="panel-body">
  
<section class="content">
<div class="box">

<div class="row">
    
<div class="col-md-5 col-sm-12 col-xs-12"> 
<img src="https://cdn-sa-ec.yottaa.net/5a689bc2312e585c4c5cd95c/283874102bad01362487123dfe2baf36.yottaa.net/v~4b.94/IMD/MD_images/Calculators/Aquarium/Rectangle/Rectangle_01.jpg?yocs=O_E_H_" class="imgCalcular" />
<p>
 <strong>Grosor del Vidrio:</strong> 0.4cm, 0.6cm, 0.8cm, 1.0cm, 1.2cm ...
</p>
</div>

<div class="col-md-5 col-sm-12 col-xs-12"> 
<img src="https://cdn-sa-ec.yottaa.net/5a689bc2312e585c4c5cd95c/283874102bad01362487123dfe2baf36.yottaa.net/v~4b.94/IMD/MD_images/Calculators/Aquarium/Rectangle/Rectangle_02.jpg?yocs=O_E_H_" class="imgCalcular" />          
</div>

<div class="col-md-2 col-sm-12 col-xs-12"> 

<p>Complete todos los campos en cm:</p>

    <form id="frmCalculadora" method="POST">
        
    <label>Largo (L):</label>
    <input type="number" class="form-control" id="largo" name="largo" placeholder="Ingrese el Largo" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==5) return false;">
      
    <label>Ancho (W):</label>
    <input type="number" class="form-control" id="ancho" name="ancho" placeholder="Ingrese el Ancho" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==5) return false;">

    <label>Alto (H):</label>
    <input type="number" class="form-control" id="alto" name="alto" placeholder="Ingrese el Alto" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==5) return false;">

    <label>Grosor Vidrio(cm):</label>
    <input type="number" class="form-control" id="grosor" name="grosor" max="2" placeholder="0.0" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==2) return false;">

<br>

    <button class="btn btn-primary" id="btncalcular" style="width: 100%;"><span class="glyphicon glyphicon-phone"></span> Calcular</button>
            
    </form>
</div>

</div>
<br><br>
<div class="row">
    
    <div class="col-md-12 col-sm-12 col-xs-12">
        
        <div class="panel-group resultadoVolumen" style="display: none;">
            <div class="panel panel-primary ">
                <div class="panel-heading">RESULTADOS :</div>
            <div class="panel-body">
                
                
    <div class="row">
        
        <div class="col-md-4 col-sm-12 col-xs-12">
               
           <h5> El Volumen Del Acuario es : <span class="resultado"></span></h5>
           
        </div>

        <div class="col-md-8 col-sm-12 col-xs-12">
            
        <h5> Tamaños de Vidrios que Necesita comprar :</h5>
        <br>

        <table class="table table-bordered table-striped dt-responsive" width="100%">
          <thead>
            <tr>
                <th>Cantidad</th>
                <th>Medidas</th>
                <th>Tipo</th>
                <th>Grosor</th>
            </tr>
         </thead>
        <tbody>
            <tr class="filafondo">
                <td>1</td>
                <td></td>
                <td>Base</td>
                <td></td>
            </tr>
            <tr class="filafondo1">
                <td>2</td>
                <td></td>
                <td>Largo</td>
                <td></td>
            </tr>
            <tr class="filafondo2">
                <td>2</td>
                <td></td>
                <td>Ancho</td>
                <td></td>
            </tr>            
            <tr  class="filafondo3">
                <td>2</td>
                <td></td>
                <td>tirantes</td>
                <td></td>
            </tr>
        <tbody>
        </table> 
        
    </div>
     </div>
    
            </div>
          </div>
        </div>
        
    </div>
</div>

</div>
</section>
        
        </div>
        </div>
        </div>
        </div>
        </div>
        </div>

<!--=====================================
FIN DE CALCULADORA
======================================-->
        </div>


            
<!--=====================================
VISTA MODAL AGREGAR 
======================================-->
<div id="agregarBitacora" class="modal fade" role="dialog"> 
  <div class="modal-dialog">    
    <div class="modal-content">
      <form method="POST" id="frmBitacoraAgregar">
        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->
        <div class="modal-header" style="color:black">          
          
          <button type="button" class="close" data-dismiss="modal">&times;</button>        
			<div class="col-md-3 col-sm-2 col-xs-12" id="logotipo">
			<img src="https://backend.aquariadepot.com/vistas/img/plantilla/logo.png" class="img-responsive">
			</div>
          
        </div>
        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->
        <div class="modal-body">       
         <div class="box-body">
            <!--=====================================
            ENTRADA PARA LOS VALORES
            ======================================-->
            <div class="form-group">

              
            <div class="panel panel-primary">
            <div class="panel-heading">Agregar Valores</div>
            <div class="panel-body">
    
            <div class="row">
            
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Fecha :</label>
            <input type="text" class="form-control datepicker" id="fecha" name="fecha" value="<?php echo date("Y-m-d");?>" required>
            </div>
      
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Temperatura :</label>
            <input type="number" class="form-control" id="temperatura" name="temperatura" placeholder="º C"  pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==2) return false;">
            </div>
            
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Salinidad :</label>
            <input type="number" class="form-control" id="salinidad" name="salinidad" placeholder="1015 - 1030" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;">
            </div>

            </div>
            <br>

            <div class="row">
                
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>PH :</label>
            <input type="number" class="form-control" id="ph" name="ph" placeholder="PH"  pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;">
            </div>
            
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Nitritos :</label>
            <input type="number" class="form-control" id="nitritos" name="nitritos" placeholder="NO2"  pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;">
            </div>
            
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Amoniaco :</label>
            <input type="number" class="form-control" id="amoniaco" name="amoniaco" placeholder="NH3"  pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;">
            </div> 

            </div>
            <br>
    
            <div class="row">
                
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Nitratos :</label>
            <input type="number" class="form-control" id="nitratos" name="nitratos" placeholder="NO3"  pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;">
            </div>
            
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Fosfatos :</label>
            <input type="number" class="form-control" id="fosfatos" name="fosfatos" placeholder="PO4"  pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;">
            </div>
            
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Calcio :</label>
            <input type="number" class="form-control" id="calcio" name="calcio" placeholder="CA"  pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;">
            </div>

            </div>
            <br>
    
            <div class="row">
                
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Magnesio :</label>
            <input type="number" class="form-control" id="magnesio" name="magnesio" placeholder="MG" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;">
            </div>
            
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Alcalinidad :</label>
            <input type="number" class="form-control" id="alcalinidad" name="alcalinidad" placeholder="KH" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;">
            </div>        
        
            </div>
    
            </div>
            </div>
            </div>

        <!--=====================================
        PIE DEL MODAL
        ======================================-->

        <div class="modal-footer">
          <button type="button" class="btn btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-share-alt"> </span> Salir</button>
          <button type="button" id="btnGuardarBitacora"class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"> </span> Guardar Valores</button>
        </div>
        
    </div>
    </div>

    </form>
    
 
    </div>
    </div>
    </div>
    
<!--=====================================
FIN DE MODAL AGREGAR 
======================================-->



			
			
			
<!--=====================================
VISTA MODAL EDITAR 
======================================-->
<div id="editarBitacora" class="modal fade" role="dialog"> 

    <div style="display: none" class="precarga ajaximg"></div>            

  <div class="modal-dialog">    
    <div class="modal-content">
          
      <form method="POST" id="frmBitacoraEditar">

       <input type="hidden" class="editarIdBitacora" name="editarIdBitacora" id="editarIdBitacora"> 
       <?php
       echo '<input type="hidden" id="usuarioID" value="'.$_SESSION["id"].'">'
       ?> 
        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->
        <div class="modal-header" style="color:black">  
        <button type="button" class="close editarClose" data-dismiss="modal">&times;</button>        
			<div class="col-md-3 col-sm-2 col-xs-12" id="logotipo">
			<img src="https://backend.aquariadepot.com/vistas/img/plantilla/logo.png" class="img-responsive">
			</div>
        </div>
        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->
        <div class="modal-body">       
         <div class="box-body">
            <!--=====================================
            ENTRADA PARA LOS VALORES
            ======================================-->
            <div class="form-group">
            <div class="panel panel-primary">
            <div class="panel-heading">Editar Valores</div>
            <div class="panel-body">
          
                
            <div class="row">
          
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Fecha :</label>
            <input type="text" class="form-control datepicker fecha2" id="fecha2" name="fecha2" value="<?php echo date("Y-m-d");?>" required>
            </div>
      
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Temperatura :</label>
            <input type="number" class="form-control temperatura2" id="temperatura2" name="temperatura2" placeholder="º C"  pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==2) return false;">
            </div>
            
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Salinidad :</label>
            <input type="number" class="form-control salinidad" name="salinidad" placeholder="1015 - 1030" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;">
            </div>

            </div>
            <br>

            <div class="row">
                
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>PH :</label>
            <input type="number" class="form-control ph" name="ph" placeholder="PH"  pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;">
            </div>
            
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Nitritos :</label>
            <input type="number" class="form-control nitritos" name="nitritos" placeholder="NO2"  pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;">
            </div>
            
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Amoniaco :</label>
            <input type="number" class="form-control amoniaco" name="amoniaco" placeholder="NH3"  pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;">
            </div> 

            </div>
            <br>
    
            <div class="row">
                
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Nitratos :</label>
            <input type="number" class="form-control nitratos" name="nitratos" placeholder="NO3"  pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;">
            </div>
            
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Fosfatos :</label>
            <input type="number" class="form-control fosfatos" name="fosfatos" placeholder="PO4"  pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;">
            </div>
            
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Calcio :</label>
            <input type="number" class="form-control calcio" name="calcio" placeholder="CA"  pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;">
            </div>

            </div>
            <br>
    
            <div class="row">
                
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Magnesio :</label>
            <input type="number" class="form-control magnesio" name="magnesio" placeholder="MG" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;">
            </div>
            
            <div class="col-lg-4 col-md-4 col-sm-12">
            <label>Alcalinidad :</label>
            <input type="number" class="form-control alcalinidad " name="alcalinidad" placeholder="KH" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;">
            </div>        
        
            </div>
    
            </div>
            </div>
            </div>
        <!--=====================================
        PIE DEL MODAL
        ======================================-->

        <div class="modal-footer">
          <button type="button" class="btn btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-share-alt"> </span> Salir</button>
          <button type="button" id="btnEditarBitacora"class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"> </span> Guardar Valores</button>
        </div>

    </div>
    </div>

    </form>
    
    </div>
    </div>
    </div>
    
<!--=====================================
FIN DE MODAL EDITAR 
======================================-->
			
			
		    
		    
<!--=====================================
LIBRO RECOMENDADOS
======================================-->
	  		<div id="libros" class="tab-pane fade">
			<div class="panel-group">
			    
			    <div class="panel panel-default">
			    <div class="panel-body">
			        
			        <div class="row">
			    
			    	<div class="col-md-2 col-sm-6 col-xs-12">
						<figure>
                        <img class="img-thumbnail" src="https://aquariadepot.com/libros/img/marinos.jpg">
						</figure>
					</div>
					<div class="col-sm-6 col-xs-12">
						<h1><small>Catalogo de Peces Marinos</small></h1>
						<p ALIGN="justify">Hace años mantener un acuario marino era bastante difícil, y un acuario de invertebrados era algo sólo para expertos, pero afortunadamente...</p>
						<a href="https://drive.google.com/file/d/10puqYOwlRFrJY6Xoxc6a-bRoIIG5aq_t/view?usp=sharing" class="btn btn-primary">Descargar</a>
					</div>

                	</div>
                	
                	<hr>
                	
			        <div class="row">
			    
			    	<div class="col-md-2 col-sm-6 col-xs-12">
						<figure>
                        <img class="img-thumbnail" src="https://aquariadepot.com/libros/img/guppy.jpg">
						</figure>
					</div>
					<div class="col-sm-6 col-xs-12">
						<h1><small>Catalogo de Guppys</small></h1>
						<p ALIGN="justify">Dentro de las variedades de Guppy, podemos clasificar a este pez como uno de los más bonitos y variados, no sólo por la forma y tamaño de su cola, ...</p>
						<a href="https://drive.google.com/file/d/1CscvcPbUOjM9NjdsAPMvF4LE7rNfBXqL/view?usp=sharing" class="btn btn-primary">Descargar</a>
					</div>

                	</div>
                	
                	<hr>
                	
			        <div class="row">
			    
			    	<div class="col-md-2 col-sm-6 col-xs-12">
						<figure>
                        <img class="img-thumbnail" src="https://aquariadepot.com/libros/img/dulce.jpg">
						</figure>
					</div>
					<div class="col-sm-6 col-xs-12">
						<h1><small>Catalogo de Peces e Invertebrados de Agua dulce</small></h1>
						<p ALIGN="justify">Un super catalogo sobre distintos peces de agua dulce e invertebrados, para todos los aficionados que se inician en este fascinante mundo de la acuariofilia...</p>
						<a href="https://drive.google.com/file/d/18de05pt29h7AJW4Vr4YbrQEXYStU3iWD/view?usp=sharing" class="btn btn-primary">Descargar</a>
					</div>

                	</div>
                	
                	<hr>
                	
                				        <div class="row">
			    
			    	<div class="col-md-2 col-sm-6 col-xs-12">
						<figure>
                        <img class="img-thumbnail" src="https://aquariadepot.com/libros/img/betta.jpg">
						</figure>
					</div>
					<div class="col-sm-6 col-xs-12">
						<h1><small>Catalogo de Peces Betta</small></h1>
						<p ALIGN="justify"> Los temas aquí expuestos forman parte de experiencias y conocimientos de distintos Betteros en el mundo, el margen de error puede presentarse en algunas...</p>
						<a href="https://drive.google.com/file/d/1-PDGkMWmDpkRlyc5MDEj0d2npUkPSKtd/view?usp=sharing" class="btn btn-primary">Descargar</a>
					</div>

                	</div>
                	
                	<hr>
                	
                				        <div class="row">
			    
			    	<div class="col-md-2 col-sm-6 col-xs-12">
						<figure>
                        <img class="img-thumbnail" src="https://aquariadepot.com/libros/img/discus.jpg">
						</figure>
					</div>
					<div class="col-sm-6 col-xs-12">
						<h1><small>Catalogo de Peces Discus</small></h1>
						<p ALIGN="justify">Los peces discus no son peces sencillos, es algo que debemos saber. Debemos tratarlos como verdaderos reyes del acuario de agua dulce...</p>
						<a href="https://drive.google.com/file/d/1w83T9HPAezv-NdeFbqj9TZEYunxpLGTH/view?usp=sharing" class="btn btn-primary">Descargar</a>
					</div>

                	</div>
                	
                	<hr>
                	
                				        <div class="row">
			    
			    	<div class="col-md-2 col-sm-6 col-xs-12">
						<figure>
                        <img class="img-thumbnail" src="https://aquariadepot.com/libros/img/discus1.jpg">
						</figure>
					</div>
					<div class="col-sm-6 col-xs-12">
						<h1><small>Discos la Verdad al Desnudo</small></h1>
						<p ALIGN="justify">Hace años mantener un acuario marino era bastante difícil, y un acuario de invertebrados era algo sólo para expertos, pero afortunadamente...</p>
						<a href="https://drive.google.com/file/d/13esCSnsU6nLCb-PRzXYRkb56gQVqu5im/view?usp=sharing" class="btn btn-primary">Descargar</a>
					</div>

                	</div>
                	
                	<hr>
                	
                				        <div class="row">
			    
			    	<div class="col-md-2 col-sm-6 col-xs-12">
						<figure>
                        <img class="img-thumbnail" src="https://aquariadepot.com/libros/img/guppy1.jpg">
						</figure>
					</div>
					<div class="col-sm-6 col-xs-12">
						<h1><small>El mundo del Guppy</small></h1>
						<p ALIGN="justify">os guppies son peces tropicales de agua dulce originarios de América del Sur, y son de la familia Poeciliidae. Es muy conocido por su color...</p>
						<a href="https://drive.google.com/file/d/1cQBtGcQMhS-zITwYPPYx5Ipb9d4HnxZM/view?usp=sharing" class="btn btn-primary">Descargar</a>
					</div>

                	</div>
                	
                	<hr>
                	
                				        <div class="row">
			    
			    	<div class="col-md-2 col-sm-6 col-xs-12">
						<figure>
                        <img class="img-thumbnail" src="https://aquariadepot.com/libros/img/revista9.jpg">
						</figure>
					</div>
					<div class="col-sm-6 col-xs-12">
						<h1><small>Revista Acuariofilia Total - Nº 09</small></h1>
						<p ALIGN="justify">Tal vez no haya un nivel de acuarismo que cause más dolores de cabeza al iniciarse que el famoso acuarismo con agua salada....</p>
						<a href="https://drive.google.com/file/d/1estQGg3B2caFpVtcalbp8pFSy_tIfgkr/view?usp=sharing" class="btn btn-primary">Descargar</a>
					</div>

                	</div>
                	
                	<hr>
                	
                				        <div class="row">
			    
			    	<div class="col-md-2 col-sm-6 col-xs-12">
						<figure>
                        <img class="img-thumbnail" src="https://aquariadepot.com/libros/img/revista10.jpg">
						</figure>
					</div>
					<div class="col-sm-6 col-xs-12">
						<h1><small>Revista Acuariofilia Total - Nº 10</small></h1>
						<p ALIGN="justify">Hace más de mil años, en China, se empezó a criar un pez. Éste era de gran popularidad, al cual hoy en día conocemos como Goldfish...</p>
						<a href="https://drive.google.com/file/d/1SyddpbJCigPEMptI8wenf-3k-99_FP3r/view?usp=sharing" class="btn btn-primary">Descargar</a>
					</div>

                	</div>
                	
                	<hr>
                	
                				        <div class="row">
			    
			    	<div class="col-md-2 col-sm-6 col-xs-12">
						<figure>
                        <img class="img-thumbnail" src="https://aquariadepot.com/libros/img/biotipe.jpg">
						</figure>
					</div>
					<div class="col-sm-6 col-xs-12">
						<h1><small>Biotope Aquarium Magazine</small></h1>
						<p ALIGN="justify">Esta revista nace en Biotope Aquarium Forum, con la idea de divulgar, el conocimiento sobre la procedencia, de las especies que mantenemos habitualmente...</p>
						<a href="https://drive.google.com/file/d/1g8rF4_UT-insOAcOZI9Ba_ys1IyvJqVT/view?usp=sharing" class="btn btn-primary">Descargar</a>
					</div>

                	</div>
                	
                	<hr>
                	
                				        <div class="row">
			    
			    	<div class="col-md-2 col-sm-6 col-xs-12">
						<figure>
                        <img class="img-thumbnail" src="https://aquariadepot.com/libros/img/manual.jpg">
						</figure>
					</div>
					<div class="col-sm-6 col-xs-12">
						<h1><small>Manual Acuario Marino</small></h1>
						<p ALIGN="justify">Hasta hace muy poco el mantenimiento de un acuario marino sólo era posible para los afortunados poseedores de grandes instalaciones. Grandes urnas y tanques de cristal con sofisticados sistemas...</p>
						<a href="https://drive.google.com/file/d/1GB0UvIXtkvnMlk_Sy0J6zeGi0RU0UkPW/view?usp=sharing" class="btn btn-primary">Descargar</a>
					</div>

                	</div>
                	
                	<hr>
                	
                				        <div class="row">
			    
			    	<div class="col-md-2 col-sm-6 col-xs-12">
						<figure>
                        <img class="img-thumbnail" src="https://aquariadepot.com/libros/img/atlas.jpg">
						</figure>
					</div>
					<div class="col-sm-6 col-xs-12">
						<h1><small>Atlas de Peces de Acuarios Marinos</small></h1>
						<p ALIGN="justify">Un Atlas muy detallados sobre la inmensa diversidad de peces marinos que servira como referente para elegir especies para iniciarnos en este amante mundo marino...</p>
						<a href="https://drive.google.com/file/d/1mhVn022TAPyY91k8P4KsbxRQtp1tCIi7/view?usp=sharing" class="btn btn-primary">Descargar</a>
					</div>

                	</div>

                	
                	
                	                	<hr>
                	
                				        <div class="row">
			    
			    	<div class="col-md-2 col-sm-6 col-xs-12">
						<figure>
                        <img class="img-thumbnail" src="https://aquariadepot.com/libros/img/1.jpg">
						</figure>
					</div>
					<div class="col-sm-6 col-xs-12">
						<h1><small>The Cichlids Yearbook - vol. 01</small></h1>
						<p ALIGN="justify">La fascinación con los cíclidos ha llevado a muchos acuaristas al punto donde van y observan estos maravillosos peces en el hábitat natural....</p>
						<a href="https://drive.google.com/file/d/1qdd8mBsEXby4KE_s3b4Ar3CQpZHCkvfc/view?usp=sharing" class="btn btn-primary">Descargar</a>
					</div>

                	</div>
                	
                	                	<hr>
                	
                				        <div class="row">
			    
			    	<div class="col-md-2 col-sm-6 col-xs-12">
						<figure>
                        <img class="img-thumbnail" src="https://aquariadepot.com/libros/img/2.jpg">
						</figure>
					</div>
					<div class="col-sm-6 col-xs-12">
						<h1><small>Back to the Nature - Tanganika Cichlids</small></h1>
						<p ALIGN="justify">Los cíclidos del lago Tanganika engloban a más de 30 géneros de peces...</p>
						<a href="https://drive.google.com/file/d/1prjdDVKPqS-3YNSfyTYty19bQ2lcsjo-/view?usp=sharing" class="btn btn-primary">Descargar</a>
					</div>

                	</div>
                	
                	                	                	<hr>
                	
                				        <div class="row">
			    
			    	<div class="col-md-2 col-sm-6 col-xs-12">
						<figure>
                        <img class="img-thumbnail" src="https://aquariadepot.com/libros/img/aquarium world.jpg">
						</figure>
					</div>
					<div class="col-sm-6 col-xs-12">
						<h1><small>Back to the Nature - Tanganika Cichlids</small></h1>
						<p ALIGN="justify">Los cíclidos del lago Tanganika engloban a más de 30 géneros de peces...</p>
						<a href="https://drive.google.com/file/d/1prjdDVKPqS-3YNSfyTYty19bQ2lcsjo-/view?usp=sharing" class="btn btn-primary">Descargar</a>
					</div>

                	</div>
                
                	
                </div>
			    </div>
			    
			</div>
			</div>

			<!--=====================================
			PESTAÑA COMPRAS
			======================================-->

	  		<div id="compras" class="tab-pane fade in active">
		    
				<div class="panel-group">

				<?php

					$item = "id_usuario";
					$valor = $_SESSION["id"];

					$compras = ControladorUsuarios::ctrMostrarCompras($item, $valor);

					if(!$compras){

						echo '<div class="col-xs-12 text-center error404">
				               
				    		<h1><small>¡Oops!</small></h1>
				    
				    		<h2>Aún no tienes compras realizadas en esta tienda</h2>

				  		</div>';

					}else{

						foreach ($compras as $key => $value1) {

							$ordenar = "id";
							$item = "id";
							$valor = $value1["id_producto"];

							$productos = ControladorProductos::ctrListarProductos($ordenar, $item, $valor);

							foreach ($productos as $key => $value2) {
							
								echo '<div class="panel panel-default">
									    
									    <div class="panel-body">

											<div class="col-md-2 col-sm-6 col-xs-12">

												<figure>
												
													<img class="img-thumbnail" src="'.$servidor.$value2["portada"].'">

												</figure>

											</div>

											<div class="col-sm-6 col-xs-12">

												<h1><small>'.$value2["titulo"].'</small></h1>

												<p>'.$value2["titular"].'</p>';

												if($value2["tipo"] == "virtual"){

													echo '<a href="'.$url.'curso/'.$value1["id"].'/'.$value1["id_usuario"].'/'.$value1["id_producto"].'/'.$value2["ruta"].'">
														<button class="btn btn-default pull-left">Ir al curso</button>
														</a>';

												}else{

													echo '<h6>Proceso de entrega: '.$value2["entrega"].' días hábiles</h6>';

													if($value1["envio"] == 0){

														echo '<div class="progress">

															<div class="progress-bar progress-bar-info" role="progressbar" style="width:33.33%">
																<i class="fa fa-check"></i> Despachado
															</div>

															<div class="progress-bar progress-bar-default" role="progressbar" style="width:33.33%">
																<i class="fa fa-clock-o"></i> Enviando
															</div>

															<div class="progress-bar progress-bar-success" role="progressbar" style="width:33.33%">
																<i class="fa fa-clock-o"></i> Entregado
															</div>

														</div>';

													}

													if($value1["envio"] == 1){

														echo '<div class="progress">

															<div class="progress-bar progress-bar-info" role="progressbar" style="width:33.33%">
																<i class="fa fa-check"></i> Despachado
															</div>

															<div class="progress-bar progress-bar-default" role="progressbar" style="width:33.33%">
																<i class="fa fa-check"></i> Enviando
															</div>

															<div class="progress-bar progress-bar-success" role="progressbar" style="width:33.33%">
																<i class="fa fa-clock-o"></i> Entregado
															</div>

														</div>';

													}

													if($value1["envio"] == 2){

														echo '<div class="progress">

															<div class="progress-bar progress-bar-info" role="progressbar" style="width:33.33%">
																<i class="fa fa-check"></i> Despachado
															</div>

															<div class="progress-bar progress-bar-default" role="progressbar" style="width:33.33%">
																<i class="fa fa-check"></i> Enviando
															</div>

															<div class="progress-bar progress-bar-success" role="progressbar" style="width:33.33%">
																<i class="fa fa-check"></i> Entregado
															</div>

														</div>';

													}

												}

												echo '<h4 class="pull-right"><small>Comprado el '.substr($value1["fecha"],0,-8).'</small></h4>
																
											</div>

											<div class="col-md-4 col-xs-12">';

											$datos = array("idUsuario"=>$_SESSION["id"],
															"idProducto"=>$value2["id"] );

											$comentarios = ControladorUsuarios::ctrMostrarComentariosPerfil($datos);

												echo '<div class="pull-right">

													<a class="calificarProducto" href="#modalComentarios" data-toggle="modal" idComentario="'.$comentarios["id"].'">
													
														<button class="btn btn-default backColor">Calificar Producto</button>

													</a>

												</div>

												<br><br>

												<div class="pull-right">

													<h3 class="text-right">';

													if($comentarios["calificacion"] == 0 && $comentarios["comentario"] == ""){

														echo '<i class="fa fa-star-o text-success" aria-hidden="true"></i>
																<i class="fa fa-star-o text-success" aria-hidden="true"></i>
																<i class="fa fa-star-o text-success" aria-hidden="true"></i>
																<i class="fa fa-star-o text-success" aria-hidden="true"></i>
																<i class="fa fa-star-o text-success" aria-hidden="true"></i>';

													}else{

														switch($comentarios["calificacion"]){

															case 0.5:
															echo '<i class="fa fa-star-half-o text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>';
															break;

															case 1.0:
															echo '<i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>';
															break;

															case 1.5:
															echo '<i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-half-o text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>';
															break;

															case 2.0:
															echo '<i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>';
															break;

															case 2.5:
															echo '<i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-half-o text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>';
															break;

															case 3.0:
															echo '<i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>';
															break;

															case 3.5:
															echo '<i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-half-o text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>';
															break;

															case 4.0:
															echo '<i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-o text-success" aria-hidden="true"></i>';
															break;

															case 4.5:
															echo '<i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star-half-o text-success" aria-hidden="true"></i>';
															break;

															case 5.0:
															echo '<i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star text-success" aria-hidden="true"></i>
																  <i class="fa fa-star text-success" aria-hidden="true"></i>';
															break;

														}


													}
												
														
													echo '</h3>

													<p class="panel panel-default text-right" style="padding:5px">

														<small>

														'.$comentarios["comentario"].'

														</small>
													
													</p>

												</div>

											</div>

									    </div>

									</div>';

							}
							
						}
					}
				?>
				  
				

				</div>

		  	</div>

		  	<!--=====================================
			PESTAÑA DESEOS
			======================================-->

		  	<div id="deseos" class="tab-pane fade">
		    	
			<?php

				$item = $_SESSION["id"];

				$deseos = ControladorUsuarios::ctrMostrarDeseos($item);

				if(!$deseos){

					echo '<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center error404">
				               
			    		<h1><small>¡Oops!</small></h1>
			    
			    		<h2>Aún no tiene productos en su lista de deseos</h2>

			  		</div>';
				
				}else{

					foreach ($deseos as $key => $value1) {

						$ordenar = "id";
						$valor = $value1["id_producto"];
						$item = "id";

						$productos = ControladorProductos::ctrListarProductos($ordenar, $item, $valor);

						echo '<ul class="grid0">';

							foreach ($productos as $key => $value2) {
							
							echo '<li class="col-md-3 col-sm-6 col-xs-12">

									<figure>
										
										<a href="'.$url.$value2["ruta"].'" class="pixelProducto">
											
											<img src="'.$servidor.$value2["portada"].'" class="img-responsive">

										</a>

									</figure>

									<h4>
							
										<small>
											
											<a href="'.$url.$value2["ruta"].'" class="pixelProducto">
												
												'.$value2["titulo"].'<br>

												<span style="color:rgba(0,0,0,0)">-</span>';

												if($value2["nuevo"] != 0){

													echo '<span class="label label-warning fontSize">Nuevo</span> ';

												}

												if($value2["oferta"] != 0){

													echo '<span class="label label-warning fontSize">'.$value2["descuentoOferta"].'% off</span>';

												}

											echo '</a>	

										</small>			

									</h4>

									<div class="col-xs-6 precio">';

									if($value2["precio"] == 0){

										echo '<h2 style="margin-top:-10px"><small>GRATIS</small></h2>';

									}else{

										if($value2["oferta"] != 0){

											echo '<h2 style="margin-top:-10px">

													<small>
								
														<strong class="oferta" style="font-size:12px">S/. '.$value2["precio"].'</strong>

													</small>

													<small>$'.$value2["precioOferta"].'</small>
												
												</h2>';

										}else{

											echo '<h2 style="margin-top:-10px"><small>S/. '.$value2["precio"].'</small></h2>';

										}
										
									}
													
									echo '</div>

									<div class="col-xs-6 enlaces">
										
										<div class="btn-group pull-right">
											
											<button type="button" class="btn btn-danger btn-xs quitarDeseo" idDeseo="'.$value1["id"].'" data-toggle="tooltip" title="Quitar de mi lista de deseos">
												
												<i class="fa fa-heart" aria-hidden="true"></i>

											</button>';

											if($value2["tipo"] == "virtual" && $value2["precio"] != 0){

												if($value2["oferta"] != 0){

													echo '<button type="button" class="btn btn-default btn-xs agregarCarrito"  idProducto="'.$value2["id"].'" imagen="'.$servidor.$value2["portada"].'" titulo="'.$value2["titulo"].'" precio="'.$value2["precioOferta"].'" tipo="'.$value2["tipo"].'" peso="'.$value2["peso"].'" data-toggle="tooltip" title="Agregar al carrito de compras">

													<i class="fa fa-shopping-cart" aria-hidden="true"></i>

													</button>';

												}else{

													echo '<button type="button" class="btn btn-default btn-xs agregarCarrito"  idProducto="'.$value2["id"].'" imagen="'.$servidor.$value2["portada"].'" titulo="'.$value2["titulo"].'" precio="'.$value2["precio"].'" tipo="'.$value2["tipo"].'" peso="'.$value2["peso"].'" data-toggle="tooltip" title="Agregar al carrito de compras">

													<i class="fa fa-shopping-cart" aria-hidden="true"></i>

													</button>';

												}

											}

											echo '<a href="'.$url.$value2["ruta"].'" class="pixelProducto">
											
												<button type="button" class="btn btn-default btn-xs" data-toggle="tooltip" title="Ver producto">
													
													<i class="fa fa-eye" aria-hidden="true"></i>

												</button>	
											
											</a>

										</div>

									</div>

								</li>';
							}

						echo '</ul>';


					}

				}

			?>


		  	</div>

			<!--=====================================
			PESTAÑA PERFIL
			======================================-->
		  	
		  	<div id="perfil" class="tab-pane fade">
		    	
				<div class="row">
					
					<form method="post" enctype="multipart/form-data">
					
						<div class="col-md-3 col-sm-4 col-xs-12 text-center">
							
							<br>

							<figure id="imgPerfil">
								
							<?php

							echo '<input type="hidden" value="'.$_SESSION["id"].'" id="idUsuario" name="idUsuario">
							      <input type="hidden" value="'.$_SESSION["password"].'" name="passUsuario">
							      <input type="hidden" value="'.$_SESSION["foto"].'" name="fotoUsuario" id="fotoUsuario">
							      <input type="hidden" value="'.$_SESSION["modo"].'" name="modoUsuario" id="modoUsuario">';


							if($_SESSION["modo"] == "directo"){

								if($_SESSION["foto"] != ""){

									echo '<img src="'.$url.$_SESSION["foto"].'" class="img-thumbnail">';

								}else{

									echo '<img src="'.$servidor.'vistas/img/usuarios/default/anonymous.png" class="img-thumbnail">';

								}
					

							}else{

								echo '<img src="'.$_SESSION["foto"].'" class="img-thumbnail">';
							}		

							?>

							</figure>

							<br>

							<?php

							if($_SESSION["modo"] == "directo"){
							
							echo '<button type="button" class="btn btn-default" id="btnCambiarFoto">
									
									Cambiar foto de perfil
									
									</button>';

							}

							?>

							<div id="subirImagen">
								
								<input type="file" class="form-control" id="datosImagen" name="datosImagen">

								<img class="previsualizar">

							</div>

						</div>	

						<div class="col-md-9 col-sm-8 col-xs-12">

						<br>
							
						<?php

						if($_SESSION["modo"] != "directo"){

							echo '<label class="control-label text-muted text-uppercase">Nombre:</label>
									
									<div class="input-group">
								
										<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
										<input type="text" class="form-control"  value="'.$_SESSION["nombre"].'" readonly>

									</div>

									<br>
									
								<label class="control-label text-muted text-uppercase" for="editartelefono">Cambiar Teléfono:</label>
									
									<div class="input-group">
								
										<span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
										<input type="text" class="form-control" id="editartelefono" name="editartelefono" value="'.$_SESSION["telefono"].'" readonly>

									</div>

								<br>


									<label class="control-label text-muted text-uppercase">Correo electrónico:</label>
									
									<div class="input-group">
								
										<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
										<input type="text" class="form-control"  value="'.$_SESSION["email"].'" readonly>

									</div>

									<br>

									<label class="control-label text-muted text-uppercase">Modo de registro en el sistema:</label>
									
									<div class="input-group">
								
										<span class="input-group-addon"><i class="fa fa-'.$_SESSION["modo"].'"></i></span>
										<input type="text" class="form-control text-uppercase"  value="'.$_SESSION["modo"].'" readonly>

									</div>

									<br>';
		

						}else{

							echo '<label class="control-label text-muted text-uppercase" for="editarNombre">Cambiar Nombre:</label>
									
									<div class="input-group">
								
										<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
										<input type="text" class="form-control" id="editarNombre" name="editarNombre" value="'.$_SESSION["nombre"].'">

									</div>

								<br>
								
								<label class="control-label text-muted text-uppercase" for="editartelefono">Cambiar Teléfono:</label>
									
									<div class="input-group">
								
										<span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
										<input type="text" class="form-control" id="editartelefono" name="editartelefono" value="'.$_SESSION["telefono"].'">

									</div>
									

								<br>

								<label class="control-label text-muted text-uppercase" for="editarEmail">Cambiar Correo Electrónico:</label>

								<div class="input-group">
								
										<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
										<input type="text" class="form-control" id="editarEmail" name="editarEmail" value="'.$_SESSION["email"].'">

									</div>

								<br>

								<label class="control-label text-muted text-uppercase" for="editarPassword">Cambiar Contraseña:</label>

								<div class="input-group">
								
										<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
										<input type="text" class="form-control" id="editarPassword" name="editarPassword" placeholder="Escribe la nueva contraseña">

									</div>

								<br>

								<button type="submit" class="btn btn-default backColor btn-md pull-left">Actualizar Datos</button>';

						}

						?>

						</div>

						<?php

							$actualizarPerfil = new ControladorUsuarios();
							$actualizarPerfil->ctrActualizarPerfil();

						?>					

					</form>

					<button class="btn btn-danger btn-md pull-right" id="eliminarUsuario">Eliminar cuenta</button>

					<?php

							$borrarUsuario = new ControladorUsuarios();
							$borrarUsuario->ctrEliminarUsuario();

						?>	

				</div>

		  	</div>

		</div>

	</div>

</div>

<!--=====================================
VENTANA MODAL PARA COMENTARIOS
======================================-->

<div  class="modal fade modalFormulario" id="modalComentarios" role="dialog">
	
	<div class="modal-content modal-dialog">
		
		<div class="modal-body modalTitulo">
			
			<h3 class="backColor">CALIFICA ESTE PRODUCTO</h3>

			<button type="button" class="close" data-dismiss="modal">&times;</button>

			<form method="post" onsubmit="return validarComentario()">

				<input type="hidden" value="" id="idComentario" name="idComentario">
				
				<h1 class="text-center" id="estrellas">

		       		<i class="fa fa-star text-success" aria-hidden="true"></i>
					<i class="fa fa-star text-success" aria-hidden="true"></i>
					<i class="fa fa-star text-success" aria-hidden="true"></i>
					<i class="fa fa-star text-success" aria-hidden="true"></i>
					<i class="fa fa-star text-success" aria-hidden="true"></i>

				</h1>

				<div class="form-group text-center">

		       		<label class="radio-inline"><input type="radio" name="puntaje" value="0.5">0.5</label>
					<label class="radio-inline"><input type="radio" name="puntaje" value="1.0">1.0</label>
					<label class="radio-inline"><input type="radio" name="puntaje" value="1.5">1.5</label>
					<label class="radio-inline"><input type="radio" name="puntaje" value="2.0">2.0</label>
					<label class="radio-inline"><input type="radio" name="puntaje" value="2.5">2.5</label>
					<label class="radio-inline"><input type="radio" name="puntaje" value="3.0">3.0</label>
					<label class="radio-inline"><input type="radio" name="puntaje" value="3.5">3.5</label>
					<label class="radio-inline"><input type="radio" name="puntaje" value="4.0">4.0</label>
					<label class="radio-inline"><input type="radio" name="puntaje" value="4.5">4.5</label>
					<label class="radio-inline"><input type="radio" name="puntaje" value="5.0" checked>5.0</label>

				</div>

				<div class="form-group">
			  		
			  		<label for="comment" class="text-muted">Tu opinión acerca de este producto: <span><small>(máximo 300 caracteres)</small></span></label>
			  		
			  		<textarea class="form-control" rows="5" id="comentario" name="comentario" maxlength="300" required></textarea>

			  		<br>
					
					<input type="submit" class="btn btn-default backColor btn-block" value="ENVIAR">

				</div>

				<?php

					$actualizarComentario = new ControladorUsuarios();
					$actualizarComentario -> ctrActualizarComentario();

				?>

			</form>

		</div>

		<div class="modal-footer">
      	
      	</div>

	</div>

</div>
