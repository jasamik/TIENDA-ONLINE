<?php

$comercio = ControladorComercio::ctrSeleccionarComercio();

?>

<div class="box box-info">
	
	<div class="box-header with-border">
		
		 <h3 class="box-title">INFORMACIÓN DEL COMERCIO</h3>

		 <div class="box-tools pull-right">

      		<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">

        		<i class="fa fa-minus"></i>

        	</button>

        </div>

	</div>

	<div class="box-body formularioInformacion">

		<!-- IMPUESTO -->

		<div class="form-group">
	      
	      <label for="usr">Impuesto:</label>
	      
	      <div class="input-group">
	        
	        <span class="input-group-addon"><i class="fa fa-percent"></i></span>
	        <input type="number" min="1" class="form-control cambioInformacion" id="impuesto" value="<?php echo $comercio["impuesto"]; ?>">

	      </div>
	    
	    </div>

	    <!-- ENVÍO NACIONAL -->

	    <div class="form-group">
      
	      <label for="usr">Envío Nacional:</label>
	      
	      <div class="input-group">
	        
	        <span class="input-group-addon"><i class="ion ion-social-usd"></i></span>
	        <input type="number" min="1" class="form-control cambioInformacion" id="envioNacional" value="<?php echo $comercio["envioNacional"]; ?>">

	      </div>
	    
	    </div>

	    <!-- ENVÍO INTERNACIONAL -->

     	<div class="form-group">
      
	      <label for="usr">Envío Internacional:</label>
	      
	      <div class="input-group">
	        
	        <span class="input-group-addon"><i class="ion ion-social-usd"></i></span>
	        <input type="number" min="1" class="form-control cambioInformacion" id="envioInternacional" value="<?php echo $comercio["envioInternacional"]; ?>">

	      </div>
	    
	    </div>

	    <!-- TASA MÍNIMA NACIONAL -->

	    <div class="form-group">
      
	      <label for="usr">Tasa Mínima Nacional:</label>
	      
	      <div class="input-group">
	        
	        <span class="input-group-addon"><i class="ion ion-social-usd"></i></span>
	        <input type="number" min="1" class="form-control cambioInformacion" id="tasaMinimaNal" value="<?php echo $comercio["tasaMinimaNal"]; ?>">

	      </div>
	    
	    </div>

		<!-- TASA MÍNIMA INTERNACIONAL -->

	 	<div class="form-group">
      
	      <label for="usr">Tasa Mínima Internacional:</label>
	      
	      <div class="input-group">
	        
	        <span class="input-group-addon"><i class="ion ion-social-usd"></i></span>
	        <input type="number" min="1" class="form-control cambioInformacion" id="tasaMinimaInt" value="<?php echo $comercio["tasaMinimaInt"]; ?>">

	      </div>
	    
	    </div>

	    <!-- SELECCIONAR PAÍS -->

	    <div class="form-group">
      
	      <label for="sel1">Seleccione País:</label>

	      <input type="hidden" id="codigoPais" value="<?php echo $comercio["pais"]; ?>">
	      
	      <select class="form-control cambioInformacion" id="seleccionarPais">

	      	<option id="paisSeleccionado"></option>
	       
	      </select>

	    </div>

	    <!-- PASARELA DE PAGO CULQI -->

	    <div class="panel panel-default">
	    	
			<div class="panel-heading">

      			<h4 class="text-uppercase">Configuración Culqi</h4>

      		</div>
			
			<div class="panel-body">
				
				<div class="form-group row">
					
					 <div class="col-xs-6">
            
            			<label for="comment">Llave Pública:</label>
      
            			<input type="text" class="form-control cambioInformacion" id="llavePublicaCulqi" value="<?php echo $comercio["llavePublicaCulqi"]; ?>">

          			</div>

      			 	<div class="col-xs-6">

		            	<label for="comment">Llave Secreta:</label>
		      
		            	<input type="text" class="form-control cambioInformacion" id="llaveSecretaCulqi" value="<?php echo $comercio["llaveSecretaCulqi"]; ?>">

		          </div>

				</div>

			</div>

	    </div>

	   </div>

  	<div class="box-footer">
      
    	<button type="button" id="guardarInformacion" class="btn btn-primary pull-right">Guardar</button>
    
 	</div>

</div>