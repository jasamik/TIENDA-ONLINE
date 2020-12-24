<!--=====================================
MENU
======================================-->	

<ul class="sidebar-menu">

	<li class="active"><a href="inicio"><i class="fa fa-home"></i> <span>Inicio</span></a></li>

  <?php

  if($_SESSION["perfil"] == "administrador"){

	echo '<li><a href="comercio"><i class="fa fa-files-o"></i> <span>Gestor Logo</span></a></li>';

  }

  ?>

  <li><a href="productos"><i class="fa fa-building"></i> <span>Gestor Empresas</span></a></li>
  <li><a href="usuarios"><i class="fa fa-users"></i> <span>Gestor Cursos</span></a></li>
  <li><a href="usuarios"><i class="fa fa-users"></i> <span>Gestor Alumnos</span></a></li>

  <?php

   if($_SESSION["perfil"] == "administrador"){

    echo '<li><a href="perfiles"><i class="fa fa-key"></i> <span>Gestor Usuarios</span></a></li>';

  }

  ?>

</ul>	