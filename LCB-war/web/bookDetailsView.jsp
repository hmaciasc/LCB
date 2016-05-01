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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Nuestros Productos</title>
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
            
            </div>
            <div class='container row-fluid center-block'>
                <% ArrayList<Book> books = (ArrayList) request.getAttribute("bookDetails");
                    if (books !=  null && !books.isEmpty()) {
                        for (Book book : books){
                %>
                <div class='col-lg-6'>
                    <div class='book'>
                        <img src="covers/<% out.print(book.getTitle()+".jpg"); %>" onerror="this.src='images/inf.gif'" class="img-responsive center-block">
                        
                    </div>
                </div>
                <div class='col-lg-6'>
                    
                    <div class="row" style="margin-top: 30px;">
                            <div class="col-sm-6 tittles">
                                TÍTULO
                            </div>
                            <div class="col-sm-6 bookDescription">
                                <p> <% out.print(book.getTitle()); %> </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 tittles">
                                <p>AUTOR</p>
                            </div>
                            <div class="col-sm-6 bookDescription">
                                <p> <% out.print(book.getAuthor()); %> </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 tittles">
                                <p>PRECIO</p>
                            </div>
                            <div class="col-sm-6 bookDescription">
                                <p> <% out.print(book.getDiscountPrice()); %> €</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 tittles">
                                <p>VALORACIÓN</p>
                            </div>
                            <div class="col-sm-6 bookDescription">
                                <% if (book.getUsersvalue() == null) { %>
                                    <p> <% out.print("Sin valorar"); %> </p>
                                <% } else { %>
                                    <p> <% out.print(book.getUsersvalue()); %> </p>
                                <% } %>
                            </div>
                        </div>
                        <% Client client = (Client)session.getAttribute("client");%>
                        

                        <%  if (book.getCopy() <= 0) {   %>
                        <div class='row'>
                            <div class="col-sm-6">
                                <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                                    <input type='hidden' value='ReserveBookCommand' name='command'>
                                    <input type='hidden' value='<% out.print(book.getIsbn());%>' name='bookIsbn'>
                                    <button type='submit' class='btn btn-info'>Reservar</button>
                                </form><br>
                            </div>
                        </div>
                        <%  } else {   %>
                        <div class="row" style="margin-top: 10px;">
                            <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                                <input type='hidden' value='AddToCartCommand' name='command'>
                                <input type='hidden' value='<% out.print(book.getIsbn());%>' name='bookIsbn'>
                                    <div class="col-lg-5">
                                        <input type="text" class="form-control bfh-number" data-min="1" data-max="<% out.print(book.getCopy()); %>" data-wrap="true" name="nCopies">
                                    </div>
                                    <div class="col-lg-6 col-lg-offset-1">
                                        <button type='submit' class='btn btn-primary' style="width: 150px;">Añadir al carrito</button>
                                    </div>
                            </form>
                        </div><br>
                        <% } %>

                        <% if (client != null) { %>
                        <div class='row center-block'>
                            <div class="col-lg-1">
                                <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                                    <input type="hidden" value="StarredCommand" name="command" />
                                    <input type="hidden" value='<% out.print(book.getIsbn()); %>' name="bookIsbn" />
                                    <button class="btn btn-danger btn-sm" type="submit"><span class='glyphicon glyphicon-heart'></span></button>
                                </form>
                            </div>
                        </div><br>
                        <% } %>
                        
                        <% if (client != null) { %>
                        <div class='row center-block'>
                            <div class="col-sm-12">
                                <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                                    <input type="hidden" value="BookValueCommand" name="command" />
                                    <input type="hidden" value='<% out.print(book.getIsbn()); %>' name="bookIsbn" />
                                    <input type="hidden" value="<% out.print(client.getMail()); %>" name='clientMail' />
                                    <div class="row">
                                        <div>
                                            1 <input type="radio"  name="bookValue" value="1"/>
                                            2 <input type="radio"  name="bookValue" value="2"/>
                                            3 <input type="radio"  name="bookValue" value="3"/>
                                            4 <input type="radio"  name="bookValue" value="4"/>
                                            5 <input type="radio"  name="bookValue" value="5"/>

                                            <button class="btn btn-warning btn-sm" type="submit"><span class='glyphicon glyphicon-star'></span></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <% } %>
                </div> 
                    <% } %>
                <% } %>
                
            </div>
        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src='js/bootstrap-formhelpers.js'></script>
    </body>
</html>
