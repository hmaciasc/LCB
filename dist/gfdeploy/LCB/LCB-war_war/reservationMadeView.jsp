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
        <h1>Se ha realizado la reserva correctamente.</h1>
        <p>Libros reservados: </p>
        <% 
            ArrayList <Reservation> reservationList = (ArrayList) session.getAttribute("reservations");
            if (reservationList !=  null || reservationList.size() > 0) {
                for (Reservation reservation : reservationList){
        %>
            <div class='reservations wrapper'>
                <p> <% out.print(reservation.getBook()); %> </p>
                <p> <% out.print(reservation.getUsername()); %> </p>
            </div>
        <%      }   %>
        <%  }else { %>
        <p>No hay listado de reservas</p>
        <%  }       %>
    </body>
</html>
