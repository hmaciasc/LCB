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
        <title>Pago via Paypal</title>
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
                <div class='col-lg-4 col-lg-offset-4 paymentInfoWrapper'>
                    <h1>Pago</h1>
                    <div class='headerWrapper'>
                        <% ShoppingCart cart = (ShoppingCart) session.getAttribute("cart"); %>
                        <a> Carrito: <% out.print(cart.getCart().size()); %> productos</a>
                        <div class='priceWrapper'>
                            <h2> Total a pagar: <% out.print(cart.getCost()); %> €</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class='row'>
                <div class='col-lg-2 col-lg-offset-4'>
                    <% String path = (String) session.getAttribute("bill"); %>
                    <br><h4><a href='<% out.print(path); %>'>Dirección a la factura</a></h4>
                </div>
            </div>
            <div class='row'>
                <div class='col-lg-4 col-lg-offset-4 paymentInfoWrapper'>
                    <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                        <% //session.setAttribute("cart", null); %>
                        <input type='hidden' value='ShoppingCommand' name='command'> <!-- Mejor enviarlo a shoppingCommand-->
                        <label for='email'>Email:</label>
                        <input type='email' name='email' class='form-control'><br>
                        <label for='password'>Contraseña:</label>
                        <input type='text' name='password' class='form-control'><br>
                        <button type='submit' class='btn btn-default'>Realizar pago</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
