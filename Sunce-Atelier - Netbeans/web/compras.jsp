<%-- 
    Document   : index2
    Created on : 11/11/2023, 10:23:40 PM
    Author     : kingu
--%>

<%@page import="modelo.Producto"%>
<%@page import="modelo.Compra"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controlador.Consultas"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession objSesion = request.getSession(false);
    String correo = (String) objSesion.getAttribute("correo");
    if (correo == null || correo.isEmpty()) {
        // Si el correo no está presente en la sesión, redirige a la página de inicio de sesión
        response.sendRedirect("index.jsp");
    }
    objSesion.setAttribute("correo", correo);
    Consultas sql=new Consultas();
    ArrayList<Compra> compras=sql.obtenerCompras(correo);
    System.out.println(compras.size());
    // Aquí puedes utilizar la variable 'correo' para cualquier propósito en tu página
%>
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
        <title>Sunce Atelier - Inicio</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
        <link rel="stylesheet" href="assets/css/owl.css">

        <%
            String mensaje = (String) request.getSession().getAttribute("mensaje");
            if (mensaje != null) {
        %>
        <script>
            alert("<%= mensaje%>");
            // Elimina el mensaje de la sesión después de mostrarlo
            <% session.removeAttribute("mensaje"); %>
        </script>
        <%
            }
        %>
    </head>

    <body>

        <!-- ***** Preloader Start ***** -->
        <div id="preloader">
            <div class="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
        <!-- ***** Preloader End ***** -->

        <!-- Header -->
        <header class="">
            <nav class="navbar navbar-expand-lg">
                <div class="container">
                    <!--  <a class="navbar-brand" href="index.html"><h2>Sixteen <em>Clothing</em></h2></a> -->
                    <a class="navbar-brand logo" href="index2.jsp"><img class="logo" src="assets/images/logooo.png"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                            aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="index2.jsp">Inicio
                                    <span class="sr-only">(current)</span>
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
                            <li class="nav-item">
                                <a class="nav-link" href="informacion_usuario.jsp"">Ver
                                    información del usuario</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="carrito.jsp"">Carrito</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="compras.jsp"">Mis compras</a>
                            </li>
                            <li class=" nav-item">
                                <a class="nav-link" href="index.jsp">Cerrar Sesion</a>
                            </li>
                        </ul>
                    </div>
            </nav>
        </header>

        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <!-- Banner Ends Here -->


        <%
            for(Compra compra : compras){
            int idCompra = compra.getId_compra();
            ArrayList<Producto> productos = sql.obtenerProductosCompra(idCompra);
            System.out.println(productos.size());
        %>

        <h2 style="text-align: center;">Compra ID: <%= idCompra %></h2>
        <table border="1" class="comprasTable">
            <thead>
                <tr>
                    <th>ID Producto</th>
                    <th>Nombre Producto</th>
                    <th>Imagen Producto</th>
                    <th>Precio Producto</th>
                    <!-- Agrega más columnas según sea necesario -->
                </tr>
            </thead>
            <tbody>
                <% for(Producto producto : productos){ %>
                    <tr>
                        <td><%= producto.getId() %></td>
                        <td><%= producto.getNombre() %></td>
                        <td><img src="<%= producto.getImg() %>" alt="" width="100px" height="100px"/></td>
                        <td><%= producto.getPrecio() %></td>
                        <!-- Agrega más columnas según sea necesario -->
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } %>



        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="inner-content">
                            <p>Copyright &copy; 2020 Sixteen Clothing Co., Ltd.

                                - Design: <a rel="nofollow noopener" href="https://templatemo.com" target="_blank">TemplateMo</a></p>
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

        <div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="productModalLabel"></h2>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="text-center">
                                    <img id="productImage" src="" alt="" class="productoVentana img-fluid">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <h3 id="productDescription"></h3>
                                <br>
                                <h2 id="productPrice"></h2>
                                <br>
                                <button id="addToCartButton" class="agregarCarrito">Agregar al carrito</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>
