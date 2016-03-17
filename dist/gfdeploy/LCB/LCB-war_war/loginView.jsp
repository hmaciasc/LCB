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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LCB - Login System</title>
    </head>
    <body>
        <div class='button'>
            <h1><a href='FrontControllerServlet'> Leaky Cauldron Bookstore</a></h1>
        </div>
        <% 
            if(session.getAttribute("session") == null){
                out.print("Error en la autentificación.");
            }else{ %>
                <h1>Bienvenido <%=session.getAttribute("session")%>!</h1>
            <% } %>
            <a href='FrontControllerServlet'>Volver a la página principal</a>
    </body>
</html>
