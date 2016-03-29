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
            Categoría<input type='text' name='category'><br>
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
        
        <%--<form action='FrontControllerServlet'>
            <table>
                <% for(int i=0; i<10; i++){ %>
                    <tr>
                        <td>Libro: </td>
                        <td>Autor: </td>
                        <td>Editorial:</td>
                        <td>Año de publicación:</td>
                        <td>Precio:</td>
                        <td>Nº de ejemplares:</td>
                        <td>ISBN:</td>
                        <td><input type='submit' name='eliminar' value='Eliminar'></td>
                    </tr>
                <%}%>
            </table>
            <input type='hidden' name='command' value='ModifyInDataBaseCommand'>
        </form>--%>
        
        
        
        
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
