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
                <% books = (ArrayList) request.getAttribute("bookDetails");
                    if (books !=  null && !books.isEmpty()) {
                        for (Book book : books){ %>
                <div class='col-lg-6'>
                    <div class='book'>
                        <img src="covers/<% out.print(book.getTitle()+".jpg"); %>" onerror="this.src='images/inf.gif'" class="img-responsive center-block">
                    </div>
                </div>
                <div class='col-lg-6'>
                    
                    <div class="row" style="margin-top: 30px;">
                            <div class="col-sm-6 tittles">
                                <h4>TÍTULO</h4>
                            </div>
                            <div class="col-sm-6 bookDescription">
                                <h4><% out.print(book.getTitle()); %></h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 tittles">
                                <h4>AUTOR</h4>
                            </div>
                            <div class="col-sm-6 bookDescription">
                                <h4><% out.print(book.getAuthor()); %></h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 tittles">
                                <h4>PRECIO</h4>
                            </div>
                            <div class="col-sm-6 bookDescription">
                                <h4><% out.print(book.getDiscountPrice()); %> €</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 tittles">
                                <h4>VALORACIÓN</h4>
                            </div>
                            <div class="col-sm-6 bookDescription">
                                <% if (book.getUsersvalue() == null) { %>
                                    <h4> <% out.print("Sin valorar"); %></h4>
                                <% } else { %>
                                   <h4><% out.print(book.getUsersvalue()); %></h4>
                                <% } %>
                            </div>
                        </div><br>
                        <% client = (Client)session.getAttribute("client");%>
                        
                        <% if (client != null) { %>
                        <div class='row center-block'>
                            <div class="col-sm-6">
                                <form action='FrontControllerServlet' method='post' class='form-horizontal' role='form'>
                                    <input type="hidden" value="BookValueCommand" name="command" />
                                    <input type="hidden" value='<% out.print(book.getIsbn()); %>' name="bookIsbn" />
                                    <input type="hidden" value="<% out.print(client.getMail()); %>" name='clientMail' />
                                    <div class="row">
                                        <div>
                                            <fieldset class="rating">
                                                <input type="submit" id="star5" name="bookValue" value="5" />
                                                <label for="star5">5 stars</label>
                                                <input type="submit" id="star4" name="bookValue" value="4" />
                                                <label for="star4">4 stars</label>
                                                <input type="submit" id="star3" name="bookValue" value="3" />
                                                <label for="star3">3 stars</label>
                                                <input type="submit" id="star2" name="bookValue" value="2" />
                                                <label for="star2">2 stars</label>
                                                <input type="submit" id="star1" name="bookValue" value="1" />
                                                <label for="star1">1 star</label>
                                            </fieldset>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-sm-6">
                                <div class='text-center'>
                                    <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                                        <input type="hidden" value="StarredCommand" name="command" />
                                        <input type="hidden" value='<% out.print(book.getIsbn()); %>' name="bookIsbn" />
                                        <button class="btn btn-danger btn-sm" type="submit"><span class='glyphicon glyphicon-heart'></span></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <% } %>
                        <br>
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
                </div> 
                    <% } %>
                <% } %>
                
            </div>
        </div>
        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src='js/bootstrap-formhelpers.js'></script>
    </body>
</html>
