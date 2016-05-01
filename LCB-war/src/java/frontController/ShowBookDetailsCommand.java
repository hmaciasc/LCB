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
            String title = request.getParameter("title");
            Book book;
            ArrayList<Book> list = new ArrayList<>();
            if (isbn != null) {
                book = DBConnection.find(Integer.parseInt(isbn));
                list.add(book);
            }else if (title != null){
                for (Book singleBook : DBConnection.findAll()) {
                    if (singleBook.getTitle().equals(title)) {
                        list.add(singleBook);
                        break;
                    }
                }
            }
            request.setAttribute("bookDetails", list);
            
            forward("/bookDetailsView.jsp");
        } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(ShowBookDetailsCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
    
}