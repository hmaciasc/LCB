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
        <link href="./style.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Leaky Cauldron Bookstore!</title>
    </head>
    <body>
        <div class='button'>
            <h1><a href='FrontControllerServlet'> Leaky Cauldron Bookstore</a></h1>
        </div>
        <div class='register wrapper'>
            <% 
                if(session.getAttribute("session") == null){ 
            %>
                    <form action='FrontControllerServlet'>
                    <input type='hidden' value='RegisterCommand' name='command'>
                    E-Mail: <input class='search rounded' type='email' name='user'><br>
                    Password: <input class='search rounded' type='password' name='password1'><br>
                    Repetir Password: <input class='search rounded' type='password' name='password2'><br>
                    Nombre: (Opcional) <input class='search rounded' type='text' name='name'><br>
                    Apellido: (Opcional) <input class='search rounded' type='text' name='lastname'><br>
                    Dirección: <input class='search rounded' type='text' name='address1'><br>
                    Dirección: <input class='search rounded' type='text' name='address2'><br>
                    
                    <input type='submit' value='Entrar'>
                    </form>
                <% }else{ %>
                
                Usuario: <% out.print(session.getAttribute("session")); %>
                
            <% } %>
        </div>
    </body>
</html>

