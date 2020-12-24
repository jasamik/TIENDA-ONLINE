/*=============================================
/*=============================================
/*=============================================
/*=============================================
/*=============================================
VISUALIZAR LA CESTA DEL CARRITO DE COMPRAS
=============================================*/

if(localStorage.getItem("cantidadCesta") != null){

	$(".cantidadCesta").html(localStorage.getItem("cantidadCesta"));
	$(".sumaCesta").html(localStorage.getItem("sumaCesta"));

}else{

	$(".cantidadCesta").html("0");
	$(".sumaCesta").html("0");


}

/*=============================================
/*=============================================
/*=============================================
/*=============================================
/*=============================================
VISUALIZAR LOS PRODUCTOS EN LA PÁGINA CARRITO DE COMPRAS
https://www.udemy.com/crea-sistemas-ecommerce-con-php-y-con-pagos-de-paypal-y-payulatam/learn/v4/questions/5863480
=============================================*/

if(localStorage.getItem("listaProductos") != null){

	var listaCarrito = JSON.parse(localStorage.getItem("listaProductos"));

}else{

	$(".cuerpoCarrito").html('<div class="well">Aún no hay productos en el carrito de compras.</div>');
	$(".sumaCarrito").hide();
	$(".cabeceraCheckout").hide();
}

for(var i = 0; i < indice.length; i++){
    
    if(indice[i] == "carrito-de-compras"){

		listaCarrito.forEach(funcionForEach);

		function funcionForEach(item, index){

			var datosProducto = new FormData();
			var precio = 0;

			datosProducto.append("id", item.idProducto);

			$.ajax({

				url:rutaOculta+"ajax/producto.ajax.php",
				method:"POST",
				data: datosProducto,
				cache: false,
				contentType: false,
				processData:false,
				dataType: "json",
				success: function(respuesta){
		
					if(respuesta["precioOferta"] == 0){

						precio = respuesta["precio"];

					}else{

						precio = respuesta["precioOferta"];
						
					}

					$(".cuerpoCarrito").append(

						'<div clas="row itemCarrito">'+
							
							'<div class="col-sm-1 col-xs-12">'+
								
								'<br>'+

								'<center>'+
									
									'<button class="btn btn-default backColor quitarItemCarrito" idProducto="'+item.idProducto+'" peso="'+item.peso+'">'+
										
										'<i class="fa fa-times"></i>'+

									'</button>'+

								'</center>'+	

							'</div>'+
							'<div class="col-sm-1 col-xs-12">'+
								
								'<figure>'+
									
									'<img src="'+item.imagen+'" class="img-thumbnail">'+

								'</figure>'+

							'</div>'+

							'<div class="col-sm-4 col-xs-12">'+

								'<br>'+

								'<p class="tituloCarritoCompra text-left">'+item.titulo+'</p>'+

							'</div>'+

							'<div class="col-md-2 col-sm-1 col-xs-12">'+

								'<br>'+

								'<p class="precioCarritoCompra text-center">PEN S/. <span>'+precio+'</span></p>'+

							'</div>'+

							'<div class="col-md-2 col-sm-3 col-xs-8">'+

								'<br>'+	

								'<div class="col-xs-8">'+

									'<center>'+
									
										'<input type="number" class="form-control cantidadItem" min="1" value="'+item.cantidad+'" tipo="'+item.tipo+'" precio="'+precio+'" idProducto="'+item.idProducto+'" item="'+index+'">'+	

									'</center>'+

								'</div>'+

							'</div>'+

							'<div class="col-md-2 col-sm-1 col-xs-4 text-center">'+
								
								'<br>'+

								'<p class="subTotal'+index+' subtotales">'+
									
									'<strong>PEN S/. <span>'+(Number(item.cantidad)*Number(precio))+'</span></strong>'+

								'</p>'+

							'</div>'+
							
						'</div>'+

						'<div class="clearfix"></div>'+

						'<hr>');

					/*=============================================
					EVITAR MANIPULAR LA CANTIDAD EN PRODUCTOS VIRTUALES
					=============================================*/

					$(".cantidadItem[tipo='virtual']").attr("readonly","true");

					// /*=============================================
					// /*=============================================
					// /*=============================================
					// /*=============================================
					// /*=============================================
					// ACTUALIZAR SUBTOTAL
					// =============================================*/
					var precioCarritoCompra = $(".cuerpoCarrito .precioCarritoCompra span");

					cestaCarrito(precioCarritoCompra.length);

					sumaSubtotales();		
				
				}

			})	

		}		

	
	}

}

