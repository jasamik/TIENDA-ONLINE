<?php

$servidor = Ruta::ctrRutaServidor();
$url = Ruta::ctrRuta();

/*=============================================
INICIO DE SESIÓN USUARIO
=============================================*/

if(isset($_SESSION["validarSesion"])){

	if($_SESSION["validarSesion"] == "ok"){

		echo '<script>
		
			localStorage.setItem("usuario","'.$_SESSION["id"].'");

		</script>';

	}

}

/*=============================================
API DE GOOGLE
=============================================*/

// https://console.developers.google.com/apis
// https://github.com/google/google-api-php-client

/*=============================================
CREAR EL OBJETO DE LA API GOOGLE
=============================================*/

$cliente = new Google_Client();
$cliente->setAuthConfig('modelos/client_secret.json');
$cliente->setAccessType("offline");
$cliente->setScopes(['profile','email']);

/*=============================================
RUTA PARA EL LOGIN DE GOOGLE
=============================================*/

$rutaGoogle = $cliente->createAuthUrl();

/*=============================================
RECIBIMOS LA VARIABLE GET DE GOOGLE LLAMADA CODE
=============================================*/

if(isset($_GET["code"])){

	$token = $cliente->authenticate($_GET["code"]);

	$_SESSION['id_token_google'] = $token;

	$cliente->setAccessToken($token);

}

/*=============================================
RECIBIMOS LOS DATOS CIFRADOS DE GOOGLE EN UN ARRAY
=============================================*/

if($cliente->getAccessToken()){

 	$item = $cliente->verifyIdToken();

 	$datos = array("nombre"=>$item["name"],
				   "email"=>$item["email"],
				   "foto"=>$item["picture"],
				   "password"=>"null",
				   "modo"=>"google",
				   "verificacion"=>0,
				   "emailEncriptado"=>"null");

 	$respuesta = ControladorUsuarios::ctrRegistroRedesSociales($datos);

 	echo '<script>
		
	setTimeout(function(){

		window.location = localStorage.getItem("rutaActual");

	},1000);

 	</script>';

}

?>

<!--=====================================
TOP
======================================-->

<div class="container-fluid barraSuperior" id="top">
	
	<div class="container">
		
		<div class="row">
	
			<!--=====================================
			SOCIAL
			======================================-->

			<div class="col-md-9 col-sm-8 col-xs-12 social">
				
				<ul>	

					<?php

					$social = ControladorPlantilla::ctrEstiloPlantilla();

					$jsonRedesSociales = json_decode($social["redesSociales"],true);		

					foreach ($jsonRedesSociales as $key => $value) {

						if($value["activo"] != 0){

							echo '<li>
									<a href="'.$value["url"].'" target="_blank">
										<i class="fa '.$value["red"].' '.$value["estilo"].' redSocial"></i>
									</a>
								</li>';

						}
					}

					?>
			
				</ul>

			</div>

			<!--=====================================
			REGISTRO
			======================================-->

			<div class="col-md-3 col-sm-4 col-xs-12 registro">
				
				<ul>

				<?php

				if(isset($_SESSION["validarSesion"])){

					if($_SESSION["validarSesion"] == "ok"){

						if($_SESSION["modo"] == "directo"){

							if($_SESSION["foto"] != ""){

								echo '<li>

										<img class="img-circle" src="'.$url.$_SESSION["foto"].'" width="10%">

									 </li>';

							}else{

								echo '<li>

									<img class="img-circle" src="'.$servidor.'vistas/img/usuarios/default/anonymous.png" width="10%">

								</li>';

							}

							echo '<li><a href="'.$url.'perfil">Ver Perfil</a></li>
							 <li>|</li>
							 <li><a href="'.$url.'salir"><i class="fa fa-sign-out" aria-hidden="true"></i> Salir</a></li>';


						}

						if($_SESSION["modo"] == "facebook"){

							echo '<li>

									<img class="img-circle" src="'.$_SESSION["foto"].'" width="10%">

								   </li>
								   <li><a href="'.$url.'perfil">Ver Perfil</a></li>
						 		   <li>|</li>
						 		   <li><a href="'.$url.'salir" class="salir"><i class="fa fa-sign-out" aria-hidden="true"></i> Salir</a></li>';

						}

						if($_SESSION["modo"] == "google"){

							echo '<li>

									<img class="img-circle" src="'.$_SESSION["foto"].'" width="10%">

								   </li>
						 		   <li><a href="'.$url.'perfil">Ver Perfil</a></li>
						 		   <li>|</li>
						 		   <li><a href="'.$url.'salir"><i class="fa fa-sign-out" aria-hidden="true"></i> Salir</a></li>';

						}

					}

				}else{

					echo '<li><a href="#modalIngreso" data-toggle="modal"><i class="fa fa-user" aria-hidden="true"></i>  Ingresar</a></li>
						  <li>|</li>
						  <li><a href="#modalRegistro" data-toggle="modal"><i class="fa fa-user-plus" aria-hidden="true"></i> Crear una cuenta</a></li>';

				}

				?>
	
				</ul>

			</div>	

		</div>	

	</div>

