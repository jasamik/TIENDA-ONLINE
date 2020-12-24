<?php
    
    $url = Ruta::ctrRuta();

 ?>

<!--=====================================
BREADCRUMB CARRITO DE COMPRAS
======================================-->

<div class="container-fluid well well-sm">
	
	<div class="container">
		
		<div class="row">
			
			<ul class="breadcrumb fondoBreadcrumb text-uppercase">
				
				<li><a href="<?php echo $url;  ?>">CARRITO DE COMPRAS</a></li>
				<li class="active pagActiva"><?php echo $rutas[0] ?></li>

			</ul>

		</div>

	</div>

</div>

<!--=====================================
TABLA CARRITO DE COMPRAS
======================================-->

<div class="container-fluid">

	<div class="container">

		<div class="panel panel-default">
			
			<!--=====================================
			CABECERA CARRITO DE COMPRAS
			======================================-->

			<div class="panel-heading cabeceraCarrito">
				
				<div class="col-md-6 col-sm-7 col-xs-12 text-center">
					
					<h3>
						<small>PRODUCTO</small>
					</h3>

				</div>

				<div class="col-md-2 col-sm-1 col-xs-0 text-center">
					
					<h3>
						<small>PRECIO</small>
					</h3>

				</div>

				<div class="col-sm-2 col-xs-0 text-center">
					
					<h3>
						<small>CANTIDAD</small>
					</h3>

				</div>

				<div class="col-sm-2 col-xs-0 text-center">
					
					<h3>
						<small>SUBTOTAL</small>
					</h3>

				</div>

			</div>

			<!--=====================================
			CUERPO CARRITO DE COMPRAS
			======================================-->

			<div class="panel-body cuerpoCarrito">

				

			</div>

			<!--=====================================
			SUMA DEL TOTAL DE PRODUCTOS
			======================================-->

			<div class="panel-body sumaCarrito">

				<div class="col-md-4 col-sm-6 col-xs-12 pull-right well">
					
					<div class="col-xs-6">
						
						<h4>TOTAL:</h4>

					</div>

					<div class="col-xs-6">

						<h4 class="sumaSubTotal">
							
							

						</h4>

					</div> 

				</div>

			</div>

			<!--=====================================
			BOTÓN CHECKOUT
			======================================-->

			<div class="panel-heading cabeceraCheckout">

			<?php

				if(isset($_SESSION["validarSesion"])){

					if($_SESSION["validarSesion"] == "ok"){

						echo '<a id="btnCheckout" href="#modalCheckout" data-toggle="modal" idUsuario="'.$_SESSION["id"].'"><button class="btn btn-default backColor btn-lg pull-right">REALIZAR PAGO</button></a>';

					}


				}else{

					echo '<a href="#modalIngreso" data-toggle="modal"><button class="btn btn-default backColor btn-lg pull-right">REALIZAR PAGO</button></a>';
				}

			?>	

			</div>

		</div>

	</div>

</div>

<!--=====================================
VENTANA MODAL PARA CHECKOUT
======================================-->