/*=============================================
/*=============================================
/*=============================================
/*=============================================
/*=============================================
AGREGAR AL CARRITO
=============================================*/

$(".agregarCarrito").click(function(){

	var idProducto = $(this).attr("idProducto");
	var imagen = $(this).attr("imagen");
	var titulo = $(this).attr("titulo");
	var precio = $(this).attr("precio");
	var tipo = $(this).attr("tipo");
	var peso = $(this).attr("peso");

	var agregarAlCarrito = false;

	/*=============================================
	CAPTURAR DETALLES
	=============================================*/

	if(tipo == "virtual"){

		agregarAlCarrito = true;

	}else{

		var seleccionarDetalle = $(".seleccionarDetalle");
		
		for(var i = 0; i < seleccionarDetalle.length; i++){


			if($(seleccionarDetalle[i]).val() == ""){

				swal({
					  title: "Debe seleccionar Caracteristicas",
					  text: "",
					  type: "warning",
					  showCancelButton: false,
					  confirmButtonColor: "#DD6B55",
					  confirmButtonText: "¡Seleccionar!",
					  closeOnConfirm: false
					})

				return;

			}else{

				titulo = titulo + "-" + $(seleccionarDetalle[i]).val();

				agregarAlCarrito = true;

			}

		}		

	}

	/*=============================================
	ALMACENAR EN EL LOCALSTARGE LOS PRODUCTOS AGREGADOS AL CARRITO
	=============================================*/

	if(agregarAlCarrito){

		/*=============================================
		RECUPERAR ALMACENAMIENTO DEL LOCALSTORAGE
		=============================================*/

		if(localStorage.getItem("listaProductos") == null){

			listaCarrito = [];

		}else{

			var listaProductos = JSON.parse(localStorage.getItem("listaProductos"));

			for(var i = 0; i < listaProductos.length; i++){

				if(listaProductos[i]["idProducto"] == idProducto && listaProductos[i]["tipo"] == "virtual"){

					swal({
					  title: "El producto ya está agregado al carrito de compras",
					  text: "",
					  type: "warning",
					  showCancelButton: false,
					  confirmButtonColor: "#DD6B55",
					  confirmButtonText: "¡Volver!",
					  closeOnConfirm: false
					})

					return;

				}

			}
			
			

			listaCarrito.concat(localStorage.getItem("listaProductos"));

		}

		listaCarrito.push({"idProducto":idProducto,
						   "imagen":imagen,
						   "titulo":titulo,
						   "precio":precio,
					       "tipo":tipo,
				           "peso":peso,
				           "cantidad":"1"});

		localStorage.setItem("listaProductos", JSON.stringify(listaCarrito));

		/*=============================================
		ACTUALIZAR LA CESTA
		=============================================*/

		var cantidadCesta = Number($(".cantidadCesta").html()) + 1;
		var sumaCesta = Number($(".sumaCesta").html()) + Number(precio);

		$(".cantidadCesta").html(cantidadCesta);
		$(".sumaCesta").html(sumaCesta);

		localStorage.setItem("cantidadCesta", cantidadCesta);
		localStorage.setItem("sumaCesta", sumaCesta);
		
		/*=============================================
		MOSTRAR ALERTA DE QUE EL PRODUCTO YA FUE AGREGADO
		=============================================*/

		swal({
			  title: "",
			  text: "¡Se ha agregado un nuevo producto al carrito de compras!",
			  type: "success",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  cancelButtonText: "¡Continuar comprando!",
			  confirmButtonText: "¡Ir a mi carrito de compras!",
			  closeOnConfirm: false
			},
			function(isConfirm){
				if (isConfirm) {	   
					 window.location = rutaOculta+"carrito-de-compras";
				} 
		});

	}

})

