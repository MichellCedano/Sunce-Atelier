<%-- 
    Document   : about2
    Created on : 11/11/2023, 10:18:10 PM
    Author     : kingu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSesion = request.getSession(false);
    String correo = (String) objSesion.getAttribute("correo");
    if (correo == null || correo.isEmpty()) {
        // Si el correo no está presente en la sesión, redirige a la página de inicio de sesión
        response.sendRedirect("index.jsp");
    }
    objSesion.setAttribute("correo", correo);
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
        <title>Sunce Atelier - Conócenos</title>

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
                    <a class="navbar-brand logo" href="index2.jsp"><img class="logo" src="assets/images/logooo.png"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                            aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="index2.jsp">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="products2.jsp">Productos</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="about2.jsp">Conócenos
                                <span class="sr-only">(current)</span></a>
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
                                <a class="nav-link" href="cerrarSesion">Cerrar Sesión</a>
                            </li>
                        </ul>

                    </div>
            </nav>
        </header>

        <!-- Page Content -->
        <div class="page-heading about-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-content">
                            <h4>Conócenos</h4>
                            <h2>Sobre Sunce Atelier</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="best-features about-features">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>¿Quiénes somos?</h2>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="right-image">
                            <img src="assets/images/logooo.png" alt="">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="left-content">
                            <p>
                              Sunce-atelier
                            </p>
                            <p>
                              Es una empresa pequeña empezada por una sola persona. 
                            </p>
                            <p>
                              Sleepysuny, como su seudónimo en las redes, una artista y diseñadora grafica local de
                              Ciudad Obregón Sonora, México.
                            </p>
                            <p>
                              La empresa comenzó con sus pedidos a finales del año 2022, pues inicio a base de las
                              impresiones propias de Sleepysuny, quien cansada de comprar en las imprentas de su ciudad, que
                              trabajaban con mala calidad y no ofrecían el servicio que ella requería, además de sus
                              altos precios, comenzó su emprendimiento con sus conocidos, ofreciéndoles impresiones de
                              sus propias ilustraciones, con artistas pequeños que asistían a convenciones o bazares de
                              la localidad de tema friki.
                            </p>
                            <p>
                              Al ser estudiante de diseño gráfico, pudo instruirse más al respecto de las máquinas que
                              puede utilizar para distintos productos, decidió ampliar más su negocio para fuera del
                              municipio, expandir más su trabajo, y vender más variedad de cosas, ofreciendo precios
                              accesibles para estos según las cantidades ordenadas, pero nunca bajando la calidad de su
                              trabajo.
                            </p>
                            <p>
                              Pues al ser ella misma un cliente de su propio producto en un inicio, conoce
                              mejor que nadie la experiencia que quiere llevar un posible cliente, aceptando siempre
                              comentarios para mejorar sus productos y ofrecer cosas que no son tan sencillas de
                              conseguir en el entorno local, de la misma manera ofreciendo envíos a todo el municipio y
                              abriéndose la posibilidad en un futuro a de manera nacional y quizá internacional.
                            </p>
                            <ul class="social-icons">
                                <li><a target="_blank" href="https://www.instagram.com/sunce_atelier/"><i class="fa fa-instagram"></i></a></li>
                            </ul>
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


    </body>

</html>