<div id="modalCheckout" class="modal fade modalFormulario" role="dialog">
	
	 <div class="modal-content modal-dialog">
	 	
		<div class="modal-body modalTitulo">
		    
		  <div class="loading" style="position:absolute; display: none">
            <center>    
            <img src="https://aquariadepot.com/vistas/img/plantilla/712.gif"/><br><h3><strong>Un momento, estamos procesando su pago...</strong></h3>
            </center>    
            </div>
			
			<h3 class="backColor">REALIZAR PAGO</h3>

			<button type="button" class="close" data-dismiss="modal">&times;</button>

			<div class="contenidoCheckout">

				<?php

				$respuesta = ControladorCarrito::ctrMostrarTarifas();

				echo '<input type="hidden" id="tasaImpuesto" value="'.$respuesta["impuesto"].'">
					  <input type="hidden" id="envioNacional" value="'.$respuesta["envioNacional"].'">
				      <input type="hidden" id="envioInternacional" value="'.$respuesta["envioInternacional"].'">
				      <input type="hidden" id="tasaMinimaNal" value="'.$respuesta["tasaMinimaNal"].'">
				      <input type="hidden" id="tasaMinimaInt" value="'.$respuesta["tasaMinimaInt"].'">
				      <input type="hidden" id="tasaPais" value="'.$respuesta["pais"].'">
				      <input type="hidden" id="llavePublicaCulqi" value="'.$respuesta["llavePublicaCulqi"].'">
				      <input type="hidden" id="llaveSecretaCulqi" value="'.$respuesta["llaveSecretaCulqi"].'">
				      <input type="hidden" id="usuarioID" value="'.$_SESSION["id"].'">
				      <input type="hidden" id="usuarioNombre" value="'.$_SESSION["nombre"].'">
				      <input type="hidden" id="usuarioEmail" value="'.$_SESSION["email"].'">';
				     
				?>
				
				<div class="formEnvio row">
					
					<h4 class="text-center well text-muted text-uppercase">Información de envío</h4>
					
					<div class="form-group">

					<div class="col-xs-12 seleccionePais"> 
					</div>
					<br><br>
				
					<div class="col-xs-12 seleccioneDepartamento">
					</div>
					<br><br>
					
					<div class="col-xs-12 seleccioneProvincia">
					</div>
					<br><br>
				
					<div class="col-xs-12 seleccioneDistrito">
					</div>
					<br><br>
					
					<div class="col-xs-12" >
                    <input type="number" class="form-control input-md seleccionetelefono" id="telefono" placeholder="Ingrese su Celular." pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==9) return false;">
                 	</div>
					<br><br>
					
					<div class="col-xs-12" >
                    <textarea type="text" maxlength="320" rows="3" class="form-control input-md seleccionedireccion" id="direccion" placeholder="Ingresar la Dirección del Envío."></textarea>
                    </div>
                    
                    <div class="col-xs-12" >
                     <p><strong>Nota: </strong><small>Si el producto Adquirido lo desea recoger en nuestro local, el recargo del envío le será devuelto a la entrega del producto</small></p>
                    </div>
                    </div>

				</div>

				<div class="formaPago row">
					<input type="hidden" id="idUsuario" value="<?php echo $_SESSION["id"]; ?>">
				</div>

				<div class="listaProductos row">
					
					<h4 class="text-center well text-muted text-uppercase">Productos a comprar</h4>

					<table class="table table-striped tablaProductos">
						
						 <thead>
						 	
							<tr>		
								<th>Producto</th>
								<th>Cantidad</th>
								<th>Precio</th>
							</tr>

						 </thead>

						 <tbody>
						 	


						 </tbody>

					</table>
					
				<div class="col-sm-6 col-xs-12 pull-left">

					<figure>
						<center>
							<img src="<?php echo $url; ?>vistas/img/plantilla/logo_culqi.jpg" class="img-thumbnail">
                        </center>
					</figure><br><br>

				</div>

					<div class="col-sm-6 col-xs-12 pull-right">
						
						<table class="table table-striped tablaTasas">
							
							<tbody>
								
								<tr>
									<td>Subtotal</td>	
									<td><span class="cambioDivisa">PEN</span> S/. <span class="valorSubtotal" valor="0">0.00</span></td>	
								</tr>

								<tr>
									<td>Envío</td>	
									<td><span class="cambioDivisa">PEN</span> S/. <span class="valorTotalEnvio" valor="0">0.00</span></td>	
								</tr>

								<tr>
									<td>Impuesto</td>	
									<td><span class="cambioDivisa">PEN</span> S/. <span class="valorTotalImpuesto" valor="0">0.00</span></td>	
								</tr>

								<tr>
									<td><strong>Total</strong></td>	
									<td><strong><span class="cambioDivisa">PEN</span> S/. <span class="valorTotalCompra" valor="0">0.00</span></strong></td>	
								</tr>

							</tbody>	

						</table>

					</div>

					<div class="clearfix"></div>
                    
                    
    				<button class="btn btn-block btn-lg btn-default backColor btnPagar" id="buy_button">PAGAR</button>
    				




	       <!--=====================================
                    BOTON PAGAR DE CULQI
                    
                    INICIO
                    ======================================-->
                    
                    <!--=====================================
                	JS PARA CULQI
                	======================================-->

                <script>
                
                
                    

                    function culqi() {
                        
                      if (Culqi.token) { // ¡Objeto Token creado exitosamente!
                      
                          var token = Culqi.token.id;
                          var total = $(".valorTotalCompra").attr("valor");
                          var ciudad = $(".seleccioneDepartamento option:selected").text();
                          var telefono = $("#telefono").val();
                          var direccion = $("#direccion").val();
                          var cuotas = $('input[name="custom-cuotas"]').val();
                          console.log(cuotas);
        

                            $.ajax({
                                url:rutaOculta+"ajax/servidorpago.ajax.php",
			                	method:"POST",
				                data: {
				                    
                                token: token,
                                monto: total,
                                descripcion: 'Compras en Aquaria Depot',
                                email: '<?php echo $_SESSION["email"]; ?>',
                                direccion: direccion,
                                ciudad: ciudad,
                                pais: 'PE',
                                nombre: '<?php echo $_SESSION["nombre"]; ?>',
                                apellido: '<?php echo $_SESSION["nombre"]; ?>',
                                telefono: telefono,
                                installments : Culqi.token.metadata.installments

                            
                                },
                				dataType: "json",
                				
                				 beforeSend: function() {
                                        // setting a timeout
                                    $(".loading").css("display","block");
                                                                   },
                				
                                success:function(data){
                                    
                              

                                if(data.capture==true){
                                    
                               
                                    var venta = data.outcome.user_message;
                                    
                                    grabarCompra();
                                    

                                		swal({
                                		  title: venta,
                                		  text: "Nos Comunicaremos con Ud. para coordinar el Envio de su Compra.",
                                		  type: "success",
                                		  confirmButtonColor: "#ff9900",
                                		  confirmButtonText: "Salir",
                                		  closeOnConfirm: false
                                		},
                                		
                                		function(isConfirm){
                                				 if (isConfirm) {	 
                                				    $(".loading").css("display","none");
                                				    window.location = rutaOculta+"perfil";
                                				  } 
                                		});
                                		
                                		
                                				/*=============================================
                                        		SI YA NO QUEDAN PRODUCTOS HAY QUE REMOVER TODO
                                        		=============================================*/	
                                        
                                        		localStorage.removeItem("listaProductos");
                                        
                                        		localStorage.setItem("cantidadCesta","0");
                                        		
                                        		localStorage.setItem("sumaCesta","0");
                                        
                                        		$(".cantidadCesta").html("0");
                                        		$(".sumaCesta").html("0");
                                        
                                        		$(".cuerpoCarrito").html('<div class="well">Aún no hay productos en el carrito de compras.</div>');
                                        		$(".sumaCarrito").hide();
                                        		$(".cabeceraCheckout").hide();
                                		
                                    } else {
                                    
                                    $(".loading").css("display","none");   
                                    var datos = JSON.parse(data);
                                    var valor = datos.merchant_message;
                                    

                                         swal({
                        				  title: "¡Su pago no se pudo Realizar!",
                        				  text: valor,
                        				  type: "warning",
                        				  showCancelButton: false,
                        				  confirmButtonColor: "#DD6B55",
                        				  confirmButtonText: "Regresar",
                        				  closeOnConfirm: false
                        				  
                        				  
                        				})
                                    }
                                },

                                error: function(error_data){
                                    console.log(error_data);
                                    console.log("arroja error")
                                }
                               
                            });
                          //En esta linea de codigo debemos enviar el "Culqi.token.id"
                          //hacia tu servidor con Ajax
                      } else { // ¡Hubo algún problema!
                          // Mostramos JSON de objeto error en consola
                          
                          $(".loading").css("display","none");
                   
                                        swal({
                        				  title: "¡Su pago no se pudo Realizar!",
                        				  text: "Revise que los datos de su Tarjeta sean los Correctos",
                        				  type: "error",
                        				  showCancelButton: false,
                        				  confirmButtonColor: "#DD6B55",
                        				  confirmButtonText: "Regresar",
                        				  closeOnConfirm: false
                        				})
                      }
                    };
                    
                    Culqi.options({
                        lang: 'auto',
                        modal: true,
                        installments: true,

                        style: {
                          logo: 'https://aquariadepot.com/vistas/img/cabeceras/logo.jpg',
                          maincolor: '#ff9900',
                          buttontext: '#ffffff',
                          maintext: '#4A4A4A',
                          desctext: '#4A4A4A'
                        }
                    });
                    
                   
                </script>

                    <!--=====================================
                    BOTON PAGAR CULQI
                    ======================================-->




	    	   

                    
                  
				</div>

			</div>

		</div>

		<div class="modal-footer">
      	
      	</div>

	</div>

</div>




