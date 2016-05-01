package frontController;

import controller.BookFacadeLocal;
import entity.Book;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;

/**
 *
 * @author Soraya
 */
public class ShowBookDetailsCommand extends FrontCommand{

    @Override
    public void process() {
        try {
            BookFacadeLocal DBConnection = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookFacade");
            String isbn = request.getParameter("isbnDetails");
            Book book = DBConnection.find(Integer.parseInt(isbn));
            ArrayList<Book> list = new ArrayList<>();
            list.add(book);
            request.setAttribute("bookDetails", list);
            
            forward("/bookDetailsView.jsp");
        } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(ShowBookDetailsCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
    
}