package frontController;

import controller.BookFacadeLocal;
import controller.ReservationFacadeLocal;
import entity.Book;
import entity.Reservation;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class ReserveBookCommand extends FrontCommand {
    
    private String user;
    private Book book;
    private ArrayList <Reservation> reservationList;
    private BookFacadeLocal books;
    private ReservationFacadeLocal reservations;
    
    @Override
    public void process() {
        HttpSession session = request.getSession();
        user = (String) session.getAttribute("session");
        initReservationListFromSession(session);
        
        try {
            books = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookFacade");
            reservations = InitialContext.doLookup("java:global/LCB/LCB-ejb/ReservationFacade!controller.ReservationFacadeLocal");
            initBookFromISBN();
            
            if (user != null) {
                addNewReservation();
            }
            
            session.setAttribute("reservations", reservationList);
            
            RequestDispatcher dispatcher = context.getRequestDispatcher("/reservationMadeView.jsp");
            dispatcher.forward(request, response);
        } catch (ServletException | IOException | NamingException ex) {
            Logger.getLogger(AddToCartCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void addNewReservation () {
        Reservation reservation = new Reservation(new Short("2"), user, book.getTitle(), new Date());
        reservations.create(reservation);
        reservationList.add(reservation);
    }
    
    private void initBookFromISBN () {
        Integer isbn = Integer.parseInt(request.getParameter("bookIsbn"));
        book = books.find(isbn);
    }
    
    private void initReservationListFromSession (HttpSession session) {
        reservationList = (ArrayList) session.getAttribute("reservations");
        if (reservationList == null) {
            reservationList = new ArrayList();
        }
    }
    
}
