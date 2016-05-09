<%-- 
    Document   : shoppingListView
    Created on : 18-abr-2016, 13:13:21
    Author     : Soraya
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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

        <div class='container-fluid'>
            <div class="row" style="margin-top: 30px;">
                <div class='col-lg-6 col-lg-offset-3'>
                    <h2>Mis compras</h2>
                    <% List<Integer> idList = (ArrayList) session.getAttribute("idShopping"); %>
                    <% if (idList.size() == 0) { %>
                        <div class="row"><p> No ha realizado compras </p></div>
                    <%  } else { %>
                    <div class="table-responsive row" style="margin-top: 20px;">
                        <table class="table table-sm">
                            <thead class="thead-inverse">
                                <tr>
                                    <th class="text-center">Compra</th>
                                    <th class="text-center">Fecha de la compra</th>
                                </tr>
                            </thead>
                            <tbody>
                            <% Date today = (Date) session.getAttribute("dateShopping");
                                SimpleDateFormat formatter;
                                formatter = new SimpleDateFormat("dd.MM.yy"); %>
                            <%
                            for (Integer id : idList) {%>

                                <tr>
                                    <td>
                                        <div class="text-center">
                                            <form action='FrontControllerServlet' class='form-inline' role='form'>
                                                <input type='hidden' value='ShowShoppingCommand' name='command'/>
                                                <input type='hidden' value='<% out.print(id); %>' name='id'/>
                                                <button type='submit' class='btn btn-danger'>Ver Compra</button>
                                            </form>
                                        </div>
                                    </td>
                                    <td class="text-center"><h4><% out.println(formatter.format(today)); %></h4></td>
                                    
                                </tr>
                            <%}%>
                            </tbody>
                        </table>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
    </body>
</html>
