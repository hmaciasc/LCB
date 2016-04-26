<%-- 
    Document   : errorView
    Created on : 21-abr-2016, 12:06:56
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
        <link href="css/bootstrap-formhelpers.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Mi Perfil</title>
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
                <div class='col-lg-12 center-block'>
                    <br>
                    <div class='center-block alert alert-success col-lg-4' role="alert">
                        <% Client client = (Client) session.getAttribute("client"); %>
                        <% if(client != null){ %>
                             Usuario: <% out.print(client.getMail()); %><br>
                             Nombre: <% out.print(client.getName()); %><br>
                             Apellido: <% out.print(client.getLastname()); %><br>
                             Dirección de envío 1: <% out.print(client.getAddress1()); %><br>
                             Dirección de envío 2:  <% out.print(client.getAddress2()); %><br>
                       <% } %>
                       <form method='post' action='FrontControllerServlet' class='form-horizontal' role='form'>
                            <input type='hidden' value='ModifyProfileCommand' name='command'>
                            <input type='hidden' value='<% client.getMail(); %>' name='email'>
                            <input type='submit' class='btn btn-warning' name='profile' value='Editar perdil'>
                       </form>
                    </div>
                </div>
            </div>
        </div>
        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src='js/bootstrap-formhelpers.js'></script>
    </body>
</html>