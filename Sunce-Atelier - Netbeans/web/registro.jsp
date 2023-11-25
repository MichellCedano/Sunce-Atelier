<%-- 
    Document   : registro
    Created on : 11/11/2023, 10:25:49 PM
    Author     : kingu
--%>

<%@page import="modelo.Usuario"%>
<%@page import="controlador.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <% request.getSession().removeAttribute("carrito");
        String correo = (String) request.getSession().getAttribute("correo");
        if (correo != null) {
            Usuario usuario = new Consultas().obtenerUsuario(correo);
            if (usuario.getEstado() != null) {
                response.sendRedirect("informacion_usuario2.jsp");
            } else {
                response.sendRedirect("informacion_administrador.jsp");
            }
        }
    %>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
              rel="stylesheet">

        <script src="assets/js/botones.js" type="text/javascript"></script>
        <title>Sunce Atelier - Registro</title>

        <%
            String mensaje = (String) request.getSession().getAttribute("mensajeRegistro");
            if (mensaje != null) {
        %>
        <script>
            alert("<%= mensaje%>");
            // Elimina el mensaje de la sesión después de mostrarlo
            <% request.getSession().removeAttribute("mensaje"); %>
        </script>
        <%
            }
        %>
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
        <link rel="stylesheet" href="assets/css/owl.css">

    </head>
    <body>
        <!-- Header -->
        <header class="">
            <nav class="navbar navbar-expand-lg">
                <div class="container">
                    <a class="navbar-brand logo" href="index.jsp"><img class="logo" src="assets/images/logooo.png"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp">Inicio
                                </a>
                            </li> 
                            <li class="nav-item">
                                <a class="nav-link" href="products.jsp">Productos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="about.jsp">Conócenos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.jsp">Contáctanos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="loginButton" href="#" onclick="openLoginForm()">Iniciar Sesion</a>
                            </li>
                        </ul>
                        <!--Formulario emergente de inicio de sesion-->
                        <div class="w3-container">

                            <div id="id01" class="w3-modal" style="display:none">
                                <div class="w3-modal-content">
                                    <div class="w3-container">
                                        <!-- Modal body -->
                                        <form action="iniciarSesion" method="post">
                                            <h2>Inicio de sesion</h2>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
                                                <input type="email" class="form-control" placeholder="Ingrese su email" id="correo" name="correo" required>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fa fa-key" aria-hidden="true"></i></span>
                                                <input type="password" class="form-control" placeholder="Ingrese su password" id="pass" name="pass" required>
                                            </div>
                                            <button type="submit" class="modalIniciar"><i class="fa fa-user-circle"
                                                                                          aria-hidden="true"></i>Iniciar Sesion</button>
                                        </form>
                                        <br>
                                        <p>No tienes una cuenta? </p>
                                        <a class="nav-link" href="registro.jsp">Haz click aquí para registrarte</a>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" onclick="document.getElementById('id01').style.display = 'none'" class="w3-button w3-display-topright"">Cerrar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </header>
        <!-- Formulario de Registro de Usuario -->
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="container" style="padding-top: 100px;">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <h1>Registro de Usuario</h1>
                    <br>
                    <form id="registroForm" action="nuevoUsuario" onsubmit="return validarFormulario()">
                        <h3>Datos del usuario</h3>
                        <div class="form-group">
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese su nombre de usuario" required>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" id="pass" name="pass" placeholder="Ingrese su contraseña" required>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" id="correo" name="correo" placeholder="Ingrese su correo electrónico" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Ingrese su número de telefono" required>
                        </div>
                        <h3>Datos de la dirección</h3>
                        <div class="form-group">
                            <input type="text" class="form-control" id="numero_casa" name="numero_casa" placeholder="Ingrese el numero de casa" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="calle" name="calle" placeholder="Ingrese el nombre de la calle" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="colonia" name="colonia" placeholder="Ingrese el nombre de la colonia" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="ciudad" name="ciudad" placeholder="Ingrese el nombre de la ciudad" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="estado" name="estado" placeholder="Ingrese el nombre del estado" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="pais" name="pais" placeholder="Ingrese el nombre del país" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="codigo_postal" name="codigo_postal" placeholder="Ingrese el código postal" required>
                        </div>
                        <button style="font-size: 20px; padding: 14px;"type="submit" class="boton">Registrarse</button>
                    </form>
                </div>
            </div>
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
    </body>
</html>
