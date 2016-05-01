<%-- 
    Document   : registerView
    Created on : 28-Mar-2016, 14:51:31
    Author     : hmaci
--%>

<%@page import="javax.ejb.EJB"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/register.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Regístrate en LCB</title>
    </head>
    <body>
        <div class='container-fluid'>
            <div class='row'>
                    <% 
                        if(session.getAttribute("session") == null){ 
                    %>
                    
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-4 center-block centered-form">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
			    		<h3 class="panel-title">Regístrate</h3>
                                    </div>
                                    <div class="panel-body">
			    		<form action='FrontControllerServlet' method='POST' role="form">
                                            <input type='hidden' value='RegisterCommand' name='command'>
                                            <div class="form-group">
                                                <input type="email" name="user" id="email" class="form-control input-sm" placeholder="Email" required>
                                            </div>
                            
                                            <div class="form-group">
    		    				<input type="text" name="name" id="email" class="form-control input-sm" placeholder="Nombre">
                                            </div>
                            
                                            <div class="form-group">
        	    				<input type="text" name="lastname" id="email" class="form-control input-sm" placeholder="Apellido">
                                            </div>
                            
                                            <div class="form-group">
        	    				<input type="text" name="address1" id="email" class="form-control input-sm" placeholder="Dirección" required>
                                            </div>
                            
                                            <div class="form-group">
                				<input type="text" name="address2" id="email" class="form-control input-sm" placeholder="Dirección Alternativa">
                                            </div>

                                            <div class="row">
			    			<div class="col-xs-6 col-sm-6 col-md-6">
                                                    <div class="form-group">
                                                        <input type="password" name="password1" id="password" class="form-control input-sm" placeholder="Contraseña" required>
                                                    </div>
                                                </div>
			    			<div class="col-xs-6 col-sm-6 col-md-6">
                                                    <div class="form-group">
                                                        <input type="password" name="password2" id="password_confirmation" class="form-control input-sm" placeholder="Confirmar Contraseña" required>
                                                    </div>
                                                </div>
                                            </div>
			    			
                                            <input type="submit" value="REGISTRARSE" class="btn btn-danger btn-block">
			    		
			    		</form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        <% }else{ %>

                        Usuario: <% out.print(session.getAttribute("session")); %>

                    <% } %>
                </div>
            </div>
        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src="js/menu.js"></script>
        <script src="js/register.js"></script>
    </body>
</html>

