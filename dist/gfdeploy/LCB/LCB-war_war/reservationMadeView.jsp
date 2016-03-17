<%@page import="java.util.List"%>
<%@page import="entity.Book"%>
<%@page import="entity.Reservation"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservation Made</title>
    </head>
    <body>
        <div class='button'>
            <h1><a href='FrontControllerServlet'> Leaky Cauldron Bookstore</a></h1>
        </div>
        <%
        if (session.getAttribute("session") != null) {   %>
            <h1>Se ha realizado la reserva correctamente.</h1>
            <p>Libros reservados: </p>
            <% 
                List <Reservation> reservationList = (List) session.getAttribute("userReservations");
                if (reservationList !=  null || reservationList.size() > 0) {
                    for (Reservation reservation : reservationList){
            %>
                <div class='reservations wrapper'>
                    <p> <% out.print(reservation.getBook()); %> </p>
                    <p> <% out.print(reservation.getUsername()); %> </p>
                </div>
            <%      }   %>
            <%  }
            
        } else {  %>
        <h1>Inicie sesión para realizar una reserva</h1>
        <%
        }
        %>
        
    </body>
</html>
