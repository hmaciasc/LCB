<%-- 
    Document   : registerView
    Created on : 28-Mar-2016, 14:51:31
    Author     : hmaci
--%>

<%@page import="javax.ejb.EJB"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Welcome to Leaky Cauldron Bookstore!</title>
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
                <div class='col-lg-4 col-lg-offset-4 register wrapper'>
                    <% 
                        if(session.getAttribute("session") == null){ 
                    %>
                        <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                            <input type='hidden' value='RegisterCommand' name='command'>
                            <label for='email'>E-mail:*</label>
                            <input class='form-control' type='email' name='user' required><br>
                            <label for='password1'>Password:*</label>
                            <input class='form-control' type='password' name='password1' required><br>
                            <label for='password2'>Repetir password:*</label>
                            <input class='form-control' type='password' name='password2' required><br>
                            <label for='name'>Nombre:</label>
                            <input class='form-control' type='text' name='name'><br>
                            <label for='lastname'>Apellido:</label>
                            <input class='form-control' type='text' name='lastname'><br>
                            <label for='address1'>Dirección:*</label>
                            <input class='form-control' type='text' name='address1' required><br>
                            <label for='address2'>Dirección:</label>
                            <input class='form-control' type='text' name='address2'><br>

                            <button  type='submit' class='btn btn-default'>Registrarme</button>
                        </form>
                        <% }else{ %>

                        Usuario: <% out.print(session.getAttribute("session")); %>

                    <% } %>
                </div>
            </div>
        </div>
    </body>
</html>

