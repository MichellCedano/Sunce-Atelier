<%-- 
    Document   : informacion_usuario
    Created on : 11/11/2023, 10:24:39 PM
    Author     : kingu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSesion = request.getSession(false);
    String correo = (String) objSesion.getAttribute("correo");
    Usuario usuario = null;
    if (correo == null || correo.isEmpty()) {
        // Si el correo no está presente en la sesión, redirige a la página de inicio de sesión
        response.sendRedirect("index.jsp");
    } else {
        objSesion.setAttribute("correo", correo);
        usuario = new Consultas().obtenerUsuario(correo);
    }
%>
<%@page import="controlador.Consultas"%>
<%@page import="modelo.Usuario"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
              rel="stylesheet">

        <script src="assets/js/botones.js" type="text/javascript"></script>
        <title>Sunce Atelier - Información Usuario</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
        <link rel="stylesheet" href="assets/css/owl.css">

    </head>
    <!-- Header -->
    <header class="">
        <nav class="navbar navbar-expand-lg">
            <div class="container">
                <!--  <a class="navbar-brand" href="index.html"><h2>Sixteen <em>Clothing</em></h2></a> -->
                <a class="navbar-brand logo" href="index2.jsp"><img class="logo" src="assets/images/logooo.png"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index2.jsp">Inicio
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="products2.jsp">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about2.jsp">Conócenos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact2.jsp">Contáctanos</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="informacion_usuario.jsp"">Ver
                                información del usuario
                                    <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="carrito.jsp"">Carrito</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="compras.jsp"">Mis compras</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cerrarSesion">Cerrar Sesión</a>
                        </li>
                    </ul>
                    <!--Formulario emergente de inicio de sesion-->
                    
                </div>
            </div>
        </nav>
    </header>
    <body>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="col-md-6 offset-md-3">
            <h1>Información del Usuario</h1>
            <br>
            <form id="userForm">
                <label for="email">Nombre de usuario:</label>
                <input type="text" id="nombre" name="nombre" value=<%= usuario.getNombre()%> disabled>
                <button type="button" id="editarNombre" onclick="editarCampo('nombre')"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                <br>
                <label for="password">Contraseña:</label>
                <input type="password" id="pass" nombre="pass" value=<%= usuario.getPass()%> disabled>
                <button type="button" id="editarPassword" onclick="editarCampo('pass')"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                <br>
                <label for="email">Correo electrónico:</label>
                <input type="text" id="correo" name="correo" value=<%= usuario.getCorreo()%> disabled>
                <br>
                <label for="phone">Teléfono:</label>
                <input type="text" id="telefono" name="telefono" value=<%= usuario.getTelefono()%> disabled>
                <button type="button" id="editarTelefono" onclick="editarCampo('telefono')"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                <br>
                <label for="street">Dirección - Calle:</label>
                <input type="text" id="calle" name="calle" value=<%= usuario.getCalle()%> disabled>
                <button type="button" id="editarCalle" onclick="editarCampo('calle')"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                <br>
                <label for="colonia">Dirección - Colonia:</label>
                <input type="text" id="colonia" name="colonia" value=<%= usuario.getColonia()%> disabled>
                <button type="button" id="editarColonia" onclick="editarCampo('colonia')"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                <br>
                <label for="city">Dirección - Ciudad:</label>
                <input type="text" id="ciudad" name="ciudad" value=<%= usuario.getCiudad()%> disabled>
                <button type="button" id="editarCiudad" onclick="editarCampo('ciudad')"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                <br>
                <label for="state">Dirección - Estado:</label>
                <input type="text" id="estado" name="estado" value=<%= usuario.getEstado()%> disabled>
                <button type="button" id="editarEstado" onclick="editarCampo('estado')"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                <br>
                <label for="country">Dirección - País:</label>
                <input type="text" id="pais" name="pais" value=<%= usuario.getPais()%> disabled>
                <button type="button" id="editarPais" onclick="editarCampo('pais')"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                <br>
                <label for="postal">Dirección - Código Postal:</label>
                <input type="text" id="codigo_postal" name="codigo_postal" value=<%= usuario.getCodigo_postal()%> disabled>
                <button type="button" id="editarPostal" onclick="editarCampo('codigo_postal')"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                <br>
                <label for="postal">Dirección - Número de casa:</label>
                <input type="text" id="numero_casa" name="numero_casa" value=<%= usuario.getNumero_casa()%> disabled>
                <button type="button" id="editNumero" onclick="editarCampo('numero_casa')"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                <br>
                <button type="button" id="guardar" onclick="guardarCambios()">Guardar</button>
                <br>
                <button type="button" id="restaurar" onclick="restaurarCambios()">Restaurar</button>
            </form>

            <p id="confirmacion" style="display: none">Cambios guardados con éxito.</p>
        </div>
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="inner-content">
                            <p>Copyright &copy; 2023 - Sunce Atelier - Equipo 5
                        </div>
                    </div>
                </div>
            </div>
        </footer>


        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


        <!-- Additional Scripts -->
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>
        <script src="assets/js/slick.js"></script>
        <script src="assets/js/isotope.js"></script>
        <script src="assets/js/accordions.js"></script>


        <script language="text/Javascript">
                    cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
                    function clearField(t) {                   //declaring the array outside of the
                        if (!cleared[t.id]) {                      // function makes it static and global
                            cleared[t.id] = 1;  // you could use true and false, but that's more typing
                            t.value = '';         // with more chance of typos
                            t.style.color = '#fff';
                        }
                    }
        </script>

        <div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="productModalLabel"></h2>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <img id="productImage" src="" alt="">
                        <h3 id="productDescription"></h3>
                        <h3 id="productPrice"></h3>
                        <button id="addToCartButton" class="btn btn-primary">Agregar al carrito</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>