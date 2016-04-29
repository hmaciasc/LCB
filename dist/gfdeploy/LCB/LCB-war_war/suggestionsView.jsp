<%-- 
    Document   : searchView
    Created on : 13-mar-2016, 14:53:49
    Author     : javi
--%>

<%@page import="util.ShoppingCart"%>
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
        <title>Libros mejor valorados</title>
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
                    <h2>Recomendaciones: </h2>
                </div>
                <div class='col-lg-1 pull-right'>
                    <% ShoppingCart cart = (ShoppingCart) session.getAttribute("cart"); %>
                    <p> Carrito: <% out.print(cart.getCart().size()); %> productos</p>
                    <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                        <input type='hidden' value='ShowCartCommand' name='command'>
                        <button type='submit' class='btn btn-default'>Ver Carrito</button>
                    </form>
                </div>
            </div>
            <div class='container row-fluid center-block'>
                <% ArrayList<Book> books = (ArrayList) session.getAttribute("recomendations");
                    if (books !=  null && !books.isEmpty()) {
                        for (Book book : books){
                %>
                <div class='col-lg-4'>
                    <div class='book'>
                        <img src="covers/<% out.print(book.getTitle()+".jpg"); %>" onerror="this.src='images/inf.gif'" class="img-thumbnail img-responsive">
                        <p> <% out.print(book.getTitle()); %> </p>
                        <p> <% out.print(book.getAuthor()); %> </p>
                        <p> <% out.print(book.getCopy()); %> copias </p>
                        <p> <% out.print(book.getPrice()); %> €</p>
                        <p> <% out.print(book.getCategory()); %> </p>
                        <p> <% out.print(book.getUsersvalue()); %> </p>
                            <%  if (book.getCopy() <= 0) {   %>
                                <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                                    <input type='hidden' value='ReserveBookCommand' name='command'>
                                    <input type='hidden' value='<% out.print(book.getIsbn());%>' name='bookIsbn'>
                                    <button type='submit' class='btn btn-warning'>Reservar</button>
                                </form><br>
                            <%  } else {   %>
                            <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                                <input type='hidden' value='AddToCartCommand' name='command'>
                                <input type='hidden' value='<% out.print(book.getIsbn());%>' name='bookIsbn'>
                                <button type='submit' class='btn btn-primary'>Añadir al carrito</button>
                            </form><br>
                            <% } %>
                    </div>
                </div>
                        <% } %>
                    <% } else {%>
                    <p><h3>Sin resultados.</h3></p>
                    <% } %>
            </div>
        </div>
        
    </body>
</html>