</div>

<!--=====================================
HEADER
======================================-->

<header class="container-fluid"><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	
	<div class="container">
		
		<div class="row" id="cabezote">

			<!--=====================================
			LOGOTIPO
			======================================-->
			
			<div class="col-md-3 col-sm-2 col-xs-12" id="logotipo">
				
				<a href="<?php echo $url; ?>">
						
					<img src="<?php echo $servidor.$social["logo"]; ?>" class="img-responsive">

				</a>
				
			</div>

			<!--=====================================
			BLOQUE CATEGORÍAS Y BUSCADOR
			======================================-->

			<div class="col-md-6 col-sm-8 col-xs-12">
					
				<!--=====================================
				BOTÓN CATEGORÍAS
				======================================-->

				<div class="col-md-4 col-sm-4 col-xs-12 backColor" id="btnCategorias">
					
					<p>CATEGORÍAS
					
						<span class="pull-right">
							<i class="fa fa-bars" aria-hidden="true"></i>
						</span>
					
					</p>

				</div>

				<!--=====================================
				BUSCADOR
				======================================-->
				
				<div class="input-group col-sm-8 col-xs-12" id="buscador">
					
					<input type="search" name="buscar" class="form-control input-lg" placeholder="Buscar...">	

					<span class="input-group-btn">
						
						<a href="<?php echo $url; ?>buscador/1/recientes">

							<button class="btn btn-default backColor" type="submit">
								<i class="fa fa-search"></i>
							</button>

						</a>

					</span>

				</div>
			
			</div>

			<!--=====================================
			CARRITO DE COMPRAS
			======================================-->

			<div class="col-md-3 col-sm-2 col-xs-12" id="carrito">
				
				<a href="<?php echo $url;?>carrito-de-compras">

					<button class="btn btn-default pull-left backColor"> 
						
						<i class="fa fa-shopping-cart" aria-hidden="true"></i>

					
					</button>
				
				</a>	

				<p>TU CESTA <span class="cantidadCesta"></span> <br> PEN S/. <span class="sumaCesta"></span></p>	

			</div>

		</div>

		<!--=====================================
		CATEGORÍAS
		======================================-->

		<div class="col-xs-12 backColor" id="categorias">

			<?php

				$item = null;
				$valor = null;

				$categorias = ControladorProductos::ctrMostrarCategorias($item, $valor);

				foreach ($categorias as $key => $value) {

					if($value["estado"] != 0){

						echo '<div class="col-lg-2 col-md-3 col-sm-4 col-xs-12">
								
								<h4>
									<a href="'.$url.$value["ruta"].'" class="pixelCategorias" titulo="'.$value["categoria"].'">'.$value["categoria"].'</a>
								</h4>
								
								<hr>

								<ul>';

								$item = "id_categoria";

								$valor = $value["id"];

								$subcategorias = ControladorProductos::ctrMostrarSubCategorias($item, $valor);
								
								foreach ($subcategorias as $key => $value) {

									if($value["estado"] != 0){
										
										echo '<li><a href="'.$url.$value["ruta"].'" class="pixelSubCategorias" titulo="'.$value["subcategoria"].'">'.$value["subcategoria"].'</a></li>';

									}
								}	
									
								echo '</ul>

							</div>';

					}
				}

			?>	

		</div>

	</div>

</header>

<!--=====================================
VENTANA MODAL PARA EL REGISTRO
======================================-->

