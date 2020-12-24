$(document).ready(function() {
    
$("#btnGuardarBitacora").click(function(){
    
    if($("#fecha").val() == ""){
        $("#fecha").focus();
                                         swal({
                        				  title: "¡Datos Ingresados Invalidos!",
                        				  text: "Debe Ingresar Fecha",
                        				  type: "warning",
                        				  showCancelButton: false,
                        				  confirmButtonColor: "#DD6B55",
                        				  confirmButtonText: "Regresar",
                        				  closeOnConfirm: false
                        				})
                        				
    }else if ($("#temperatura"). val() == ""){
        $("#temperatura").focus();
                                          swal({
                        				  title: "¡Datos Ingresados Invalidos!",
                        				  text: "Debe Ingresar Temperatura",
                        				  type: "warning",
                        				  showCancelButton: false,
                        				  confirmButtonColor: "#DD6B55",
                        				  confirmButtonText: "Regresar",
                        				  closeOnConfirm: false
                        				})
                        				

    }else {
   grabarBitacora(); 
    }
    
});


function grabarBitacora(){

   var datos = $("#frmBitacoraAgregar").serialize();
   var datos2 = $("#usuarioID").val();
   datos = datos +"&idusuario="+ datos2;
  
$.ajax({
        type:   "POST",
        url:    "../ajax/bitacora.ajax.php",
        data:   datos,
        success:function(respuesta){
            
                                          swal({
                                		  title: "Valores en Bitacora",
                                		  text: "se Insertaron Valores en Bitacora.",
                                		  type: "success",
                                		  confirmButtonColor: "#ff9900",
                                		  confirmButtonText: "Salir",
                                		  closeOnConfirm: false
                                		},
                                		
                                		function(isConfirm){
                                				 if (isConfirm) {	   
                                				    window.location = rutaOculta+"perfil";
                                				  } 
                                		});
   
            },
                error: function (req, textStatus, errorThrown) {
                    alert('Ooops, something happened: ' + textStatus + ' ' + errorThrown);
                }

});
}

/* Editar Bitacora */

$("#btnEditarBitacora").click(function(){
    
        if($("#fecha2").val() == ""){
        $("#fecha2").focus();
                                         swal({
                        				  title: "¡Datos Ingresados Invalidos!",
                        				  text: "Debe Ingresar Fecha",
                        				  type: "warning",
                        				  showCancelButton: false,
                        				  confirmButtonColor: "#DD6B55",
                        				  confirmButtonText: "Regresar",
                        				  closeOnConfirm: false
                        				})
                        				
    }else if ($("#temperatura2").val() == ""){
        $("#temperatura2").focus();
                                          swal({
                        				  title: "¡Datos Ingresados Invalidos!",
                        				  text: "Debe Ingresar Temperatura",
                        				  type: "warning",
                        				  showCancelButton: false,
                        				  confirmButtonColor: "#DD6B55",
                        				  confirmButtonText: "Regresar",
                        				  closeOnConfirm: false
                        				})
                        				

    }else {
 EditarBitacora();   
    }
    

});



function EditarBitacora(){
    var datos = $("#frmBitacoraEditar").serialize();
    console.log(datos);
$.ajax({
    url: "../ajax/bitacora.ajax.php",
    method: "POST",
    data: datos,
    
    success:function(respuesta){
                                        swal({
                                		  title: "Valores en Bitacora",
                                		  text: "Se editaron los Valores.",
                                		  type: "success",
                                		  confirmButtonColor: "#ff9900",
                                		  confirmButtonText: "Salir",
                                		  closeOnConfirm: false
                                		},
                                		
                                		function(isConfirm){
                                				 if (isConfirm) {	   
                                				    window.location = rutaOculta+"perfil";
                                				  } 
                                		});
    }, error: function () {
                    alert('No se Pudo Modificar');
                }
});
}

/* FIN DE EDITAR */



$(".datepicker").datepicker({
    format: 'yyyy-mm-dd',
    language: 'es',
    startDate: '-3d'
 
});

function enviarSession(){
    
       var usuarioID = $("#usuarioID").val(); 
       console.log("usuarioID",usuarioID);
       
       $.ajax({
           
           url: "../ajax/perfil.ajax.php",
           type: "POST",
           data: usuarioID,
           success: function(){
               
         
           }
           
       });
    
}

window.onload = enviarSession();

$(".tbl_herramientas").DataTable({
    

  
     "ajax": "ajax/perfil.ajax.php",
     "deferRender": true,
     "retrieve": true,
     "processing": true,
    
	 "language": {

	 	"sProcessing":     "Procesando...",
		"sLengthMenu":     "Mostrar _MENU_ registros",
		"sZeroRecords":    "No se encontraron resultados",
		"sEmptyTable":     "Ningún dato disponible en esta tabla",
		"sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
		"sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0",
		"sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
		"sInfoPostFix":    "",
		"sSearch":         "Buscar:",
		"sUrl":            "",
		"sInfoThousands":  ",",
		"sLoadingRecords": "Cargando...",
		"oPaginate": {
			"sFirst":    "Primero",
			"sLast":     "Último",
			"sNext":     "Siguiente",
			"sPrevious": "Anterior"
		},
		"oAria": {
				"sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
				"sSortDescending": ": Activar para ordenar la columna de manera descendente"
		}

	 }
});   

$(".tbl_herramientas tbody").on("click", ".btnEditarPerfil", function(){ 
    
    var idBitacora = $(this).attr("idperfil");
    
    var datos = new FormData();
    datos.append("idBitacora", idBitacora);
    
    $.ajax({
        
        url: "../ajax/bitacora.ajax.php",
   		method: "POST",
	  	data: datos,
	  	dataType: 'json',
		cache: false,
		contentType: false,
		processData: false,
		beforeSend: function(){

        },
        success:function(respuesta){
            
        $("#editarBitacora .editarIdBitacora").val(respuesta["id"]);
        
        $("#editarBitacora .fecha2").val(respuesta["fecha"]);
		$("#editarBitacora .temperatura2").val(respuesta["temperatura"]);
		$("#editarBitacora .salinidad").val(respuesta["salinidad"]);
		$("#editarBitacora .ph").val(respuesta["ph"]);
		$("#editarBitacora .nitritos").val(respuesta["no2"]);
		$("#editarBitacora .amoniaco").val(respuesta["nh3"]);
		$("#editarBitacora .nitratos").val(respuesta["no3"]);
		$("#editarBitacora .fosfatos").val(respuesta["po4"]);
		$("#editarBitacora .calcio").val(respuesta["ca"]);
		$("#editarBitacora .magnesio").val(respuesta["mg"]);
		$("#editarBitacora .alcalinidad").val(respuesta["kh"]);

        }
    });
});


/* INICIO DE BORRAR */
$(".tbl_herramientas tbody").on("click", ".btnEliminarPerfil", function(){
    
            var idBitacora2 = $(this).attr("idPerfilEliminar");

        var datos = new FormData();
        datos.append("idEliminar", idBitacora2);

                                        swal({
                                    title: "¿Estas seguro que deseas eliminar este registro?",
                                    text: "Si eliminas este registro, no podras recuperarlo",
                                    type: "warning",
                                    showCancelButton: true,
                                    confirmButtonColor: '#DD6B55',
                                    confirmButtonText: '¡Si, estoy seguro!',
                                    cancelButtonText: "Cancelar",
                                    closeOnConfirm: false,
                                    closeOnCancel: true
                                    },
                                    
                                    function(isConfirm) {
                                    if (isConfirm) {
    
                $.ajax({
                    
                url: "../ajax/bitacora.ajax.php",
                method: "POST",
                data: datos,
             	cache: false,
        		contentType: false,
        		processData: false,
                success: function (respuesta) {
                  
                                          swal({
                                		  title: "Valores en Bitacora",
                                		  text: "El registro fue eliminado de la Bitacora.",
                                		  type: "success",
                                		  confirmButtonColor: "#ff9900",
                                		  confirmButtonText: "Salir",
                                		  closeOnConfirm: false
                                		  },
                                		
                                		  function(isConfirm){
                                		  if (isConfirm) {	   
                                		  window.location = rutaOculta+"perfil";
                                		  } 
                                		  
                                		  });
 
                    },	error: function () {
                    alert('Error al Eliminar el registro');
                }
            });
            
                                    }
                                });

 });
    


/* FIN DE BORRAR */


/*=== INICIO BOTON CALCULAR ===*/

$("#btncalcular").click(function(e){
 
 e.preventDefault();
    
    if ($("#largo").val() == ""){
        $("#largo").focus();
        
                                       swal({
                        				  title: "¡Datos Ingresados Invalidos!",
                        				  text: "Debe Ingresar el Largo en cm",
                        				  type: "warning",
                        				  showCancelButton: false,
                        				  confirmButtonColor: "#DD6B55",
                        				  confirmButtonText: "Regresar",
                        				  closeOnConfirm: false
                        				});
     
        
    }else if($("#ancho").val() === ""){
          $("#ancho").focus();
        
                                        swal({
                        				  title: "¡Datos Ingresados Invalidos!",
                        				  text: "Debe Ingresar el Ancho en cm",
                        				  type: "warning",
                        				  showCancelButton: false,
                        				  confirmButtonColor: "#DD6B55",
                        				  confirmButtonText: "Regresar",
                        				  closeOnConfirm: false
                        				});
        
    }else if ($("#alto").val() == ""){
        $("#alto").focus();
        
                                       swal({
                        				  title: "¡Datos Ingresados Invalidos!",
                        				  text: "Debe Ingresar el Alto en cm",
                        				  type: "warning",
                        				  showCancelButton: false,
                        				  confirmButtonColor: "#DD6B55",
                        				  confirmButtonText: "Regresar",
                        				  closeOnConfirm: false
                        				});
        
    }else if ($("#grosor").val() == ""){
        $("#grosor").focus();
        
                                       swal({
                        				  title: "¡Datos Ingresados Invalidos!",
                        				  text: "Debe Ingresar el Grosor del Vidrio a usar en cm",
                        				  type: "warning",
                        				  showCancelButton: false,
                        				  confirmButtonColor: "#DD6B55",
                        				  confirmButtonText: "Regresar",
                        				  closeOnConfirm: false
                        				});
        
    }else{
    
        var Ancho = parseFloat($("#ancho").val()).toFixed(2);
        var Largo = parseFloat($("#largo").val()).toFixed(2);
        var Alto =  parseFloat($("#alto").val()).toFixed(2);
        var Volumen;
        var grosor = parseFloat($("#grosor").val()).toFixed(1);
        
        var Volumne = parseFloat(((Ancho * Largo * Alto)/1000)).toFixed(2);
        
        if (grosor > 2){
        
                                       swal({
                        				  title: "¡Datos Ingresados Invalidos!",
                        				  text: "Debe Ingresar Valores menores a 2cm, usar como referencia la leyenda de Grosor de Vidrio",
                        				  type: "warning",
                        				  showCancelButton: false,
                        				  confirmButtonColor: "#DD6B55",
                        				  confirmButtonText: "Regresar",
                        				  closeOnConfirm: false
                        				});
        } else {
    
        $(".resultadoVolumen").css("display", "block");
        $(".resultado").html("<strong>"+ Volumne +" LITROS. </strong>")

        $('.filafondo > td:eq(1)').html(Largo +" x "+ Ancho);
        $('.filafondo > td:eq(3)').html(grosor +" cm ");      
        
        $('.filafondo1 > td:eq(1)').html(Largo +" x "+ Alto);
        $('.filafondo1 > td:eq(3)').html(grosor +" cm ");  
        
        Ancho = parseFloat(Ancho - (2 * grosor)).toFixed(2);
        
        $('.filafondo2 > td:eq(1)').html(Alto +" x "+ Ancho);
        $('.filafondo2 > td:eq(3)').html(grosor +" cm ");
        
        $('.filafondo3 > td:eq(1)').html(Largo +" x 7 cm");
        $('.filafondo3 > td:eq(3)').html(grosor +" cm ");
        
        }
        
    }
});

$("#ancho").change(function(){
    $(".resultadoVolumen").css("display", "none");
});

$("#largo").change(function(){
    $(".resultadoVolumen").css("display", "none");
});

$("#alto").change(function(){
    $(".resultadoVolumen").css("display", "none");
});

$("#grosor").change(function(){
    $(".resultadoVolumen").css("display", "none");
});
/*=== FIN BOTON CALCULAR ===*/


});