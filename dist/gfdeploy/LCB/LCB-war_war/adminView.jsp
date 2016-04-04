<%-- 
    Document   : adminView
    Created on : 15-mar-2016, 11:34:29
    Author     : Famïa
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entity.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Añadir libro</h2>
        <form action ='FrontControllerServlet'>
            Título <input type='text' name='title'><br>
            Autor <input type='text' name='author'><br>
            Editorial <input type='text' name='publisher'><br>
            Año de publicación<input type='text' name='publishYear'><br>
            Precio <input type='text' name='price'><br>
            ISBN<input type='text' name='isbn1'><br>
            Categoría<input type='text' name='category'><br>
            <input type='hidden' name='command' value='AddToDataBaseCommand'><br>
            <input type='submit' name='button' value='Añadir Libro'><br>
        </form>
        
        <h2>Eliminar libro</h2>

        <%--<form action='FrontControllerServlet'>
            Inserte el ISBN del libro que quiere eliminar: <input type='text' name='isbn2'>
            <input type='hidden' name='command' value='RemoveFromDataBaseCommand'>
            <input type='submit' name='button' value='Eliminar'><br>
        </form>--%>
        
        <div class='books'>
            <% ArrayList<Book> books = (ArrayList) session.getAttribute("books"); 
                if (books !=  null && !books.isEmpty()) {
                    for (Book book : books){
            %>
            <div class='book wrapper'>
                <p> <b>Título:</b> <% out.print(book.getTitle()); %>.
                <b>Autor:</b> <% out.print(book.getAuthor()); %>.
                <b>Editorial:</b> <% out.print(book.getPublisher()); %>.
                <b>Año publicación:</b> <% out.print(book.getPublishyear()); %>.
                <b>Nº ejemplares:</b> <% out.print(book.getCopy()); %>.
                <b>Precio:</b> <% out.print(book.getPrice()); %> € .
                <b>Categoría:</b> <% out.print(book.getCategory()); %>.
                <b>ISBN:</b> <% out.print(book.getIsbn()); %>. 
                <form action='FrontControllerServlet'>
                    <input type='hidden' value='RemoveFromDataBaseCommand' name='command'>
                    <input type='hidden' value='<% out.print(book.getIsbn());%>' name='isbn2'>
                    <input type='submit' value='Eliminar'>
                </form></p>
            </div>
                    <% } %>
                <% } %>
        </div>

        
        <h2>Modificar Campo de libro</h2>
        
        <form action='FrontControllerServlet'>
            Inserte el ISBN del libro que quiere modificar: <input type='text' name='isbn3'><br>
            Que campo que desea cambiar: <br>
            <input type='Text' name='title1' value='Título'><br>
            
            <input type='Text' name='author1' value='Autor'><br>
            
            <input type='Text' name='publisher1' value='Editorial'><br>
            
            <input type='Text' name='publishYear1' value='Año de Publicación'><br>
            
            <input type='Text' name='price1' value='Precio'><br>
            
            <input type='Text' name='copy1' value='Numero de ejemplares'><br>
            
            <input type='Text' name='category1' value='Categoría'><br>
            
            <input type='hidden' name='command' value='ModifyInDataBaseCommand'>
            <input type='submit' name='button' value='Modificar'><br>
        </form>

    </body>
</html>
