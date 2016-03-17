package frontController;

import controller.BookFacadeLocal;
import entity.Book;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import util.ShoppingCart;

public class ShoppingCommand extends FrontCommand {

    @Override
    public void process() {
        try {
            HttpSession session = request.getSession(true);
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            BookFacadeLocal books = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookFacade");
            List<Book> bookList = books.findAll();
            
            for (Book book : cart.getCart()) {
                for (Book bookBD : bookList) {
                    if (bookBD.getIsbn() == book.getIsbn()) {
                        Book newBook = book;
                        newBook.setCopy(book.getCopy() - 1);
                        books.edit(newBook);
                    }
                }
            }
            
            cart.resetCart();

            //RequestDispatcher dispatcher = context.getRequestDispatcher("/paypalPaymentView.jsp");
            forward("/FrontControllerServlet?command=HomeCommand");
        } catch (ServletException | IOException ex) {
            
        } catch (NamingException ex) {
            Logger.getLogger(ShoppingCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
