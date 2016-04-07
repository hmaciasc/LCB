<%-- 
    Document   : loginView
    Created on : 14-mar-2016, 9:07:43
    Author     : javi
--%>

<%@page import="entity.Client"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>LCB - Login</title>
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
                <div class='col-lg-8 col-lg-offset-2'>
                    <% if(session.getAttribute("session") != null){ %>
                            <h1>Bienvenido <%=session.getAttribute("session")%>!</h1>
                    <% } %>
                    <a class='btn btn-default' href='FrontControllerServlet'>Volver a la página principal</a>
                </div>
            </div>
        </div>
    </body>
</html>
