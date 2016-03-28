<%-- 
    Document   : adminView
    Created on : 15-mar-2016, 11:34:29
    Author     : Famïa
--%>

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
            <input type='hidden' name='command' value='AddToDataBaseCommand'><br>
            <input type='submit' name='button' value='Añadir Libro'><br>
        </form>
        
        <h2>Eliminar libro</h2>

        <form action='FrontControllerServlet'>
            Inserte el ISBN del libro que quiere eliminar: <input type='text' name='isbn2'>
            <input type='hidden' name='command' value='RemoveFromDataBaseCommand'>
            <input type='submit' name='button' value='Eliminar'><br>
        </form>
        
        <h2>Modificar Campo de libro</h2>
        
        <form action='FrontControllerServlet'>
            Modifique el campo que desea cambiar: 
            <%--<input type='Submit' name='title' value='Título'>
            <input type='Submit' name='author' value='Autor'>
            <input type='Submit' name='publisher' value='Editorial'>
            <input type='Submit' name='publishYear' value='Año de Publicación'>
            <input type='Submit' name='price' value='Precio'>
            <input type='Submit' name='isbn' value='ISBN'>
            <input type='Submit' name='copy' value='Numero de ejemplares'>--%>
            
            <input type='hidden' name='command' value='ModifyFromDataBaseCommand'>
            <input type='submit' name='button' value='Modificar'><br>
        </form>

    </body>
</html>
