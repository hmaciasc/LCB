package frontController;

import controller.BookFacadeLocal;
import entity.Book;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;

public class AddToDataBaseCommand extends FrontCommand {

    @Override
    public void process() {
        try {
            BookFacadeLocal DBConnection = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookFacade");

            Book book = new Book();
            Book find;
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String publisher = request.getParameter("publisher");
            String publishYear = request.getParameter("publishYear");
            String price = request.getParameter("price");
            String category = request.getParameter("category");
            int copy = 1;
            String isbn = request.getParameter("isbn1");

            if (title != null && author != null && publisher != null && price != null && category != null) {
                book.setTitle(title);
                book.setAuthor(author);
                book.setPublisher(publisher);
                book.setPublishyear(Integer.parseInt(publishYear));
                book.setPrice(Integer.parseInt(price));
                book.setCopy(copy);
                book.setIsbn(Integer.parseInt(isbn));
                book.setCategory(category);
                
                find = DBConnection.find(Integer.parseInt(isbn));
               
                if (find == null){
                    DBConnection.create(book);                    
                }
                
            }
            
            
            forward("/FrontControllerServlet?command=HomeCommand");
            
            
        } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(AddToDataBaseCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