/*=============================================
/*=============================================
/*=============================================
/*=============================================
/*=============================================
QUITAR PRODUCTOS DEL CARRITO
=============================================*/

$(document).on("click", ".quitarItemCarrito", function(){

	$(this).parent().parent().parent().remove();

	var idProducto = $(".cuerpoCarrito button");
	var imagen = $(".cuerpoCarrito img");
	var titulo = $(".cuerpoCarrito .tituloCarritoCompra");
	var precio = $(".cuerpoCarrito .precioCarritoCompra span");
	var cantidad = $(".cuerpoCarrito .cantidadItem");

	/*=============================================
	SI AÚN QUEDAN PRODUCTOS VOLVERLOS AGREGAR AL CARRITO (LOCALSTORAGE)
	=============================================*/

	listaCarrito = [];

	if(idProducto.length != 0){

		for(var i = 0; i < idProducto.length; i++){

			var idProductoArray = $(idProducto[i]).attr("idProducto");
			var imagenArray = $(imagen[i]).attr("src");
			var tituloArray = $(titulo[i]).html();
			var precioArray = $(precio[i]).html();
			var pesoArray = $(idProducto[i]).attr("peso");
			var tipoArray = $(cantidad[i]).attr("tipo");
			var cantidadArray = $(cantidad[i]).val();

			listaCarrito.push({"idProducto":idProductoArray,
						   "imagen":imagenArray,
						   "titulo":tituloArray,
						   "precio":precioArray,
					       "tipo":tipoArray,
				           "peso":pesoArray,
				           "cantidad":cantidadArray});

		}

		localStorage.setItem("listaProductos",JSON.stringify(listaCarrito));

		sumaSubtotales();
		cestaCarrito(listaCarrito.length);


	}else{

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

	}

})


/*=============================================
/*=============================================
/*=============================================
/*=============================================
/*=============================================
GENERAR SUBTOTAL DESPUES DE CAMBIAR CANTIDAD
=============================================*/
$(document).on("change", ".cantidadItem", function(){

	var cantidad = $(this).val();
	var precio = $(this).attr("precio");
	var idProducto = $(this).attr("idProducto");
	var item = $(this).attr("item");

	$(".subTotal"+item).html('<strong>PEN S/. <span>'+(cantidad*precio)+'</span></strong>');


	/*=============================================
	ACTUALIZAR LA CANTIDAD EN EL LOCALSTORAGE
	=============================================*/

	var idProducto = $(".cuerpoCarrito button");
	var imagen = $(".cuerpoCarrito img");
	var titulo = $(".cuerpoCarrito .tituloCarritoCompra");
	var precio = $(".cuerpoCarrito .precioCarritoCompra span");
	var cantidad = $(".cuerpoCarrito .cantidadItem");

	listaCarrito = [];

	for(var i = 0; i < idProducto.length; i++){

			var idProductoArray = $(idProducto[i]).attr("idProducto");
			var imagenArray = $(imagen[i]).attr("src");
			var tituloArray = $(titulo[i]).html();
			var precioArray = $(precio[i]).html();
			var pesoArray = $(idProducto[i]).attr("peso");
			var tipoArray = $(cantidad[i]).attr("tipo");
			var cantidadArray = $(cantidad[i]).val();

			listaCarrito.push({"idProducto":idProductoArray,
						   "imagen":imagenArray,
						   "titulo":tituloArray,
						   "precio":precioArray,
					       "tipo":tipoArray,
				           "peso":pesoArray,
				           "cantidad":cantidadArray});

		}

		localStorage.setItem("listaProductos",JSON.stringify(listaCarrito));

		sumaSubtotales();
		cestaCarrito(listaCarrito.length);
})

