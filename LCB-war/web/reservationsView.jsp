<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.jasper.tagplugins.jstl.ForEach"%>
<%@page import="entity.Reservation"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/custom.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/js/bootstrap.min.js"></script>
        <title>Reservas</title>
    </head>
    <body>
        <div class='container-fluid'>
            <div class='row'>
                <div>
                    <h1><a href='FrontControllerServlet'> Leaky Cauldron Bookstore</a></h1>
                </div>
            </div>
            
            <div class="row" style="margin-top: 30px;">
                <h2>Mis reservas</h2>
            </div>
    <%
        List <Reservation> userReservations = (List) request.getAttribute("userReservations");
        if (userReservations.size() == 0) { %>
        <div class="row"><p> No ha realizado reservas </p></div>
    <%  } else { %>
    <div class="table-responsive row" style="margin-top: 20px;">
            <table class="table table-sm">
                <thead class="thead-inverse">
                    <tr>
                        <th class="text-center">Título</th>
                        <th class="text-center">Fecha de reserva</th>
                    </tr>
                </thead>
                <tbody>
    <%      for (Reservation reservation : userReservations) { %>
            
<%              Date today = reservation.getReservationdate();
                SimpleDateFormat formatter;
                formatter = new SimpleDateFormat("dd.MM.yy"); %>
                <tr>
                    <td class="text-center"><% out.println(reservation.getBook()); %></td>
                    <td class="text-center"><% out.println(formatter.format(today)); %></td>
                </tr>
        <%  } %>
                </tbody>
            </table>
        </div>
    <%  } %>
        </div>
    </body>
</html>
