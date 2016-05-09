package frontController;

import controller.BookFacadeLocal;
import controller.DiscountFacadeLocal;
import entity.Book;
import entity.Discount;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class AddToDataBaseCommand extends FrontCommand {

    @Override
    public void process() {
        try {
            BookFacadeLocal DBConnection = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookFacade");
            DiscountFacadeLocal DBConnectionD = InitialContext.doLookup("java:global/LCB/LCB-ejb/DiscountFacade");

            Book book = new Book();
            Book find;
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String publisher = request.getParameter("publisher");
            String publishYear = request.getParameter("publishYear");
            String copies = request.getParameter("copies");
            String price = request.getParameter("price");
            String category = request.getParameter("category");
            String isbn = request.getParameter("isbn1");
            Integer noDiscount = 1;
            Discount findDiscount = DBConnectionD.find(noDiscount);
            if (title != null && author != null && publisher != null && price != null && category != null) {
                book.setTitle(title);
                book.setAuthor(author);
                book.setPublisher(publisher);
                book.setPublishyear(Integer.parseInt(publishYear));
                book.setPrice(Integer.parseInt(price));
                book.setDiscountPrice(Double.parseDouble(price));
                book.setCopy(Integer.parseInt(copies));
                book.setIsbn(Integer.parseInt(isbn));
                book.setCategory(category);
                book.setDiscountId(findDiscount);
                
                find = DBConnection.find(Integer.parseInt(isbn));
               
                if (find == null){
                    DBConnection.create(book);                    
                    forward("/FrontControllerServlet?command=HomeCommand");
                }else{
                    HttpSession session = request.getSession(false);
                    session.setAttribute("error", "Ya existe ese libro");
                    forward("/errorView.jsp");
                }
                
            }
            
            
            
            
        } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(AddToDataBaseCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
