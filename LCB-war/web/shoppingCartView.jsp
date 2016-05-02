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
        <link href="css/menu.css" rel="stylesheet">
        <link href="css/cart.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Mi carrito</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class='container-fluid'>
            <div class='container row center-block'>
                <% ShoppingCart cart = (ShoppingCart) session.getAttribute("cart"); %>
                <% books = (ArrayList) session.getAttribute("cartBooks"); 
                    if (books !=  null || !books.isEmpty()) {
                        for (Book book : books){
                %>
                <div class='col-lg-4'>
                    <div class='book'>
                        <img src="covers/<% out.print(book.getTitle()+".jpg"); %>" onerror="this.src='images/inf.gif'" class="img-responsive center-block" width="304" height="236">
                        <p> <% out.print(book.getTitle()); %> </p>
                        <p> <% out.print(book.getAuthor()); %> </p>
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
            <div class='row container center-block'>
                <div class='col-lg-4 col-lg-offset-4 payment'>
                    <div class='priceWrapper'>
                        <% if (cart.getCart().size() > 0) { %>
                        <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                            <label for='directionSelector'>Elija dirección de envío</label>
                            <select name='directionSelector' class='form-control'>
                                <option value='Dir1' selected='selected'> 
                                    <% 
                                        client = (Client) session.getAttribute("client");
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
        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src="js/menu.js"></script>
    </body>
</html>
