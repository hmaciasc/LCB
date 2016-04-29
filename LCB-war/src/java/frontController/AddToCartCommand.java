package frontController;

import controller.BookFacadeLocal;
import entity.Book;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import util.ShoppingCart;

/**
 *
 * @author maxi
 */
public class AddToCartCommand extends FrontCommand{


    @Override
    public void process() {

        try {
            BookFacadeLocal books;
            HttpSession session = request.getSession();
            if (session.getAttribute("client") == null) {
                session.setAttribute("error", "Debes estar logueado para añadir al carrito");
                forward("/errorView.jsp");
            }else{
                ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
                Integer isbn = Integer.parseInt(request.getParameter("bookIsbn"));
                String inputValue = request.getParameter("nCopies");
                int nCopies = 0;
                try  
                {  
                  nCopies = Integer.parseInt(inputValue);  
                }  
                catch(NumberFormatException nfe)  
                {  
                  nCopies = 1;  
                }
                books = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookFacade");

                Book bookDB = books.find(isbn);
                if(bookDB != null){
                    for (int j=0; j<nCopies; j++) {
                        if(cart.getCart().isEmpty() && nCopies == 1){
                            cart.addBookToCart(bookDB);
                        }else{
                            int index = -1;
                            for (int i = 0; i < cart.getCart().size(); i++) {
                                if(cart.getCart().get(i).getIsbn().equals(isbn)){
                                    index = i;
                                }
                            }
                            if(index == -1){
                                cart.addBookToCart(bookDB);
                            }else{
                                Book modBook = cart.getCart().get(index);
                                Book clonedBook = (Book) modBook.clone();
                                clonedBook.setCopy(modBook.getCopy() - 1);
                                if(clonedBook.getCopy() > 0)
                                    cart.addBookToCart(clonedBook);
                            }
                        }
                    }
                }
                forward("/indexView.jsp");
            }
        } catch (ServletException | IOException | NamingException | CloneNotSupportedException ex) {
            Logger.getLogger(AddToCartCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
