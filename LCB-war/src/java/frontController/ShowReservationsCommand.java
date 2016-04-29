package frontController;

import controller.ReservationFacadeLocal;
import entity.Reservation;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class ShowReservationsCommand extends FrontCommand{
    
    private List <Reservation> userReservationList;
    private ReservationFacadeLocal reservations;

    @Override
    public void process() {
        HttpSession session = request.getSession();
        try {
            reservations = InitialContext.doLookup("java:global/LCB/LCB-ejb/ReservationFacade!controller.ReservationFacadeLocal");
            String user = (String) session.getAttribute("session");
            userReservationList = new ArrayList<>();
            List <Reservation> allReservations = (List) reservations.findAll();
            if (allReservations.isEmpty()) {
                session.setAttribute("error", "No has reservado nada aún");
                forward("/errorView.jsp");
            }else{
                for (Reservation reservation : allReservations) {
                    if (reservation.getUsername().equals(user)) {
                        userReservationList.add(reservation);
                    }
                }
                if (userReservationList.isEmpty()) {
                    session.setAttribute("error", "No has reservado nada aún");
                    forward("/errorView.jsp");
                }
                request.setAttribute("userReservations", userReservationList);
                forward("/reservationsView.jsp");
            }
        } catch (ServletException | IOException | NamingException ex) {
            Logger.getLogger(ShowReservationsCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
