<%-- 
    Document   : index2
    Created on : 11/11/2023, 10:23:40 PM
    Author     : kingu
--%>

<%@page import="modelo.Producto"%>
<%@page import="modelo.ControladorProducto"%>
<%@page import="modelo.Articulo"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    HttpSession objSesion = request.getSession(false);
    String correo = (String) objSesion.getAttribute("correo");
    if (correo == null || correo.isEmpty()) {
        // Si el correo no está presente en la sesión, redirige a la página de inicio de sesión
        response.sendRedirect("index.jsp");
    }
    objSesion.setAttribute("correo", correo);
    ArrayList<Articulo> articulos = objSesion.getAttribute("carrito") == null ? null : (ArrayList) objSesion.getAttribute("carrito");
    objSesion.setAttribute("carrito", articulos);
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
                            <li class="nav-item active">
                                <a class="nav-link" href="carrito.jsp"">Carrito
                                    <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="compras.jsp"">Mis compras</a>
                            </li>
                            <li class=" nav-item">
                                <a class="nav-link" href="cerrarSesion">Cerrar Sesion</a>
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

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <div class="table-responsive cart_info" id="cart-container">
                        <table class="table table-condensed" id="shop-table">
                            <thead>
                                <tr class="cart_menu">
                                    <td class="image">Productos</td>
                                    <td class="desciption"></td>
                                    <td class="price">Precio</td>
                                    <td class="quantity">Cantidad</td>
                                    <td class="total">Total</td>
                                    <td></td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    ControladorProducto cp = new ControladorProducto();
                                    double total = 0;
                                    
                                    if (articulos != null) {
                                        for (Articulo a : articulos) {
                                            Producto producto = cp.getProducto(a.getIdProducto());
                                            if (a.getCantidad() == 0) {
                                                continue;
                                            }
                                            total += a.getCantidad() * producto.getPrecio();
                                %>
                                <tr data-productid="<%= producto.getId()%>" data-cantidad="<%= a.getCantidad()%>"  data-stock="<%= producto.getStock()%>">
                                    <td class="cart_product">
                                        <a href=""><img src="<%= producto.getImg()%>" alt="" width="120"></a>
                                    </td>
                                    <td class="cart_description">
                                        <h4><a href=""><%= producto.getNombre()%></a></h4>
                                        <p>Web ID: <%= producto.getId()%></p>
                                    </td>
                                    <td class="cart_price">
                                        <p>$<%= producto.getPrecio()%></p>
                                    </td>
                                    <td class="cart_quantity">
                                        <div class="cart_quantity_button">
                                            <a href="#" class="cart_quantity_up"> + </a>
                                            <input class="cart_quantity_input" type="text" name="quantity" value="<%= a.getCantidad()%>"
                                                   autocomplete="off" size="2" >
                                            <a href="#" class="cart_quantity_down"> - </a>
                                        </div>
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price" name="txt-subtotal">$<%= Math.round(producto.getPrecio() * a.getCantidad() * 100.0) / 100.0%></p>
                                    </td>
                                    <td class="cart_delete">
                                        <span id="idarticulo" style="display: none;"><%= producto.getId()%></span>
                                        <a class="cart_quantity_delete" href="#" class="deleteitem"><i class="fa fa-times"></i></a>
                                    </td>
                                </tr>

                                <%}
                                    }%>
                            </tbody>
                        </table>
                        <% if (articulos == null) {%>
                        <h4>No hay articulos en el carrito</h4>
                        <%}%>
                    </div><a href="javascript:window.history.go(-1);">Seguir comprando</a> 
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-header bg-primary text-white">Carrito</div>
                        <div class="card-body">
                            <table>
                                <tr>
                                    <td>Sub-total <span id="txt-subtotal"></td>
                                    <td>$ <%= Math.round(total * 100.0) / 100.0%></span></td>
                                </tr>
                                <tr>
                                    <td>IVA<span id="txt-iva"></td>
                                    <td>$ <%= Math.round(total * 16.0) / 100.0%></span></td>
                                </tr>
                                <tr>
                                    <td>Total</td>
                                    <td><span id="txt-total" name="total">$ <%= Math.round(total * 116.0) / 100.0%></span></td>
                                </tr>
                            </table>
                        </div>
                        <div class="card-footer">
                            <form action="guardarCompra" method="post">
                                <!-- Agrega campos ocultos para enviar el total y el correo -->
                                <input type="hidden" name="total" value="<%= total%>">
                                <input type="hidden" name="correo" value="<%= correo%>">
                                <!-- Agrega más campos ocultos según sea necesario -->

                                <!-- Botón para enviar el formulario -->
                                <button type="submit" class="btn btn-default update">
                                    <i class="fa fa-shopping-cart"></i> Comprar
                                </button>
                            </form>
                        </div>

                    </div>
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
