<%@page import="entity.Client"%>
<%@page import="entity.Book"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Ver Compra</title>
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
            <div class='container row-fluid center-block'>
                <% Client client = (Client)session.getAttribute("client");
                if (client != null) {
                        List<Book> bookList = (List<Book>) session.getAttribute("starredBooks");
                        for (Book book : bookList){%>
                            <div class='col-lg-4'>
                                <div class='book'>
                                    <img src="covers/<% out.print(book.getTitle()+".jpg"); %>" onerror="this.src='images/inf.gif'" class="img-thumbnail img-responsive">
                                    <p> <% out.print(book.getTitle()); %> </p>
                                    <p> <% out.print(book.getAuthor()); %> </p>
                                    <p> <% out.print(book.getPrice()); %> €</p>
                                </div>
                            </div>
                        
                        <% } 
                }%>
            </div>
        </div>
        
    </body>
</html>