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
        <title>Pago via Paypal</title>
    </head>
    <body>
        <h1>Pago</h1>
        <div class='headerWrapper'>
            <% ShoppingCart cart = (ShoppingCart) session.getAttribute("cart"); %>
            <a> Carrito: <% out.print(cart.getCart().size()); %> productos</a>
            <div class='priceWrapper'>
                <h2> Total a pagar: <% out.print(cart.getCost()); %> €</h2>
            </div>
        </div>
        
        <div class='paymentInfoWrapper'>
            <form action='FrontControllerServlet'>
                <% //session.setAttribute("cart", null); %>
                <input type='hidden' value='ShoppingCommand' name='command'> <!-- Mejor enviarlo a shoppingCommand-->
                <p> Nº Tarjeta:  </p><input type='email' name='email'>
                <p> Caducidad:  </p><input type='email' name='email'>
                <p> CVV2: </p><input type='password' name='password'><br>
                <br><input type='submit' value='Realizar pago'>
            </form>
        </div>
        
    </body>
</html>