/*=============================================
/*=============================================
/*=============================================
/*=============================================
/*=============================================
SUMA DE TODOS LOS SUBTOTALES
=============================================*/
function sumaSubtotales(){

	var subtotales = $(".subtotales span");
	var arraySumaSubtotales = [];
	
	for(var i = 0; i < subtotales.length; i++){

		var subtotalesArray = $(subtotales[i]).html();
		arraySumaSubtotales.push(Number(subtotalesArray));
		
	}

	
	function sumaArraySubtotales(total, numero){

		return total + numero;

	}

	var sumaTotal = arraySumaSubtotales.reduce(sumaArraySubtotales);
	
	$(".sumaSubTotal").html('<strong>PEN S/. <span>'+(sumaTotal).toFixed(2)+'</span></strong>');

	$(".sumaCesta").html((sumaTotal).toFixed(2));

	localStorage.setItem("sumaCesta", (sumaTotal).toFixed(2));


}

/*=============================================
/*=============================================
/*=============================================
/*=============================================
/*=============================================
ACTUALIZAR CESTA AL CAMBIAR CANTIDAD
=============================================*/
function cestaCarrito(cantidadProductos){

	/*=============================================
	SI HAY PRODUCTOS EN EL CARRITO
	=============================================*/

	if(cantidadProductos != 0){
		
		var cantidadItem = $(".cuerpoCarrito .cantidadItem");

		var arraySumaCantidades = [];
	
		for(var i = 0; i < cantidadItem .length; i++){

			var cantidadItemArray = $(cantidadItem[i]).val();
			arraySumaCantidades.push(Number(cantidadItemArray));
			
		}
	
		function sumaArrayCantidades(total, numero){

			return total + numero;

		}

		var sumaTotalCantidades = arraySumaCantidades.reduce(sumaArrayCantidades);
		
		$(".cantidadCesta").html(sumaTotalCantidades );
		localStorage.setItem("cantidadCesta", sumaTotalCantidades);

	}

}

/*=============================================
/*=============================================
/*=============================================
/*=============================================
/*=============================================
CHECKOUT
=============================================*/

