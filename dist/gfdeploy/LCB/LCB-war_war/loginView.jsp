<%-- 
    Document   : loginView
    Created on : 14-mar-2016, 9:07:43
    Author     : javi
--%>

<%@page import="entity.Client"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/login.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>LCB - Login</title>
    </head>
    <body>
         <div class="container">
            <nav class="navbar navbar-inverse">
                <div class="navbar-header">
                    <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href='FrontControllerServlet'>Leaky Cauldron</a>
                </div>

                <div class="collapse navbar-collapse js-navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="dropdown mega-dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Nuestros productos <span class="caret"></span></a>
                            <ul class="dropdown-menu mega-dropdown-menu">
                                <li class="col-sm-3">
                                    <ul>
                                        <li class="dropdown-header">Géneros</li>
                                        <li><a href="#">Juvenil</a></li>
                                        <li><a href="#">Infantil</a></li>
                                        <li><a href="#">Fantasía</a></li>
                                        <li><a href="#">Aventuras</a></li>
                                        <li><a href="#">Ciencia Ficción</a></li>
                                    </ul>
                                </li>
                                <li class="col-sm-3">
                                    <ul>
                                        <li class="dropdown-header">Materias</li>
                                        <li><a href="#">Idiomas</a></li>
                                        <li><a href="#">Deportes</a></li>
                                        <li><a href="#">Tecnología</a></li>
                                        <li><a href="#">Informática</a></li>
                                        <li><a href="#">Oposiciones</a></li>
                                    </ul>
                                </li>
                                <li class="col-sm-3">
                                    <ul>
                                        <li class="dropdown-header">Recomendados</li>
                                        <li><a href="showBookInfo.jsp?title='Crónicas Vampíricas'">Crónicas Vampíricas</a></li>
                                        <li><a href="showBookInfo.jsp?title='El Nombre del Viento'">El Nombre del Viento</a></li>
                                        <li><a href="showBookInfo.jsp?title='Los Juegos del Hambre'">Los Juegos del Hambre</a></li>
                                        <li><a href="showBookInfo.jsp?title='Harry Potter y el Cáliz del Fuego'">Harry Potter y el Cáliz del Fuego</a></li>
                                        <li><a href="showBookInfo.jsp?title='Harry Potter y la Piedra Filosofal'">Harry Potter y la Piedra Filosofal</a></li>
                                    </ul>
                                </li>
                                <li class="col-sm-3">
                                    <ul>
                                        <li class="dropdown-header">Libros</li>
                                        <div class="carousel slide" data-ride="carousel">
                                            <div class="carousel-inner">
                                                <div class="item active">
                                                    <a href="#"><img src="covers/Harry Potter 1.jpg" class="img-responsive" alt="product 1"></a>
                                                </div><!-- End Item -->
                                                <div class="item">
                                                    <a href="#"><img src="covers/Harry Potter 2.jpg" class="img-responsive" alt="product 2"></a>
                                                </div><!-- End Item -->
                                                <div class="item">
                                                    <a href="#"><img src="covers/Harry Potter 3.jpg" class="img-responsive" alt="product 3"></a>
                                                </div><!-- End Item -->
                                            </div><!-- End Carousel Inner -->
                                        </div><!-- /.carousel -->
                                        <li class="divider"></li>
                                        <li><a href="booksView.jsp">Ver todos los libros <span class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Mi cuenta <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="loginView.jsp">Inicia Sesión</a></li>
                                <li class="divider"></li>
                                <li><a href="registerView.jsp">Registrarse</a></li>
                            </ul>
                        </li>
                        <!--<li><a href="#">Ver carrito <span class="glyphicon glyphicon-shopping-cart"></span></a></li>-->
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> <span class="glyphicon glyphicon-shopping-cart"></span> 7 - Items<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <span class="item">
                                    <span class="item-left">
                                        <img src="covers/as.jpg" alt="" />
                                        <span class="item-info">
                                            <span>Item name</span>
                                            <span>23$</span>
                                        </span>
                                    </span>
                                    <span class="item-right">
                                        <button class="btn btn-xs btn-danger pull-right">x</button>
                                    </span>
                                </span>
                                <li class="divider"></li>
                                <li><a class="text-center" href="showCartView.jsp">Ver Carrito</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.nav-collapse -->
            </nav>
        </div>
        
        
        
        <div class="container">
            <div class="row">
                <div class="col-sm-4 center-block">
                    <div class="wrap">
                        <p class="form-title">
                            Inicie Sesión
                        </p>
                        <form method="post" class="login form-horizontal" action='FrontControllerServlet' role='form'>
                            <input type='hidden' value='LoginCommand' name='command'>
                            <input class='form-control' type='email' name='user' placeholder="Usuario">
                            <input class='form-control' type='password' name='password' placeholder="Contraseña">
                            <input type="submit" value="Entrar" class="btn btn-danger btn-sm" />
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src='js/login.js'></script>
        <script src="js/menu.js"></script>
    </body>
</html>
