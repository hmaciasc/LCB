<%--
    Document   : indexView
    Created on : 12-mar-2016, 19:15:41
    Author     : maxi
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
        <title>Nuestros Productos</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class='container-fluid'>
            <div class='container row-fluid center-block'>
                <% books = (ArrayList) session.getAttribute("books");
                    if (books !=  null && !books.isEmpty()) {
                        for (Book book : books){
                %>
                <div class='col-lg-4'>
                    <div class='book'>
                        <form action='FrontControllerServlet' method='POST' role='form'>
                            <input type='hidden' value="ShowBookDetailsCommand" name="command"/>
                            <input type='hidden' value='<% out.print(book.getIsbn()); %>' name='isbnDetails'/>
                            <input type="image" src="covers/<% out.print(book.getTitle()+".jpg"); %>" onerror="this.src='images/inf.gif'" class="img-responsive center-block" width="250" height="400"/>
                            <div class="row" style="margin-top: 10px;">
                                <div class="col-sm-6 bookDescription center-block">
                                    <p> <% out.print(book.getTitle()); %> </p>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6 bookDescription center-block">
                                    <p> <% out.print(book.getDiscountPrice()); %> €</p>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                    <% } %>
                <% } %>
                <div class='row'>
                    <div class='col-lg-12'>
                        <% String numberOfBooks = String.valueOf(session.getAttribute("bookCount"));
                           Double bookCount = Double.parseDouble(numberOfBooks); %>
                        <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                            <input type="hidden" value="HomeCommand" name="command" />
                            <input type="hidden" value="booksView.jsp" name="view" />
                            <div class='text-center'>
                                <ul class='pagination'>
                                    <li><input type='submit' class='btn btn-default' value='1' name='pageNumber'/></li>
                                    <% for (int i = 2; i <= (int) Math.ceil(bookCount / 6); i++){ %>
                                    <li><input type='submit' class='btn btn-default' value='<% out.print(i); %>' name='pageNumber'/></li>
                                    <% } %>
                                </ul>
                            </div>
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
