<%@page import="entity.Client"%>
<%@page import="util.ShoppingCart"%>
<%@page import="javax.ejb.EJB"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Book"%>
<%@page import="entity.Reservation"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/menu.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Reserva hecha</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class='container-fluid'>
            <div class='row'>
                <div class='col-lg-8 col-lg-offset-2'>
                    <h1>Se ha realizado la reserva correctamente.</h1>
                    <h3>Libros reservados: </h3>
                </div>
            </div>
            <div class='row'>
                <div class='col-lg-8 col-lg-offset-4'>
                    <%
                    if (session.getAttribute("session") != null) {   %>
                        <% List <Reservation> reservationList = (List) session.getAttribute("userReservations");
                            if (reservationList !=  null || reservationList.size() > 0) {
                                for (Reservation reservation : reservationList){ %>
                            <div class='reservations wrapper'>
                                <p> <% out.print(reservation.getBook()); %> </p>
                                <p> <% out.print(reservation.getUsername()); %> </p>
                            </div>
                                <% } %>
                            <% }
                    } else {  %>
                    <h1>Inicie sesión para realizar una reserva</h1>
                    <% } %>
                </div>
            </div>
        </div>
        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src="js/menu.js"></script>
    </body>
</html>