<div class="modal fade modalFormulario" id="modalRegistro" role="dialog">

    <div class="modal-content modal-dialog">

        <div class="modal-body modalTitulo">

           <button type="button" class="close" data-dismiss="modal">&times;</button>
        	
			<!--=====================================
			REGISTRO FACEBOOK
			======================================-->

			<div class="col-sm-6 col-xs-12 facebook">
				
				<p>
				  <i class="fa fa-facebook"></i>
					Registro con Facebook
				</p>

			</div>

			<!--=====================================
			REGISTRO GOOGLE
			======================================-->
			<a href="<?php echo $rutaGoogle; ?>">

				<div class="col-sm-6 col-xs-12 google">
					
					<p>
					  <i class="fa fa-google"></i>
						Registro con Google
					</p>

				</div>
			</a>

			<!--=====================================
			REGISTRO DIRECTO
			======================================-->

			<form method="post" onsubmit="return registroUsuario()">
				
			<hr>

				<div class="form-group">
					
					<div class="input-group">
						
						<span class="input-group-addon">
							
							<i class="glyphicon glyphicon-user"></i>
						
						</span>

						<input type="text" class="form-control input-lg " id="regUsuario" name="regUsuario" placeholder="Nombre Completo" required>

					</div>

				</div>
				
				
				<div class="form-group">
					
					<div class="input-group">
						
						<span class="input-group-addon">
							
							<i class="glyphicon glyphicon-phone"></i>
						
						</span>

						<input type="numeric" class="form-control input-lg " id="regTelefono" name="regTelefono" placeholder="Teléfono" required>

					</div>

				</div>
				

				<div class="form-group">
					
					<div class="input-group">
						
						<span class="input-group-addon">
							
							<i class="glyphicon glyphicon-envelope"></i>
						
						</span>

						<input type="email" class="form-control input-lg" id="regEmail" name="regEmail" placeholder="Correo Electrónico" required>

					</div>

				</div>

				<div class="form-group">
					
					<div class="input-group">
						
						<span class="input-group-addon">
							
							<i class="glyphicon glyphicon-lock"></i>
						
						</span>
						
						<script>
                      function mostrarPassword(){
                            		var cambio = document.getElementById("regPassword");
                            		if(cambio.type == "password"){
                            			cambio.type = "text";
                            			$('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
                            		}else{
                            			cambio.type = "password";
                            			$('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
                            		}
                            	} 
						</script>

						<input type="password" class="form-control input-lg" id="regPassword" name="regPassword" placeholder="Contraseña" required>
														<span class="input-group-addon">
							
							<i class="fa fa-eye icon" id="icon" onclick="mostrarPassword();"></i>
						
						</span>

					</div>

				</div>

				<!--=====================================
				https://www.iubenda.com/ CONDICIONES DE USO Y POLÍTICAS DE PRIVACIDAD
				======================================-->

				<div class="checkBox">
					
					<label>
						
						<input id="regPoliticas" type="checkbox">
					
							<small>
								
								Al registrarse, usted acepta nuestras condiciones de uso y políticas de privacidad

								<br>
								
								<a href="https://www.iubenda.com/privacy-policy/98984858" class="iubenda-white iubenda-embed" title="Privacy Policy ">Privacy Policy</a><script type="text/javascript">(function (w,d) {var loader = function () {var s = d.createElement("script"), tag = d.getElementsByTagName("script")[0]; s.src="https://cdn.iubenda.com/iubenda.js"; tag.parentNode.insertBefore(s,tag);}; if(w.addEventListener){w.addEventListener("load", loader, false);}else if(w.attachEvent){w.attachEvent("onload", loader);}else{w.onload = loader;}})(window, document);</script>

							</small>

					</label>

				</div>

				<?php

					$registro = new ControladorUsuarios();
					$registro -> ctrRegistroUsuario();

				?>
				
				<input type="submit" class="btn btn-default backColor btn-block" value="ENVIAR">	

			</form>

        </div>

        <div class="modal-footer">
          
			¿Ya tienes una cuenta registrada? | <strong><a href="#modalIngreso" data-dismiss="modal" data-toggle="modal">Ingresar</a></strong>

        </div>
      
    </div>

</div>

<!--=====================================
VENTANA MODAL PARA EL INGRESO
======================================-->

<div class="modal fade modalFormulario" id="modalIngreso" role="dialog">

    <div class="modal-content modal-dialog">

        <div class="modal-body modalTitulo">

        

           <button type="button" class="close" data-dismiss="modal">&times;</button>
        	
			<!--=====================================
			INGRESO FACEBOOK
			======================================-->

			<div class="col-sm-6 col-xs-12 facebook">
				
				<p>
				  <i class="fa fa-facebook"></i>
					Ingreso con Facebook
				</p>

			</div>

			<!--=====================================
			INGRESO GOOGLE
			======================================-->
			<a href="<?php echo $rutaGoogle; ?>">
			
				<div class="col-sm-6 col-xs-12 google">
					
					<p>
					  <i class="fa fa-google"></i>
						Ingreso con Google
					</p>

				</div>

			</a>

			<!--=====================================
			INGRESO DIRECTO
			======================================-->

			<form method="post">
				
			<hr>

				<div class="form-group">
					
					<div class="input-group">
						
						<span class="input-group-addon">
							
							<i class="glyphicon glyphicon-envelope"></i>
						
						</span>

						<input type="email" class="form-control input-lg" id="ingEmail" name="ingEmail" placeholder="Correo Electrónico" required>

					</div>

				</div>

				<div class="form-group">
					
					<div class="input-group">
						
						<span class="input-group-addon">
							
							<i class="glyphicon glyphicon-lock"></i>
						
						</span>
						
					<script>
                      function mostrarPassword2(){
                            		var cambio = document.getElementById("ingPassword");
                            		if(cambio.type == "password"){
                            			cambio.type = "text";
                            			$('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
                            		}else{
                            			cambio.type = "password";
                            			$('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
                            		}
                            	} 
						</script>

						<input type="password" class="form-control input-lg" id="ingPassword" name="ingPassword" placeholder="Contraseña" required>
												<span class="input-group-addon">
							
							<i class="fa fa-eye icon" id="icon" onclick="mostrarPassword2();"></i>
						
						</span>

					</div>

				</div>

				<center>
					<div class="g-recaptcha" data-sitekey="6LfeSNMUAAAAAF2tFNYGWymigmCn0LpULGC0LVAk"></div>
				</center>

				<br>

				

				<?php

					$ingreso = new ControladorUsuarios();
					$ingreso -> ctrIngresoUsuario();

				?>
				
				<input type="submit" class="btn btn-default backColor btn-block btnIngreso" value="ENVIAR">	

				<br>

				<center>
					
					<a href="#modalPassword" data-dismiss="modal" data-toggle="modal">¿Olvidaste tu contraseña?</a>

				</center>

			</form>

        </div>

        <div class="modal-footer">
          
			¿No tienes una cuenta registrada? | <strong><a href="#modalRegistro" data-dismiss="modal" data-toggle="modal">Registrarse</a></strong>

        </div>
      
    </div>

</div>


<!--=====================================
VENTANA MODAL PARA OLVIDO DE CONTRASEÑA
======================================-->

<div class="modal fade modalFormulario" id="modalPassword" role="dialog">

    <div class="modal-content modal-dialog">

        <div class="modal-body modalTitulo">

              <button type="button" class="close" data-dismiss="modal">&times;</button>
        	
			<!--=====================================
			OLVIDO CONTRASEÑA
			======================================-->

			<form method="post">

				<label>Escribe el correo electrónico con el que estás registrado y allí te enviaremos una nueva contraseña:</label><br><br>

				<div class="form-group">
					
					<div class="input-group">
						
						<span class="input-group-addon">
							
							<i class="glyphicon glyphicon-envelope"></i>
						
						</span>
					
						<input type="email" class="form-control input-lg" id="passEmail" name="passEmail" placeholder="Correo Electrónico" required>

					</div>

				</div>			

				<?php

					$password = new ControladorUsuarios();
					$password -> ctrOlvidoPassword();

				?>
				
				<input type="submit" class="btn btn-default backColor btn-block" value="ENVIAR">	

			</form>

        </div>

        <div class="modal-footer">
          
			¿No tienes una cuenta registrada? | <strong><a href="#modalRegistro" data-dismiss="modal" data-toggle="modal">Registrarse</a></strong>

        </div>
      
    </div>

</div>




