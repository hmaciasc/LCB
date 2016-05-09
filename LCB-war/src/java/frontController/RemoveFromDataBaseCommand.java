package frontController;

import controller.BookFacadeLocal;
import entity.Book;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;

public class RemoveFromDataBaseCommand extends FrontCommand{

    @Override
    public void process() {
        
        try {
            BookFacadeLocal DBConnection = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookFacade");
            Book book;
            
            String isbn = request.getParameter("isbn2");
            
            book = DBConnection.find(Integer.parseInt(isbn));
            
            if (book != null){
                DBConnection.remove(book);
            }
            
            forward("/FrontControllerServlet?command=HomeCommand");
        
        } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(RemoveFromDataBaseCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
