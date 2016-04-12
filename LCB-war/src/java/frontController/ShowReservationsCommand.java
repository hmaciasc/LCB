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
        if (session.getAttribute("userReservations") == null) {
            try {
                reservations = InitialContext.doLookup("java:global/LCB/LCB-ejb/ReservationFacade!controller.ReservationFacadeLocal");
            } catch (NamingException ex) {
                Logger.getLogger(ShowReservationsCommand.class.getName()).log(Level.SEVERE, null, ex);
            }
            initUserReservationList(session);
        } else {
            userReservationList = (List) session.getAttribute("userReservations");
        }
        request.setAttribute("userReservations", userReservationList);
        try {
            forward("/reservationsView.jsp");
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ShowReservationsCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void initUserReservationList (HttpSession session) {
        String user = (String) session.getAttribute("session");
        userReservationList = new ArrayList<>();
        List <Reservation> allReservations = (List) reservations.findAll();
        for (Reservation reservation : allReservations) {
            if (reservation.getUsername().equals(user)) {
                userReservationList.add(reservation);
            }
        }
    }
}