$("#btnCheckout").click(function(){

	$(".listaProductos table.tablaProductos tbody").html("");

	$("#checkPaypal").prop("checked",true);
	$("#checkPayu").prop("checked", false);

	var idUsuario = $(this).attr("idUsuario");
	var peso = $(".cuerpoCarrito button, .comprarAhora button");
	var titulo = $(".cuerpoCarrito .tituloCarritoCompra, .comprarAhora .tituloCarritoCompra");
	var cantidad = $(".cuerpoCarrito .cantidadItem, .comprarAhora .cantidadItem");
	var subtotal = $(".cuerpoCarrito .subtotales span, .comprarAhora .subtotales span");
	var tipoArray =[];
	var cantidadPeso = [];

	/*=============================================
	SUMA SUBTOTAL
	=============================================*/

	var sumaSubTotal = $(".sumaSubTotal span")
	
	$(".valorSubtotal").html($(sumaSubTotal).html());
	$(".valorSubtotal").attr("valor",$(sumaSubTotal).html());

	/*=============================================
	TASAS DE IMPUESTO
	=============================================*/

	var impuestoTotal = ($(".valorSubtotal").html() * $("#tasaImpuesto").val()) /100;
	
	$(".valorTotalImpuesto").html((impuestoTotal).toFixed(2));
	$(".valorTotalImpuesto").attr("valor",(impuestoTotal).toFixed(2));

	sumaTotalCompra()

	/*=============================================
	VARIABLES ARRAY 
	=============================================*/

	for(var i = 0; i < titulo.length; i++){

		var pesoArray = $(peso[i]).attr("peso");
		var tituloArray = $(titulo[i]).html();
		var cantidadArray = $(cantidad[i]).val();		
		var subtotalArray = $(subtotal[i]).html();

		/*=============================================
		EVALUAR EL PESO DE ACUERDO A LA CANTIDAD DE PRODUCTOS
		=============================================*/

		cantidadPeso[i] = pesoArray * cantidadArray;

		function sumaArrayPeso(total, numero){

			return total + numero;

		}

		var sumaTotalPeso = cantidadPeso.reduce(sumaArrayPeso);
		
		/*=============================================
		MOSTRAR PRODUCTOS DEFINITIVOS A COMPRAR
		=============================================*/

		$(".listaProductos table.tablaProductos tbody").append('<tr>'+
															   '<td class="valorTitulo">'+tituloArray+'</td>'+
															   '<td class="valorCantidad">'+cantidadArray+'</td>'+
															   '<td>S/. <span class="valorItem" valor="'+subtotalArray+'">'+subtotalArray+'</span></td>'+
															   '<tr>');

		/*=============================================
		SELECCIONAR PAÍS DE ENVÍO SI HAY PRODUCTOS FÍSICOS
		=============================================*/
	
		tipoArray.push($(cantidad[i]).attr("tipo"));
		
		function checkTipo(tipo){

			return tipo == "fisico";
		
		}

	}

	/*=============================================
	EXISTEN PRODUCTOS FÍSICOS
	=============================================*/
	
	
	if(tipoArray.find(checkTipo) == "fisico"){

		$(".seleccionePais").html('<select class="form-control" id="seleccionarPais" required>'+
						
					              '</select>');
	   
	   	$(".seleccioneDepartamento").html('<select class="form-control" id="seleccionarDepartamento" required>'+
						
						          '<option value="">Seleccione Departamento</option>'+

					              '</select>');
					              
		$(".seleccioneProvincia").html('<select class="form-control" id="seleccionarProvincia" required>'+
						
						          '<option value="">Seleccione Provincia</option>'+

					              '</select>');
					              
		$(".seleccioneDistrito").html('<select class="form-control" id="seleccionarDistrito" required>'+
						
						          '<option value="">Seleccione Distrito</option>'+

					              '</select>');

		$(".formEnvio").show();

		$(".btnPagar").attr("tipo","fisico");

		$.ajax({
			url:rutaOculta+"vistas/js/plugins/paises.json",
			type: "GET",
			cache: false,
			contentType: false,
			processData:false,
			dataType:"json",
			success: function(respuesta){

				respuesta.forEach(seleccionarPais);
				function seleccionarPais(item, index){
					var pais = item.name;
					var codPais = item.code;
					$("#seleccionarPais").append('<option value="'+codPais+'">'+pais+'</option>');
				}

			}
		});
		
		$.ajax({
			url:rutaOculta+"vistas/js/plugins/departamentos.json",
			type: "GET",
			cache: false,
			contentType: false,
			processData:false,
			dataType:"json",
			success: function(respuesta){

				respuesta.forEach(seleccionarDepartamento);
				function seleccionarDepartamento(item, index){
					var Departamento = item.nombre_ubigeo;
					var codDepartamento = item.id_ubigeo;
					$("#seleccionarDepartamento").append('<option value="'+codDepartamento+'">'+Departamento+'</option>');
				}

			}
		});
		
		$.ajax({
			url:rutaOculta+"vistas/js/plugins/provincias.json",
			type: "GET",
			cache: false,
			contentType: false,
			processData:false,
			dataType:"json",
			success: function(respuesta){
			    
			var idDepartamento = ""; 
    		$("#seleccionarDepartamento").change(function(){
    		    
    		   $("#seleccionarProvincia").html('<option value="">Seleccione Provincia</option>');
    		   $("#seleccionarDistrito").html('<option value="">Seleccione Distrito</option>');		
    		   
    		   idDepartamento = $("#seleccionarDepartamento").val();
   
				respuesta[idDepartamento].forEach(seleccionarProvincia);
				function seleccionarProvincia(item, index){
					var Provincia = item.nombre_ubigeo;
					var codProvincia = item.id_ubigeo;
					$("#seleccionarProvincia").append('<option value="'+codProvincia+'">'+Provincia+'</option>');
				}
				
    		});

			}
		});
		
		$.ajax({
			url:rutaOculta+"vistas/js/plugins/distritos.json",
			type: "GET",
			cache: false,
			contentType: false,
			processData:false,
			dataType:"json",
			success: function(respuesta){
			    
			    var idProvincia = "";
			    $("#seleccionarProvincia").change(function(){
			        
    		   $("#seleccionarDistrito").html('<option value="">Seleccione Distrito</option>');			    
			        
			    idProvincia = $("#seleccionarProvincia").val();

			    respuesta[idProvincia].forEach(seleccionarDistrito);
				function seleccionarDistrito(item, index){
					var Distrito = item.nombre_ubigeo;
					var codDistrito = item.id_ubigeo;
					$("#seleccionarDistrito").append('<option value="'+codDistrito+'">'+Distrito+'</option>');
				}
				
		    });

			}
		});

		/*=============================================
		EVALUAR TASAS DE ENVÍO SI EL PRODUCTO ES FÍSICO
		=============================================*/

		$("#seleccionarDepartamento").change(function(){

			$(".alert").remove();

			var pais = $("#seleccionarPais").val();
			var tasaPais = $("#tasaPais").val();
			
					
			
			if(pais == tasaPais){
			    
                    var resultadoPeso1 = parseFloat($("#envioNacional").val());
                    var resultadoPeso = resultadoPeso1.toFixed(2);

					$(".valorTotalEnvio").html(resultadoPeso);
					$(".valorTotalEnvio").attr("valor",resultadoPeso);

			}
			sumaTotalCompra();

		})

	}else{

		$(".btnPagar").attr("tipo","virtual");
	}

})

