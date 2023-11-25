<%-- 
    Document   : informacion_usuario
    Created on : 11/11/2023, 10:24:39 PM
    Author     : kingu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.getSession().removeAttribute("carrito");
    String correo=(String)request.getSession().getAttribute("correo");
    Usuario usuario = new Consultas().obtenerUsuario(correo);
    if(correo!=null){
        if(usuario.getEstado()!=null){
            response.sendRedirect("index2.jsp");
        }
    }else{
        response.sendRedirect("index.jsp");
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
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
                    <a class="navbar-brand logo" href="administracion.jsp"><img class="logo" src="assets/images/logooo.png"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                            aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#" onclick="openAgregarProductoForm()">Agregar Producto
                                    
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" onclick="openActualizarProductoForm()">Actualizar Producto</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" onclick="openEliminarProductoForm()">Eliminar Producto</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" onclick="openEliminarUsuarioForm()">Eliminar Usuario</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="informacion_administrador.jsp"">Ver Información</a>
                                <span class="sr-only">(current)</span>
                            </li>
                            <li class=" nav-item">
                                <a class="nav-link" href="cerrarSesion">Cerrar Sesion</a>
                            </li>
                        </ul>
                        
                        <div class="w3-container">
                            <div id="agregarProducto" class="w3-modal" style="display:none">
                                <div class="w3-modal-content">
                                    <div class="w3-container">
                                        <!-- Modal body -->
                                        <form action="agregarProducto" method="post">
                                            <h2>Agregar Producto</h2>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-font"></i></span>
                                                <input type="text" class="form-control" placeholder="Ingrese el nombre del producto" id="nombreProducto" name="nombreProducto" required>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-image"></i></span>
                                                <input type="text" class="form-control" placeholder="Ingrese la ruta de la imagen" id="img" name="img" required>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                                                <input type="text" class="form-control" placeholder="Ingrese el precio" id="precio" name="precio" required>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-tags"></i></span>
                                                <select class="form-select" id="tipo" name="tipo" required>
                                                    <option value="" disabled selected>Selecciona el tipo</option>
                                                    <option value="Sticker">Sticker</option>
                                                    <option value="Pin">Pin</option>
                                                    <option value="Libreta">Libreta</option>
                                                    <!-- Agrega más opciones según sea necesario -->
                                                </select>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-list-ol"></i></span>
                                                <input type="text" class="form-control" placeholder="Ingrese el stock" id="stock" name="stock" oninput="validarNumero(this)" required>
                                            </div>
                                            <button type="submit" class="modalIniciar"><i class="fa fa-user-circle"
                                                                                          aria-hidden="true"></i>Agregar Producto</button>
                                        </form>
                                        <br>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger"
                                                    onclick="document.getElementById('agregarProducto').style.display = 'none'"
                                                    class="w3-button w3-display-topright"">Cerrar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="w3-container">
                            <div id="actualizarProducto" class="w3-modal" style="display:none">
                                <div class="w3-modal-content">
                                    <div class="w3-container">
                                        <!-- Modal body -->
                                        <form action="actualizarProducto" method="post">
                                            <h2>Actualizar Producto</h2>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                                                <input type="number" class="form-control" placeholder="Ingrese el id del producto" id="idProducto" name="idProducto" oninput="validarNumero(this)" required>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-font"></i></span>
                                                <input type="text" class="form-control" placeholder="Ingrese el nombre del producto" id="nombreProducto" name="nombreProducto" required>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-image"></i></span>
                                                <input type="text" class="form-control" placeholder="Ingrese la ruta de la imagen" id="img" name="img" required>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                                                <input type="number" class="form-control" placeholder="Ingrese el precio" id="precio" name="precio" required>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-tags"></i></span>
                                                <select class="form-select" id="tipo" name="tipo" required>
                                                    <option value="" disabled selected>Selecciona el tipo</option>
                                                    <option value="Sticker">Sticker</option>
                                                    <option value="Pin">Pin</option>
                                                    <option value="Libreta">Libreta</option>
                                                    <!-- Agrega más opciones según sea necesario -->
                                                </select>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-list-ol"></i></span>
                                                <input type="number" class="form-control" placeholder="Ingrese el stock" id="stock" name="stock" oninput="validarNumero(this)" required>
                                            </div>
                                            <button type="submit"  class="modalIniciar"><i class="fa fa-user-circle"
                                                                                          aria-hidden="true"></i>Actualizar Producto</button>
                                        </form>
                                        <br>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger"
                                                    onclick="document.getElementById('actualizarProducto').style.display = 'none'"
                                                    class="w3-button w3-display-topright"">Cerrar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="w3-container">
                            <div id="eliminarProducto" class="w3-modal" style="display:none">
                                <div class="w3-modal-content">
                                    <div class="w3-container">
                                        <!-- Modal body -->
                                        <form action="eliminarProducto" method="post">
                                            <h2>Eliminar Producto</h2>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                                                <input type="number" class="form-control" placeholder="Ingrese el id del producto" id="idProducto" name="idProducto" oninput="validarNumero(this)" required>
                                            </div>
                                            <button type="submit" class="modalIniciar"><i class="fa fa-user-circle"
                                                                                          aria-hidden="true"></i>Eliminar Producto</button>
                                        </form>
                                        <br>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger"
                                                    onclick="document.getElementById('eliminarProducto').style.display = 'none'"
                                                    class="w3-button w3-display-topright"">Cerrar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="w3-container">
                            <div id="eliminarUsuario" class="w3-modal" style="display:none">
                                <div class="w3-modal-content">
                                    <div class="w3-container">
                                        <!-- Modal body -->
                                        <form action="eliminarUsuario" method="post">
                                            <h2>Eliminar Usuario</h2>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                                                <input type="number" class="form-control" placeholder="Ingrese el id del usuario" id="idProducto" name="idUsuario" oninput="validarNumero(this)" required>
                                            </div>
                                            <button type="submit" class="modalIniciar"><i class="fa fa-user-circle"
                                                                                          aria-hidden="true"></i>Eliminar Usuario</button>
                                        </form>
                                        <br>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger"
                                                    onclick="document.getElementById('eliminarUsuario').style.display = 'none'"
                                                    class="w3-button w3-display-topright"">Cerrar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

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
            <form id="adminForm">
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
                <button type="button" id="guardar" onclick="guardarCambiosAdministrador()">Guardar</button>
                <br>
                <button type="button" id="restaurar" onclick="restaurarCambiosAdministrador()">Restaurar</button>
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