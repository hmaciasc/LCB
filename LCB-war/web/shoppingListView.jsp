<%-- 
    Document   : shoppingListView
    Created on : 18-abr-2016, 13:13:21
    Author     : Soraya
--%>

<%@page import="entity.Client"%>
<%@page import="util.ShoppingCart"%>
<%@page import="javax.ejb.EJB"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
        <title>Mis Compras</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class='row'>
            <div class='col-lg-3 col-lg-offset-5'>
                <h2>Mis compras</h2>
                <% client = (Client)session.getAttribute("client"); %>
                <% if (client != null) { %>

                    <% List <Integer> idList = (ArrayList) session.getAttribute("idShopping");
                    if (idList !=  null && !idList.isEmpty()) { 
                        int i=0;
                        for (Integer id : idList) {%>
                            <form action='FrontControllerServlet' class='form-inline' role='form'>
                            <input type='hidden' value='ShowShoppingCommand' name='command'>
                            <h4>Compra <% out.print(++i); %>: <input type='hidden' value='<% out.print(id); %>' name='id'>
                                <button type='submit' class='btn btn-default'>Ver Compra</button>
                            </h4>
                            </form>
                        <%}%>
                    <% } %>

                <% } %>
            </div>
        </div>
        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
    </body>
</html>