/*=============================================
/*=============================================
/*=============================================
/*=============================================
/*=============================================
SUMA TOTAL DE LA COMPRA
=============================================*/
function sumaTotalCompra(){

	var sumaTotalTasas = Number($(".valorSubtotal").html())+ 
	                     Number($(".valorTotalEnvio").html())+ 
	                     Number($(".valorTotalImpuesto").html());


	$(".valorTotalCompra").html((sumaTotalTasas).toFixed(2));
	$(".valorTotalCompra").attr("valor",(sumaTotalTasas).toFixed(2));

	localStorage.setItem("total",hex_md5($(".valorTotalCompra").html()));
}


/*=============================================
/*=============================================
/*=============================================
/*=============================================
/*=============================================
BOTÓN PAGAR CULQI
=============================================*/

 function grabarCompra(){
                                            
                    	var datos = new FormData();
                    	var total = $(".valorTotalCompra").html();
                    	var totalEncriptado = localStorage.getItem("total");
                    	var impuesto = $(".valorTotalImpuesto").html();
                    	var envio = $(".valorTotalEnvio").html();
                    	var subtotal = $(".valorSubtotal").html();
                    	var titulo = $(".valorTitulo");
                    	var cantidad = $(".valorCantidad");
                    	var valorItem = $(".valorItem");
                    	var idProducto = $('.cuerpoCarrito button, .comprarAhora button');
                    	var pais  = $(".seleccionePais option:selected").text();
                    	var departamento  = $(".seleccioneDepartamento option:selected").text();
                    	var provincia  = $(".seleccioneProvincia option:selected").text();
                    	var distrito  = $(".seleccioneDistrito option:selected").text();
                    	var telefono  = $(".seleccionetelefono").val();
                    	var direccion  = $("#direccion").val();
                    	var idUsuario = $("#usuarioID").val();
                    	var usuarioNombre = $("#usuarioNombre").val();
                    	var usuarioEmail = $("#usuarioEmail").val();
                    	
                    	var tituloArray = [];
                    	var cantidadArray = [];
                    	var valorItemArray = [];
                    	var idProductoArray = [];
                    
                    	for(var i = 0; i < titulo.length; i++){
                    
                    		tituloArray[i] = $(titulo[i]).html();
                    		cantidadArray[i] = $(cantidad[i]).html();
                    		valorItemArray[i] = $(valorItem[i]).html();
                    		idProductoArray[i] = $(idProducto[i]).attr("idProducto");
                    
                    	}
                    
                    
                    
                    	datos.append("total",total);
                    	datos.append("totalEncriptado",totalEncriptado);
                    	datos.append("impuesto",impuesto);
                    	datos.append("envio",envio);
                    	datos.append("subtotal",subtotal);
                    	datos.append("tituloArray",tituloArray);
                    	datos.append("cantidadArray",cantidadArray);
                    	datos.append("valorItemArray",valorItemArray);
                    	datos.append("idProductoArray",idProductoArray);
                    	datos.append("pais",pais);
                    	datos.append("departamento",departamento);
                    	datos.append("provincia",provincia);
                    	datos.append("distrito",distrito);
                    	datos.append("telefono",telefono);
                    	datos.append("direccion",direccion);
                    	datos.append("idUsuario",idUsuario);
                    	datos.append("usuarioNombre",usuarioNombre);
                    	datos.append("usuarioEmail",usuarioEmail);
                    	console.log(datos);
                    
                    	$.ajax({
                    		 url:rutaOculta+"ajax/carrito.ajax.php",
                    		 method:"POST",
                    		 data: datos,
                    		 cache: false,
                             contentType: false,
                             processData: false,
                             success:function(respuesta){
                         
                             }
                    
                    	})
                    	
}

