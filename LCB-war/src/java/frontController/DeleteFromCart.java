package frontController;

import entity.Book;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import util.ShoppingCart;

public class DeleteFromCart extends FrontCommand {

    @Override
    public void process() {
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        String bookTitle = (String) request.getParameter("bookTitle");
        cart.removeFromCart(bookTitle);
        for (int i = 0; i < cart.getCart().size(); i++) {
            Book cartBook = cart.getCart().get(i);
            if(cart.getCart().get(i).getTitle().equals(bookTitle)){
                cartBook.setCopy(cartBook.getCopy() + 1);
            }
        }
        //session.setAttribute("cart", cart);
        try {
            //forward("/FrontControllerServlet?command=HomeCommand");
            //forward("/FrontControllerServlet?command=ShowCartCommand");
            forward("/shoppingCartView.jsp");
        } catch (ServletException | IOException ex) {
            Logger.getLogger(DeleteFromCart.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
