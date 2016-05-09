package frontController;

import controller.BookFacadeLocal;
import controller.ShoppingFacadeLocal;
import entity.Book;
import entity.Client;
import entity.Shopping;
import java.io.IOException;
import java.io.Serializable;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
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
            for (Book book : cart.getCart()) {
                Book bookBD = books.find(book.getIsbn());
                if (bookBD.getIsbn() != null) {
                    bookBD.setCopy(bookBD.getCopy() - 1);
                    books.edit(bookBD);
                }
            }
            
            ShoppingFacadeLocal shopping = InitialContext.doLookup("java:global/LCB/LCB-ejb/ShoppingFacade");
            Shopping shop = createShopping(session);
            shopping.create(shop);
            cart.resetCart();
            forward("/FrontControllerServlet?command=HomeCommand");
        } catch (ServletException | IOException ex) {
            
        } catch (NamingException ex) {
            Logger.getLogger(ShoppingCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private Shopping createShopping(HttpSession session) {
        Shopping shopping = new Shopping();
        shopping.setId(null);
        shopping.setMail((Client) session.getAttribute("client"));
        shopping.setShopping((Serializable) session.getAttribute("cart"));
        shopping.setDate(new Date());
        return shopping;
    }
    
}