$(".btnPagar").click(function(){

	var tipo = $(this).attr("tipo");

	if(tipo == "fisico" && $("#seleccionarDepartamento").val() == "") {
	    
	                               $("#seleccionarDepartamento").focus();

                                         swal({
                        				  title: "¡Datos de envío Invalidos!",
                        				  text: "Debe seleccionar Departamento",
                        				  type: "warning",
                        				  showCancelButton: false,
                        				  confirmButtonColor: "#DD6B55",
                        				  confirmButtonText: "Regresar",
                        				  closeOnConfirm: false

                        	
                        				})
                        			

	} else if(tipo == "fisico" && $("#seleccionarProvincia").val() == "") {
	    
	                               $("#seleccionarProvincia").focus();
	    
	                                      swal({
                        				  title: "¡Datos de envío Invalidos!",
                        				  text: "Debe seleccionar Provincia",
                        				  type: "warning",
                        				  showCancelButton: false,
                        				  confirmButtonColor: "#DD6B55",
                        				  confirmButtonText: "Regresar",
                        				  closeOnConfirm: false
                        				})
                        		

	} else if(tipo == "fisico" && $("#seleccionarDistrito").val() == "") {
	    
	                               $("#seleccionarDistrito").focus();
	       
	    	                              swal({
                        				  title: "¡Datos de envío Invalidos!",
                        				  text: "Debe seleccionar Distrito",
                        				  type: "warning",
                        				  showCancelButton: false,
                        				  confirmButtonColor: "#DD6B55",
                        				  confirmButtonText: "Regresar",
                        				  closeOnConfirm: false
                        				})
                        			

	} else if(tipo == "fisico" && $("#telefono").val() == "") {
	    
	                               $("#telefono").focus();
	  
	    	                              swal({
                        				  title: "¡Datos de envío Invalidos!",
                        				  text: "Debe ingresar un Teléfono",
                        				  type: "warning",
                        				  showCancelButton: false,
                        				  confirmButtonColor: "#DD6B55",
                        				  confirmButtonText: "Regresar",
                        				  closeOnConfirm: false
                        				})
                        				
   
	} else if(tipo == "fisico" && $("#direccion").val() == "") {
	    
	                               $("#direccion").focus();
	    
	    	    	                      swal({
                        				  title: "¡Datos de envío Invalidos!",
                        				  text: "Debe ingresar Dirección",
                        				  type: "warning",
                        				  showCancelButton: false,
                        				  confirmButtonColor: "#DD6B55",
                        				  confirmButtonText: "Regresar",
                        				  closeOnConfirm: false
                        				  
                        				})
                        		
	} else {
	    
	    var cantFono = $("#telefono").val();
	    
	    if (cantFono.length < 9){
	        
	    $("#telefono").focus();
	  
	    	                              swal({
                        				  title: "¡Datos de envío Invalidos!",
                        				  text: "Debe ingresar los 9 dígitos de su celular",
                        				  type: "warning",
                        				  showCancelButton: false,
                        				  confirmButtonColor: "#DD6B55",
                        				  confirmButtonText: "Regresar",
                        				  closeOnConfirm: false
                        				})

        } else {
	    
	                 var llavePublicaCulqi = $("#llavePublicaCulqi").val();
	                 Culqi.publicKey =llavePublicaCulqi;

                        var total = $(".valorTotalCompra").attr("valor")*100;
                        // Abre el formulario con la configuración en Culqi.settings
                        Culqi.settings({
                        title: 'Aquaria Depot',
                        currency: 'PEN',
                        description: 'Compras en Aquaria Depot',
                        amount: total
                         });
                        Culqi.open();
                  
                  
        }            

                 
	}
   
})



