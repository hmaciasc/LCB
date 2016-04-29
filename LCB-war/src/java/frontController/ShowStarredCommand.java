package frontController;

import controller.BookFacadeLocal;
import controller.StarredFacadeLocal;
import entity.Book;
import entity.Client;
import entity.Starred;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class ShowStarredCommand extends FrontCommand{

    @Override
    public void process() {
            
        try {
            HttpSession session = request.getSession(true);
            StarredFacadeLocal starreds = InitialContext.doLookup("java:global/LCB/LCB-ejb/StarredFacade");
            BookFacadeLocal books = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookFacade");
            List<Book> bookList = new LinkedList();
            for (Starred starred : starreds.findAll()) {
                if (starred.getMail().equals((Client) session.getAttribute("client"))) {
                    List<Integer> starredList = (List<Integer>) starred.getStarred();
                    for (Integer id : starredList) {
                        bookList.add(books.find(id));
                    }
                }
                    
            }
            if (bookList.isEmpty()) {
                session.setAttribute("error", "No has marcado ningún favorito aún.");
                forward("/errorView.jsp");
            }else{
                session.setAttribute("starredBooks", bookList);
                forward("/starredView.jsp");
            }
            } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(ShowStarredCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}