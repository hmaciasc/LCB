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
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Carrito de compra</title>
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
                <div class='col-lg-3'>
                    <h1>Mi Carrito</h1>
                </div>
            </div>
            <div class='row headerWrapper'>
                <div class='col-lg-3 cart'>
                    <% ShoppingCart cart = (ShoppingCart) session.getAttribute("cart"); %>
                    <p> Carrito: <% out.print(cart.getCart().size()); %> productos</p>
                </div>
            </div>
            <div class='container row center-block'>
                <% ArrayList<Book> books = (ArrayList) session.getAttribute("cartBooks"); 
                    if (books !=  null || !books.isEmpty()) {
                        for (Book book : books){
                %>
                <div class='col-lg-4'>
                    <div class='book'>
                        <img src="covers/<% out.print(book.getTitle()+".jpg"); %>" onerror="this.src='images/inf.gif'" class="img-thumbnail img-responsive" width="304" height="236">
                        <p> <% out.print(book.getTitle()); %> </p>
                        <p> <% out.print(book.getAuthor()); %> </p>
                        <p> <% out.print(book.getCopy()); %> copias </p>
                        <p> <% out.print(book.getDiscountPrice()); %> €</p>
                        <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                            <input type="hidden" name="command" value="DeleteFromCart" />
                            <input type="hidden" name="bookTitle" value="<%out.print(book.getTitle());%>" />
                            <button type="submit" class='btn btn-danger'>Eliminar del carrito</button>
                        </form>
                    </div>
                </div>
                                <% } %>
                            <% } %>
            </div>
            <div class='row'>
                <div class='col-lg-4 col-lg-offset-4'>
                    <div class='priceWrapper'>
                        <% if (cart.getCart().size() > 0) { %>
                        <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                            <label for='directionSelector'>Elija dirección de envío</label>
                            <select name='directionSelector' class='form-control'>
                                <option value='Dir1' selected='selected'> 
                                    <% 
                                        Client client = (Client) session.getAttribute("client");
                                        if (client == null) {
                                                out.print("Inicie sesión");
                                        }else{
                                        out.print(client.getAddress1()); %> </option>
                                <option value='Dir2'> <% out.print(client.getAddress2()); }%> </option>
                            </select>
                            <input type='hidden' value='PayCommand' name='command'>
                            <input type='hidden' value='<% out.print(cart.getCost()); %>' name='price'>
                            <label for='paySelector'>Elija método de pago</label>
                            <select name='paySelector' class='form-control'>
                                <option value='Paypal' selected='selected'>Paypal</option>
                                <option value='Banco'>Tarjeta de Crédito/Débito</option>
                            </select><br>
                            <h3> Total a pagar: <% out.print(cart.getCost()); %> € </h3>
                            <button type='submit' class='btn btn-default'>Pagar</button>
                        </form>
                            <% } %>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
