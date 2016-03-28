<%-- 
    Document   : indexView
    Created on : 12-mar-2016, 19:15:41
    Author     : maxi
--%>

<%@page import="util.ShoppingCart"%>
<%@page import="javax.ejb.EJB"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="./style.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Leaky Cauldron Bookstore!</title>
    </head>
    <body>
        <div class='button'>
            <h1><a href='FrontControllerServlet'> Leaky Cauldron Bookstore</a></h1>
        </div>
        <div class='button'>
            <%
                if(session.getAttribute("session") == null){ 
            %>
                <h1><a href='registerView.jsp'> Regístrate!</a></h1>
            <% } %>
        </div>
        <div class='login wrapper'>
            <% 
                if(session.getAttribute("session") == null){ 
            %>
                    <form action='FrontControllerServlet'>
                    <input type='hidden' value='LoginCommand' name='command'>
                    E-Mail: <input class='search rounded' type='email' name='user'><br>
                    Password: <input class='search rounded' type='password' name='password'>
                    <input type='submit' value='Entrar'>
                    </form>
                <% }else{ %>
                
                Usuario: <% out.print(session.getAttribute("session")); %>
                
            <% } %>
        </div>
        <div class='search wrapper'>
            <form action='FrontControllerServlet'>
                <input type='hidden' value='SearchCommand' name='command'>
                Buscar: <input class='search rounded' type='text' name='search'>
                <select name="select">
                    <option selected="selected" value="0">Título</option>
                    <option value="1">Autor</option>
                    <option value="2">Categoría</option>
                </select>
                <input type='submit' value='Buscar'>
            </form>
        </div>
        <div class='header'>
            <div class='cart wrapper'>
                <% ShoppingCart cart = (ShoppingCart) session.getAttribute("cart"); %>
                <p> Carrito: <% out.print(cart.getCart().size()); %> productos</p>
                <form action='FrontControllerServlet'>
                    <input type='hidden' value='ShowCartCommand' name='command'>
                    <input type='submit' value='Ver Carrito'>
                </form>
            </div>
        </div>
        <div class='books'>
            <% ArrayList<Book> books = (ArrayList) session.getAttribute("books"); 
                if (books !=  null && !books.isEmpty()) {
                    for (Book book : books){
            %>
            <div class='book wrapper'>
                <p> <% out.print(book.getTitle()); %> </p>
                <p> <% out.print(book.getAuthor()); %> </p>
                <p> <% out.print(book.getCopy()); %> copias </p>
                <p> <% out.print(book.getPrice()); %> €</p>
                <p> <% out.print(book.getCategory()); %> </p>
                    <%  if (book.getCopy() <= 0) {   %>
                        <form action='FrontControllerServlet'>
                            <input type='hidden' value='ReserveBookCommand' name='command'>
                            <input type='hidden' value='<% out.print(book.getIsbn());%>' name='bookIsbn'>
                            <input type='submit' value='Reservar'>
                        </form><br>
                    <%  } else {   %>
                    <form action='FrontControllerServlet'>
                        <input type='hidden' value='AddToCartCommand' name='command'>
                        <input type='hidden' value='<% out.print(book.getIsbn());%>' name='bookIsbn'>
                        <input type='submit' value='Añadir al carrito'>
                    </form><br>
                    <% } %>
            </div>
                    <% } %>
                <% } %>
        </div>
    </body>
</html>
