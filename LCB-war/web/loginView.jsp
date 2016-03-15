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
        <h1>Customer list</h1>
        <%
            String email = (String) session.getAttribute("session");
            out.print("E-Mail: " + email + "<br>");
            ArrayList<Client> clients = (ArrayList) request.getAttribute("clients");
            for(Client client: clients){
                out.print("Cliente: " + client);
            }

        %>
    </body>
</html>