/*=============================================
/*=============================================
/*=============================================
/*=============================================
/*=============================================
AGREGAR PRODUCTOS GRATIS
=============================================*/
$(".agregarGratis").click(function(){

	var idProducto = $(this).attr("idProducto");
	var idUsuario = $(this).attr("idUsuario");
	var tipo = $(this).attr("tipo");
	var titulo = $(this).attr("titulo");
	var agregarGratis = false;

	/*=============================================
	VERIFICAR QUE NO TENGA EL PRODUCTO ADQUIRIDO
	=============================================*/

	var datos = new FormData();

	datos.append("idUsuario", idUsuario);
	datos.append("idProducto", idProducto);

	$.ajax({
		url:rutaOculta+"ajax/carrito.ajax.php",
		method:"POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	success:function(respuesta){
      	    
      	    if(respuesta != ""){

  	    		swal({
				  title: "¡Usted ya adquirió este producto!",
				  text: "",
				  type: "warning",
				  showCancelButton: false,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "Regresar",
				  closeOnConfirm: false
				})


      	    }else{

				if(tipo == "virtual"){

					agregarGratis = true;

				}else{

					var seleccionarDetalle = $(".seleccionarDetalle");

					for(var i = 0; i < seleccionarDetalle.length; i++){

						if($(seleccionarDetalle[i]).val() == ""){

								swal({
									  title: "Debe seleccionar Caracteristicas",
									  text: "",
									  type: "warning",
									  showCancelButton: false,
									  confirmButtonColor: "#DD6B55",
									  confirmButtonText: "¡Seleccionar!",
									  closeOnConfirm: false
									})

						}else{

							titulo = titulo + "-" + $(seleccionarDetalle[i]).val();

							agregarGratis = true;

						}

					}		

				}

				if(agregarGratis){

					window.location = rutaOculta+"index.php?ruta=finalizar-compra&gratis=true&producto="+idProducto+"&titulo="+titulo;

				}
    	    
      	    }

      	}

	})

	

})

