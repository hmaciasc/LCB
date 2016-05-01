<%-- 
    Document   : registerView
    Created on : 28-Mar-2016, 14:51:31
    Author     : hmaci
--%>

<%@page import="util.ShoppingCart"%>
<%@page import="entity.Client"%>
<%@page import="entity.Book"%>
<%@page import="javax.ejb.EJB"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/menu.css" rel="stylesheet">
        <link href="css/register.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Regístrate en LCB</title>
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
                                        <ul class='listItems'>
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
                                    <form action='FrontControllerServlet' method='POST' role='form'>
                                        <ul class='listItems'>
                                            <li class="dropdown-header">Materias</li>
                                            <li><input type='hidden' value='SearchCommand' name='command'/></li>
                                           <li><input type='submit' class='submitLink' value='Idiomas' name='genero'/></li>
                                           <li><input type='submit' class='submitLink' value='Deportes' name='genero'/></li>
                                           <li><input type='submit' class='submitLink' value='Tecnologia' name='genero'/></li>
                                           <li><input type='submit' class='submitLink' value='Informatica' name='genero'/></li>
                                           <li><input type='submit' class='submitLink' value='Oposiciones' name='genero'/></li>
                                        </ul>
                                    </form>
                                </li>
                                <li class="col-sm-3">
                                    <div>
                                        <form action='FrontControllerServlet' method='POST' role='form'>
                                            <input type='hidden' value='ShowBookDetailsCommand' name='command'/>
                                            <ul class='listItems'>
                                                <li class="dropdown-header">Recomendados</li>
                                                <li><input type='submit' class='submitLink' value='Cronicas vampiricas' name='title'/></li>
                                                <li><input type='submit' class='submitLink' value='El nombre del viento' name='title'/></li>
                                                <li><input type='submit' class='submitLink' value='Los juegos del hambre' name='title'/></li>
                                                <li><input type='submit' class='submitLink' value='Harry Potter 3' name='title'/></li>
                                                <li><input type='submit' class='submitLink' value='Harry Potter 1' name='title'/></li>
                                            </ul>
                                        </form>
                                    </div>
                                </li>
                                <li class="col-sm-3">
                                    <ul class='listItems'>
                                        <li class="dropdown-header">Libros</li>
                                        <li><div class="carousel slide" data-ride="carousel">
                                            <div class="carousel-inner">
                                                <% ArrayList<Book> books = (ArrayList) session.getAttribute("books");
                                                    int active = 1;
                                                    if (books !=  null && !books.isEmpty()) {
                                                        for (Book book : books){ %>
                                                    <div class="item <% if (active == 1) out.print("active");%>">
                                                        <form action='FrontControllerServlet' method='POST' role='form'>
                                                            <input type='hidden' value='ShowBookDetailsCommand' name='command'/>
                                                            <% active = 0; %>
                                                            <input type='hidden' value='<% out.print(book.getIsbn()); %>' name='isbnDetails'/>
                                                            <input type='image' src='covers/<% out.print((book.getTitle())+".jpg"); %>' class="img-responsive" alt="<% out.print(book.getTitle()); %>">
                                                        </form>
                                                    </div><!-- End Item -->
                                                    <% } %>
                                                <% } %>
                                            </div><!-- End Carousel Inner -->
                                        </div></li><!-- /.carousel -->
                                        <li class="divider"></li>
                                        <li ><a href="booksView.jsp" class='submitLink'>Ver todos los libros</a></li>
                                    </ul>
                                    <ul class='listItems'>
                                        <li><div>
                                            <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                                                <input type='hidden' value='ShowSuggestionsCommand' name='command'>
                                                <button type='submit' class='submitLink'>Ver Recomendaciones</button>
                                            </form>
                                        </div></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>

                    </ul>
                    <ul class="nav navbar-nav">
                        <li>
                            <form action='FrontControllerServlet' class="navbar-form" method='POST' role="search">
                                <ul class="nav navbar-nav">
                                    <li><input type='hidden' value='SearchCommand' name='command'></li>
                                    <li>
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Buscar" name="search" required>
                                            <div class="input-group-btn">
                                                <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <select name="select" class='form-control'>
                                        <option selected="selected" value="0">Título</option>
                                        <option value="1">Autor</option>
                                        <option value="2">Categoría</option>
                                        </select>
                                    </li>
                                </ul>
                            </form>
                        </li>
                        
                    </ul>
                    <ul class="nav navbar-nav" style="padding-top: 8px">
                    <%  Client client = (Client) session.getAttribute("client");
                        if(client != null && client.getIsadmin() == 1){ %>
                        <li><div class="navbar-header">
                            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class='btn btn-danger' href='adminView.jsp'>Administrar Base de Datos</a>
                            </div></li>
                    <%  } %>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Mi cuenta <span class="caret"></span></a>
                            <% if(session.getAttribute("session") == null){ %>
                                    <ul class="dropdown-menu" role="menu">
                                    <li><a href="loginView.jsp">Inicia Sesión</a></li>
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
        <div class='container-fluid'>
            <div class='row'>
                    <% 
                        if(session.getAttribute("session") == null){ 
                    %>
                    
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-4 center-block centered-form">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
			    		<h3 class="panel-title">Regístrate</h3>
                                    </div>
                                    <div class="panel-body">
			    		<form action='FrontControllerServlet' method='POST' role="form">
                                            <input type='hidden' value='RegisterCommand' name='command'>
                                            <div class="form-group">
                                                <input type="email" name="user" id="email" class="form-control input-sm" placeholder="Email" required>
                                            </div>
                            
                                            <div class="form-group">
    		    				<input type="text" name="name" id="email" class="form-control input-sm" placeholder="Nombre">
                                            </div>
                            
                                            <div class="form-group">
        	    				<input type="text" name="lastname" id="email" class="form-control input-sm" placeholder="Apellido">
                                            </div>
                            
                                            <div class="form-group">
        	    				<input type="text" name="address1" id="email" class="form-control input-sm" placeholder="Dirección" required>
                                            </div>
                            
                                            <div class="form-group">
                				<input type="text" name="address2" id="email" class="form-control input-sm" placeholder="Dirección Alternativa">
                                            </div>

                                            <div class="row">
			    			<div class="col-xs-6 col-sm-6 col-md-6">
                                                    <div class="form-group">
                                                        <input type="password" name="password1" id="password" class="form-control input-sm" placeholder="Contraseña" required>
                                                    </div>
                                                </div>
			    			<div class="col-xs-6 col-sm-6 col-md-6">
                                                    <div class="form-group">
                                                        <input type="password" name="password2" id="password_confirmation" class="form-control input-sm" placeholder="Confirmar Contraseña" required>
                                                    </div>
                                                </div>
                                            </div>
			    			
                                            <input type="submit" value="REGISTRARSE" class="btn btn-danger btn-block">
			    		
			    		</form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        <% }else{ %>

                        Usuario: <% out.print(session.getAttribute("session")); %>

                    <% } %>
                </div>
            </div>
        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src="js/menu.js"></script>
        <script src="js/register.js"></script>
    </body>
</html>

