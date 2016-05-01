<%--
    Document   : indexView
    Created on : 12-mar-2016, 19:15:41
    Author     : maxi
--%>

<%@page import="util.StatisticsBean"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="entity.Client"%>
<%@page import="util.ShoppingCart"%>
<%@page import="javax.ejb.EJB"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/menu.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Welcome to Leaky Cauldron Bookstore!</title>
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
                                    <form action='FrontControllerServlet' method='POST' role='form'>
                                        <ul>
                                            <li class="dropdown-header">Géneros</li>
                                            <li><input type='hidden' value='SearchCommand' name='command'/></li>
                                            <li><input type='submit' class='submitLink' value='Juvenil' name='genero'/></li>
                                            <li><input type='submit' class='submitLink' value='Infantil' name='genero'/></li>
                                            <li><input type='submit' class='submitLink' value='Fantasia' name='genero'/></li>
                                            <li><input type='submit' class='submitLink' value='Aventuras' name='genero'/></li>
                                            <li><input type='submit' class='submitLink' value='Ciencia Ficcion' name='genero'/></li>
                                        </ul>
                                    </form>
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
                    
                    <ul class="nav navbar-nav">
                        <form action='FrontControllerServlet' class="navbar-form" method='POST' role="search">
                            <input type='hidden' value='SearchCommand' name='command'>
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Buscar" name="search" required>
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                </div>
                            </div>
                            <select name="select" class='form-control'>
                                <option selected="selected" value="0">Título</option>
                                <option value="1">Autor</option>
                                <option value="2">Categoría</option>
                            </select>
                        </form>
                    </ul>
                    
                    <ul class="nav navbar-nav" style="padding-top: 8px">
                        <% Client client = (Client) session.getAttribute("client");
                            if(client != null && client.getIsadmin() == 1){ %>
                                <a class='btn btn-danger' href='adminView.jsp'>Administrar Base de Datos</a>
                        <% } %>
                        
                    </ul>
                    
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Mi cuenta <span class="caret"></span></a>
                            <% if(session.getAttribute("session") == null){ %>
                                    <ul class="dropdown-menu" role="menu">
                                    <li><a href="loginView.jsp">Inicia Sesión</a></li>
                                    <li class="divider"></li>
                                    <li><a href="registerView.jsp">Registrarse</a></li>
                                </ul>   
                            <% }else{ %>
                            <ul class="dropdown-menu" role="menu">
                                <a href='profileView.jsp'>Perfil</a>
                                <li class="divider"></li>
                                <form action='FrontControllerServlet' class='form-horizontal' method='POST' role='form'>
                                    <input type='hidden' value='ShowStarredCommand' name='command'>
                                    <button class="submitLink" type='submit' class='btn btn-default'>Favoritos</button>
                                </form>
                                
                                <li class="divider"></li>
                                    <form method='post' action='FrontControllerServlet' role='form'>
                                        <input type='hidden' value='AddShoppingCommand' name='command'>
                                        <input class="submitLink" type='submit' name='compras' value="Mis compras">
                                    </form>
                                <li class="divider"></li>
                                <form action='FrontControllerServlet' class='form-horizontal' method='POST' role='form'>
                                    <input type='hidden' value='ShowReservationsCommand' name='command'>
                                    <button class='submitLink' type='submit'>Mis Reservas</button>
                                </form>
                                <li class="divider"></li>
                                    <form method='post' action='FrontControllerServlet' class='form-horizontal' role='form'>
                                        <input type='hidden' value='LogOutCommand' name='command'>
                                        <input type='submit' class='submitLink' name='logout' value='Cerrar sesión'>
                                    </form>
                                <% } %>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <% if(session.getAttribute("session") != null) { %>
                                <% ShoppingCart cart = (ShoppingCart) session.getAttribute("cart"); %>
                                <a href="FrontControllerServlet?command=ShowCartCommand" role="button" aria-expanded="false"> <span class="glyphicon glyphicon-shopping-cart"></span> <% out.print(cart.getCart().size()); %></a>
                            <% } %>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src="js/menu.js"></script>
    </body>
</html>
