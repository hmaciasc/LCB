<%-- 
    Document   : shoppingCartView
    Created on : 13-mar-2016, 12:12:04
    Author     : maxi
--%>
<%@page import="entity.Client"%>
<%@page import="util.ShoppingCart"%>
<%@page import="controller.BookFacade"%>
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
        <title>Carrito de compra</title>
    </head>
    <body>
        <div class='button'>
            <h1><a href='FrontControllerServlet'> Leaky Cauldron Bookstore</a></h1>
        </div>
        <h1>Mi Carrito</h1>
        <div class='headerWrapper'>
            <div class='buttons'>
                <a href='FrontControllerServlet'> Página principal </a>
            </div>
            <div class='cart'>
                <% ShoppingCart cart = (ShoppingCart) session.getAttribute("cart"); %>
                <p> Carrito: <% out.print(cart.getCart().size()); %> productos</p>
            </div>
        </div>
        <div class='booksWrapper'>
            <% ArrayList<Book> books = (ArrayList) request.getAttribute("cartBooks"); 
                if (books !=  null || !books.isEmpty()) {
                    for (Book book : books){
            %>
            <div class='bookWrapper'>
                <p> <% out.print(book.getTitle()); %> </p>
                <p> <% out.print(book.getAuthor()); %> </p>
                <p> <% out.print(book.getCopy()); %> copias </p>
                <p> <% out.print(book.getPrice()); %> €</p>
                <form action="FrontControllerServlet">
                    <input type="hidden" name="command" value="DeleteFromCart" />
                    <input type="hidden" name="bookTitle" value="<%out.print(book.getTitle());%>" />
                    <input type="submit" value="eliminar" />
                </form>
            </div>
                        <% } %>
                    <% } %>
        </div>
        
        <div class='directionWrapper'>
            <h3> Elija la dirección de envío </h3>
            <form action='FrontControllerServlet'>
                <select name='directionSelector'>
                    <option value='Dir1' selected='selected'> 
                        <% 
                            Client client = (Client) session.getAttribute("client");
                            if (client == null) {
                                    out.print("Inicie sesión");
                            }else{
                            out.print(client.getAddress1()); %> </option>
                    <option value='Dir2'> <% out.print(client.getAddress2()); }%> </option>
                </select>
            </form>
        </div>
        
        <div class='priceWrapper'>
            <h3> Total a pagar: <% out.print(cart.getCost()); %> € </h3>
            <form action='FrontControllerServlet'>
                <select name='paySelector'>
                    <option value='Paypal' selected='selected'>Paypal</option>
                    <option value='Banco'>Tarjeta de Crédito/Débito</option>
                </select>
                <input type='hidden' value='PayCommand' name='command'>
                <input type='hidden' value='<% out.print(cart.getCost()); %>' name='price'>
                <input type='submit' value='Pagar'>
            </form>
        </div>
    </body>
</html>
