<%-- 
    Document   : modifyUserView
    Created on : 19-abr-2016, 19:33:14
    Author     : javi
--%>

<%@page import="util.StatisticsBean"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="entity.Client"%>
<%@page import="util.ShoppingCart"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Modificar usuario</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class='container-fluid'>
            <br>
            <div class='container row-fluid center-block'>
                <% ArrayList<Client> clients = (ArrayList) session.getAttribute("modClient");
                    if (clients !=  null && !clients.isEmpty()) {
                        for (Client clientAdmin : clients){
                %>
                <div class='col-lg-4 col-lg-offset-4'>
                    <h1>Usuario: <% out.print(clientAdmin.getMail()); %></h1>
                    
                    <div class='clientAdmin'>
                        <form action='FrontControllerServlet' method='post' class='form-horizontal' role='form'>
                            <input type='hidden' value='ModifyUserCommand' name='command'>
                            <label for="name">Nombre: </label>
                            <input class='form-control' type='text' name='name'>
                            <label for="lastname">Apellidos: </label>
                            <input class='form-control' type='text' name='lastname'>
                            <label for="password">Contraseña: </label>
                            <input class='form-control' type='text' name='password'>
                            <label for="address1">Dirección 1: </label>
                            <input class='form-control' type='text' name='address1'>
                            <label for="address2">Dirección 2: </label>
                            <input class='form-control' type='text' name='address2'>
                            <label for="admin">Administrador: </label>
                            <input class='form-control' type='text' name='admin'><br>
                            <button type='submit' class='btn btn-danger'>Modificar usuario</button>
                        </form><br>
                    </div>
                </div>
                <% } %>
                    <% } %>
            </div>
        </div>
        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src="js/menu.js"></script>
    </body>
</html>

