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
        <link href="./style.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Búsqueda</title>
    </head>
    <body>
        <div class='button'>
            <h1><a href='FrontControllerServlet'> Leaky Cauldron Bookstore</a></h1>
        </div>
        <div class='header wrapper'>
            <div class='cart'>
                <% ShoppingCart cart = (ShoppingCart) session.getAttribute("cart"); %>
                <p> Carrito: <% out.print(cart.getCart().size()); %> productos</p>
                <form action='FrontControllerServlet'>
                    <input type='hidden' value='ShowCartCommand' name='command'>
                    <input type='submit' value='Ver Carrito'>
                </form>
            </div>
        </div>
        <h1>Resultado de la búsqueda: </h1>
        <div class='wrapper'>
            <% 
                ArrayList<Book> books = (ArrayList) request.getAttribute("books");
                for (Book book : books) {
            %>
            <div class='book'>
                <h2> <% out.print("Título: " + book.getTitle()+ "<br>"); %> </h2>
                <h2> <% out.print("Autor: " + book.getAuthor()+ "<br>"); %> </h2>
                <h2> <% out.print("Editorial: " + book.getPublisher()+ "<br>"); %> </h2>
                <h2> <% out.print("Precio: " + book.getPrice()); %> € </h2>
                <form action='FrontControllerServlet'>
                    <input type='hidden' value='AddToCartCommand' name='command'>
                    <input type='hidden' value='<% out.print(book.getIsbn());%>' name='bookIsbn'>
                    <input type='submit' value='Añadir al carrito'>
                </form><br>
            </div>
                    <% } %>
        </div>
        
    </body>
</html>
