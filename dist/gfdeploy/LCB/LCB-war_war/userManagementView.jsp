<%-- 
    Document   : userManagementView
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
        <title>User Management</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class='container-fluid'>
            <div class='container row-fluid center-block'>
                <h1>Usuarios</h1>
                <% ArrayList<Client> clients = (ArrayList) session.getAttribute("allClients");
                    if (clients !=  null && !clients.isEmpty()) {
                        for (Client clienta : clients){
                %>
                <div class='col-lg-4'>
                    <div class='client'>
                        <p>Correo: <% out.print(clienta.getMail()); %> </p>
                        <p>Nombre: <%out.print(clienta.getName()); %> </p>
                        <p> Tipo de cuenta: 
                            <% 
                                if(clienta.getIsadmin() == 0){
                                    out.print("Usuario normal");
                                }else{
                                    out.print("Administrador");    
                                }
                            %>
                        </p>
                        <form action='FrontControllerServlet' method='post' class='form-horizontal' role='form'>
                            <input type='hidden' value='UserManagementCommand' name='command'>
                            <input type='hidden' value='<% out.print(clienta.getMail());%>' name='clientEmail'>
                            <button type='submit' class='btn btn-danger'>Editar usuario</button>
                        </form>
                        <form action='FrontControllerServlet' method='post' class='form-horizontal' role='form'>
                            <input type='hidden' value='DeleteUserCommand' name='command'>
                            <input type='hidden' value='<% out.print(clienta.getMail());%>' name='deleteClientEmail'>
                            <button type='submit' class='btn btn-danger'>Eliminar usuario</button>
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

