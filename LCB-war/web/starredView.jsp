<%@page import="util.ShoppingCart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Client"%>
<%@page import="entity.Book"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/menu.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Ver Compra</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class='container-fluid'>
            <div class='container row-fluid center-block'>
                <% client = (Client)session.getAttribute("client");
                if (client != null) {
                        List<Book> bookList = (List<Book>) session.getAttribute("starredBooks");
                        for (Book book : bookList){%>
                            <div class='col-lg-4'>
                                <div class='book'>
                                    <form action='FrontControllerServlet' method='POST' role='form'>
                                        <input type='hidden' value='ShowBookDetailsCommand' name='command'/>
                                        <% active = 0; %>
                                        <input type='hidden' value='<% out.print(book.getIsbn()); %>' name='isbnDetails'/>
                                        <input type='image' src='covers/<% out.print((book.getTitle())+".jpg"); %>' class="center-block img-responsive" alt="<% out.print(book.getTitle()); %>">
                                    </form>
                                    <h4><% out.print(book.getTitle()); %></h4>
                                    <h4><% out.print(book.getAuthor()); %></h4>
                                </div>
                            </div>
                        
                        <% } 
                }%>
            </div>
        </div>
        
    </body>
</html>