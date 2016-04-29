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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Welcome to Leaky Cauldron Bookstore!</title>
    </head>
    <body>
        <div class='container-fluid'>
            <div class='row'>
                <div class='col-lg-1 col-md-offset-2'>
                    <a href='FrontControllerServlet'><img src='images/logo.jpg' class="img-responsive"></a>
                </div>
                <div class='col-lg-8'>
                    <h1><a href='FrontControllerServlet'> Leaky Cauldron Bookstore</a></h1>
                </div>
            </div>
            <div class='row'>
                <div class='col-lg-4'>
                    <% Client client = (Client)session.getAttribute("client");
                    if(client != null && client.getIsadmin() == 1){ %>
                        <a class='btn btn-danger' href='adminView.jsp'>Administrar Base de Datos</a>
                    <% }
                    if(session.getAttribute("session") == null){ %>
                        <a class='btn btn-danger btn-sm' href='registerView.jsp'> Regístrate!</a>
                    <% } %>
                </div>
            </div>
            <div class='row center-block'>
                <div class='col-lg-5'>
                    <% if(session.getAttribute("session") == null){ %>
                        <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                            <input type='hidden' value='LoginCommand' name='command'>
                            <label for="user">E-mail:</label>
                            <input class='form-control' type='email' name='user'><br>
                            <label for="password">Password:</label>
                            <input class='form-control' type='password' name='password'>
                            <button type='submit' class='btn btn-default'>Entrar</button>
                        </form>
                    <% }else{ %>
                            Usuario: <% out.print(session.getAttribute("session")); %>
                            <form method='post' action='FrontControllerServlet' class='form-horizontal' role='form'>
                                <input type='hidden' value='AddShoppingCommand' name='command'>
                                <input type='submit' class='btn btn-default' name='compras' value='Mis Compras'>
                            </form>
                            <a href='profileView.jsp' class='btn btn-default' role='button'>Perfil</a>
                            <form method='post' action='FrontControllerServlet' class='form-horizontal' role='form'>
                                <input type='hidden' value='LogOutCommand' name='command'>
                                <input type='submit' class='btn btn-default' name='logout' value='Cerrar sesión'>
                            </form>
                    <% } %>
                </div>
                <div class='col-lg-5'>
                    <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                        <input type='hidden' value='SearchCommand' name='command'>
                        <label for="search">Buscar: </label>
                        <input class='form-control' type='text' name='search' required><br>
                        <label for="select">Filtro: </label>
                        <select name="select" class='form-control'>
                            <option selected="selected" value="0">Título</option>
                            <option value="1">Autor</option>
                            <option value="2">Categoría</option>
                        </select>
                        <button type='submit' class='btn btn-default'>Buscar</button>
                    </form>
                </div>
                <% if (client != null) { %>
                <div class='col-lg-1 pull-right'>
                    <% ShoppingCart cart = (ShoppingCart) session.getAttribute("cart"); %>
                    <p> Carrito: <% out.print(cart.getCart().size()); %> productos</p>
                    <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                        <input type='hidden' value='ShowStarredCommand' name='command'>
                        <button type='submit' class='btn btn-default'>Favoritos</button>
                    </form>
                    <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                        <input type='hidden' value='ShowCartCommand' name='command'>
                        <button type='submit' class='btn btn-default'>Ver Carrito</button>
                    </form>
                    <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                        <input type='hidden' value='ShowReservationsCommand' name='command'>
                        <button type='submit' class='btn btn-default'>Ver Reservas</button>
                    </form>
                    <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                        <input type='hidden' value='ShowSuggestionsCommand' name='command'>
                        <button type='submit' class='btn btn-default'>Ver Recomendaciones</button>
                    </form>
                </div>
                <% } %>
            </div>
            <div class='container row-fluid center-block'>
                <% ArrayList<Book> books = (ArrayList) session.getAttribute("books");
                    if (books !=  null && !books.isEmpty()) {
                        for (Book book : books){
                %>
                <div class='col-lg-4'>
                    <div class='book'>
                        <img src="covers/<% out.print(book.getTitle()+".jpg"); %>" onerror="this.src='images/inf.gif'" class="img-thumbnail img-responsive">
                        <div class="row" style="margin-top: 10px;">
                            <div class="col-sm-6 tittles">
                                TÍTULO
                            </div>
                            <div class="col-sm-6 bookDescription">
                                <p> <% out.print(book.getTitle()); %> </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 tittles">
                                <p>AUTOR</p>
                            </div>
                            <div class="col-sm-6 bookDescription">
                                <p> <% out.print(book.getAuthor()); %> </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 tittles">
                                <p>PRECIO</p>
                            </div>
                            <div class="col-sm-6 bookDescription">
                                <p> <% out.print(book.getDiscountPrice()); %> €</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 tittles">
                                <p>VALORACIÓN</p>
                            </div>
                            <div class="col-sm-6 bookDescription">
                                <% if (book.getUsersvalue() == null) { %>
                                    <p> <% out.print("Sin valorar"); %> </p>
                                <% } else { %>
                                    <p> <% out.print(book.getUsersvalue()); %> </p>
                                <% } %>
                            </div>
                        </div>
                        <% if (client != null) { %>
                        <div class='row center-block'>
                            <div class="col-sm-12">
                                <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                                    <input type="hidden" value="BookValueCommand" name="command" />
                                    <input type="hidden" value='<% out.print(book.getIsbn()); %>' name="bookIsbn" />
                                    <input type="hidden" value="<% out.print(client.getMail()); %>" name='clientMail' />
                                    <div class="row">
                                        <div>
                                            1 <input type="radio"  name="bookValue" value="1"/>
                                            2 <input type="radio"  name="bookValue" value="2"/>
                                            3 <input type="radio"  name="bookValue" value="3"/>
                                            4 <input type="radio"  name="bookValue" value="4"/>
                                            5 <input type="radio"  name="bookValue" value="5"/>

                                            <button class="btn btn-warning btn-sm" type="submit"><span class='glyphicon glyphicon-star'></span></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <% } %>

                        <%  if (book.getCopy() <= 0) {   %>
                        <div class='row'>
                            <div class="col-sm-6">
                                <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                                    <input type='hidden' value='ReserveBookCommand' name='command'>
                                    <input type='hidden' value='<% out.print(book.getIsbn());%>' name='bookIsbn'>
                                    <button type='submit' class='btn btn-info'>Reservar</button>
                                </form><br>
                            </div>
                        </div>
                        <%  } else {   %>
                        <div class="row" style="margin-top: 10px;">
                            <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                                <input type='hidden' value='AddToCartCommand' name='command'>
                                <input type='hidden' value='<% out.print(book.getIsbn());%>' name='bookIsbn'>
                                    <div class="col-lg-5">
                                        <input type="text" class="form-control bfh-number" data-min="1" data-max="<% out.print(book.getCopy()); %>" data-wrap="true" name="nCopies">
                                    </div>
                                    <div class="col-lg-6 col-lg-offset-1">
                                        <button type='submit' class='btn btn-primary' style="width: 150px;">Añadir al carrito</button>
                                    </div>
                            </form>
                        </div><br>
                        <% } %>

                        <% if (client != null) { %>
                        <div class='row center-block'>
                            <div class="col-lg-1">
                                <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                                    <input type="hidden" value="StarredCommand" name="command" />
                                    <input type="hidden" value='<% out.print(book.getIsbn()); %>' name="bookIsbn" />
                                    <button class="btn btn-danger btn-sm" type="submit"><span class='glyphicon glyphicon-heart'></span></button>
                                </form>
                            </div>
                        </div><br>
                        <% } %>
                    </div>
                </div>
                    <% } %>
                <% } %>
                <div class='row'>
                    <div class='col-lg-12'>
                        <% String numberOfBooks = String.valueOf(session.getAttribute("bookCount"));
                           Double bookCount = Double.parseDouble(numberOfBooks); %>
                        <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                        <input type="hidden" value="HomeCommand" name="command" />
                        <div class='text-center'>
                            <ul class='pagination'>
                                <li><input type='submit' class='btn btn-default' value='1' name='pageNumber'/></li>
                                <% for (int i = 2; i <= (int) Math.ceil(bookCount / 6); i++){ %>
                                <li><input type='submit' class='btn btn-default' value='<% out.print(i); %>' name='pageNumber'/></li>
                                <% } %>
                            </ul>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src='js/bootstrap-formhelpers.js'></script>
    </body>
</html>
