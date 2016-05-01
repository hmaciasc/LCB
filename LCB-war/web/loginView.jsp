<%-- 
    Document   : loginView
    Created on : 14-mar-2016, 9:07:43
    Author     : javi
--%>

<%@page import="util.ShoppingCart"%>
<%@page import="entity.Book"%>
<%@page import="entity.Client"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/menu.css" rel="stylesheet">
        <link href="css/login.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>LCB - Login</title>
    </head>
    <body>
         <%@include file="menu.jsp" %>
         <div class="container">
            <div class="row">
                <div class="col-sm-4 center-block">
                    <div class="wrap">
                        <p class="form-title">
                            Inicie Sesión
                        </p>
                        <form method="post" class="login form-horizontal" action='FrontControllerServlet' role='form'>
                            <input type='hidden' value='LoginCommand' name='command'>
                            <input class='form-control' type='email' name='user' placeholder="Usuario">
                            <input class='form-control' type='password' name='password' placeholder="Contraseña">
                            <input type="submit" value="Entrar" class="btn btn-danger btn-sm" />
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src='js/login.js'></script>
        <script src="js/menu.js"></script>
    </body>
</html>
