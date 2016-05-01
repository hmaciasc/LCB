<%-- 
    Document   : searchView
    Created on : 13-mar-2016, 14:53:49
    Author     : javi
--%>

<%@page import="entity.Client"%>
<%@page import="util.ShoppingCart"%>
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
        <title>Resultados de la búsqueda</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class='container row-fluid center-block'>
            <% books = (ArrayList) session.getAttribute("searchResult");
                if (books !=  null && !books.isEmpty()) {
                    for (Book book : books){
            %>
            <div class='col-lg-4'>
                <div class='book'>
                    <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                        <input type='hidden' value='ShowBookDetailsCommand' name='command'>
                        <input type='hidden' value='<% out.print(book.getIsbn());%>' name='isbnDetails'>
                        <input type="image" src="covers/<% out.print(book.getTitle()+".jpg"); %>" onerror="this.src='images/inf.gif'" class="img-responsive center-block" alt="<% out.print(book.getTitle()); %>">
                    </form><br>
                    <h4><% out.print(book.getTitle()); %></h4>
                </div>
            </div>
                <% } %>
            <% } %>
        </div>
        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src="js/menu.js"></script>
    </body>
</html>
