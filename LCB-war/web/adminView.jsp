<%-- 
    Document   : adminView
    Created on : 15-mar-2016, 11:34:29
    Author     : Famïa
--%>

<%@page import="entity.Discount"%>
<%@page import="util.StatisticsBean"%>
<%@page import="javax.naming.InitialContext"%>
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
        <title>LCB Admin Panel</title>
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
            <div class='row'>
                <div class='col-lg-4 col-lg-offset-2'>
                    <h2>Añadir libro</h2>
                    <form action ='FrontControllerServlet' class='form-horizontal' role='form'>
                        <label for='title'>Título</label> 
                        <input class='form-control' type='text' name='title'><br>
                        <label for='author'>Autor</label> 
                        <input class='form-control' type='text' name='author'><br>
                        <label for='publisher'>Editorial</label> 
                        <input class='form-control' type='text' name='publisher'><br>
                        <label for='publishYear'>Año de publicación</label> 
                        <input class='form-control' type='text' name='publishYear'><br>
                        <label for='price'>Precio</label> 
                        <input class='form-control' type='text' name='price'><br>
                        <label for='copies'>Ejemplares</label> 
                        <input class='form-control' type='text' name='copies'><br>
                        <label for='isbn1'>ISBN</label> 
                        <input class='form-control' type='text' name='isbn1'><br>
                        <label for='category'>Categoria</label> 
                        <input class='form-control' type='text' name='category'><br>
                        <input type='hidden' name='command' value='AddToDataBaseCommand'><br>
                        <button class='btn btn-default' type='submit' name='button' value='Añadir Libro'>Añadir</button><br>
                    </form>
                </div>
                <div class='col-lg-4'>
                    <h2>Modificar Campo de libro</h2>
                    <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                        <label for='isbn3'>Inserte el ISBN del libro que quiere modificar:</label>
                        <input class='form-control' type='Text' name='isbn3'><br>
                        <label for='Titulo'>Titulo:</label>
                        <input  class='form-control' type='Text' name='title1'><br>
                        <label for='author1'>Autor: </label>
                        <input  class='form-control' type='Text' name='author1'><br>
                        <label for='publisher1'>Editorial:</label>
                        <input  class='form-control' type='Text' name='publisher1'><br>
                        <label for='publishYear1'>Año de publicación:</label>
                        <input  class='form-control' type='Text' name='publishYear1'><br>
                        <label for='price1'>Precio:</label>
                        <input  class='form-control' type='Text' name='price1'><br>
                        <label for='copy1'>Número de ejemplares:</label>
                        <input  class='form-control' type='Text' name='copy1'><br>
                        <label for='category1'>Categoria:</label>
                        <input  class='form-control' type='Text' name='category1'><br>

                        <input type='hidden' name='command' value='ModifyInDataBaseCommand'>
                        <button type='submit'  class='btn btn-danger'>Modificar</button>
                    </form>
                </div>
            </div>
            <div class='row'>
                <div class='col-lg-10 col-lg-offset-1'>
                    <h2>Eliminar libro</h2>
                    <% ArrayList<Book> books = (ArrayList) session.getAttribute("books"); 
                        if (books !=  null && !books.isEmpty()) {
                            for (Book book : books){
                    %>

                        <p> <b>Título:</b> <% out.print(book.getTitle()); %>.
                        <b>Autor:</b> <% out.print(book.getAuthor()); %>.
                        <b>Editorial:</b> <% out.print(book.getPublisher()); %>.
                        <b>Año publicación:</b> <% out.print(book.getPublishyear()); %>.
                        <b>Nº ejemplares:</b> <% out.print(book.getCopy()); %>.
                        <b>Precio:</b> <% out.print(book.getPrice()); %> € .
                        <b>Categoría:</b> <% out.print(book.getCategory()); %>.
                        <b>ISBN:</b> <% out.print(book.getIsbn()); %>. 
                        <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                            <input type='hidden' value='RemoveFromDataBaseCommand' name='command'>
                            <input type='hidden' value='<% out.print(book.getIsbn());%>' name='isbn2'>
                            <button type='submit'  class='btn btn-danger'>Eliminar</button>
                        </form>

                            <% } %>
                        <% } %>
                </div>
            </div>
            
            <div class='row'>
                <div class='col-lg-10 col-lg-offset-1'>
                    <h2>Añadir Oferta Nueva</h2>   
                        <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                            <label for='discountName'>Nombre del descuento:</label> 
                            <input class='form-control' type='text' name='discountName'><br>
                            <label for='discount'>Descuento (en porcentaje):</label> 
                            <input class='form-control' type='text' name='discount'><br>
                        
                            <input type='hidden' value='CreateDiscountDB' name='command'>
                            <button type='submit'  class='btn btn-danger' name='button' value='Añadir Descuento'>Añadir Descuento</button><br>                                    
                        </form>
                    
                </div>
            </div>
            <div class='row'>
                <div class='col-lg-10 col-lg-offset-1'>
                    <h2>Eliminar Descuento</h2>
                    <% ArrayList<Discount> discounts = (ArrayList) session.getAttribute("discounts"); 
                        if (discounts !=  null && !discounts.isEmpty()) {
                            for (Discount discount : discounts){
                    %>

                        <p> <b>Nombre Descuento</b> <% out.print(discount.getDiscountname()); %>.
                        <b>Descuento:</b> <% out.print(discount.getDiscount()); %>.
                        <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                            <input type='hidden' value='RemoveDiscountDB' name='command'>
                            <input type='hidden' value='<% out.print(discount.getDiscountname());%>' name='discountName2'>
                            <button type='submit'  class='btn btn-danger'>Eliminar</button>
                        </form>

                            <% } %>
                        <% } %>
                </div>
            </div><br>
            <div class='row'>
                <div class='col-lg-10 col-lg-offset-1'>
                    <h2>Gestión de usuarios</h2>
                    <form name='user_management' action='FrontControllerServlet' class='form-horizontal' role='form' method='post'>
                        <input type='hidden' value='GetAllClientsCommand' name='command'>
                        <button type='submit' class='btn btn-danger'>Editar usuarios</button>
                    </form>
                </div>
            </div>
            <div class='row panel-footer'>
                <div class='col-lg-10 col-lg-offset-1'>
                    <h2><span class="glyphicon glyphicon-stats"></span> Estadísicas de la web</h2>
                    <% StatisticsBean stats = InitialContext.doLookup("java:global/LCB/LCB-ejb/StatisticsBean"); %>
                    <h4> Visitas: <% out.print(stats.getVisits()); %> </h4>
                    <h4> Usuarios registrados: <% out.print(stats.getRegisteredUsers()); %> </h4>
                    <h4> Libros disponibles: <% out.print(stats.getNumberOfBooks()); %> </h4>
                    <h4> Número de ejemplares totales: <%out.print(stats.getNumberOfBookCopies()); %></h4>
                </div>
            </div>
        </div>

    </body>
</html>
