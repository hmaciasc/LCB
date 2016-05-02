<%@page import="entity.Client"%>
<%@page import="util.ShoppingCart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Book"%>
<%@page import="entity.Reservation"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/menu.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width-device-width, initial-scale=1.0'>
        <title>Reservas</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class='container-fluid'>
            <div class="row" style="margin-top: 30px;">
                <div class='col-lg-6 col-lg-offset-3'>
                    <h2>Mis reservas</h2>
                    <% List <Reservation> userReservations = (List) request.getAttribute("userReservations");
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
                            <% for (Reservation reservation : userReservations) { %>

                            <% Date today = reservation.getReservationdate();
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
                    <% } %>
                </div>
            </div>
        </div>
        <script src='js/jquery.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src="js/menu.js"></script>
    </body>
</html>
