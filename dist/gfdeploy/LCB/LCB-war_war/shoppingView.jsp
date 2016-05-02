<%-- 
    Document   : shoppingView
    Created on : 18-abr-2016, 13:51:06
    Author     : Soraya
--%>

<%@page import="entity.Client"%>
<%@page import="util.ShoppingCart"%>
<%@page import="javax.ejb.EJB"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Book"%>
<%@page import="util.ShoppingCart"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="entity.Shopping"%>
<%@page import="entity.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/menu.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Ver Compra</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class='container-fluid'>
            <div class='container row-fluid center-block'>
                <% client = (Client)session.getAttribute("client"); %>
                <% if (client != null) { %>
                <% Shopping shopping = (Shopping) session.getAttribute("shopping");
                    ShoppingCart cart = (ShoppingCart) shopping.getShopping();
                    for (Book book: cart.getCart()){ %>
                    <div class='col-lg-4'>
                        <div class='book'>
                            <img src="covers/<% out.print(book.getTitle()+".jpg"); %>" onerror="this.src='images/inf.gif'" class="center-block img-responsive">
                            <p> <% out.print(book.getTitle()); %> </p>
                            <p> <% out.print(book.getAuthor()); %> </p>
                            <p> <% out.print(book.getDiscountPrice()); %> €</p>
                        </div>
                    </div>
                <% } %>
            </div>
            <div class='row'>
                <div class='col-lg-2 center-block'>
                    <h4 class='text-center'>Precio total: <% out.print(cart.getCost()); %></h4>
                </div>
            </div>
                <% } %>
        </div>
        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src="js/menu.js"></script>
    </body>
</html>