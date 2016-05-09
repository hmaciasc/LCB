/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package frontController;

import entity.Book;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import util.ShoppingCart;

/**
 *
 * @author maxi
 */
public class ShowCartCommand extends FrontCommand{

    @Override
    public void process() {
        try {
            HttpSession session = request.getSession();
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            ArrayList<Book> cartBooks = (ArrayList) cart.getCart();
            session.setAttribute("cartBooks", cartBooks);
            if (cart.getCart().isEmpty()) {
                session.setAttribute("error", "El carrito está vacío. Añada libros al carrito para comprar.");
                forward("/errorView.jsp");
            }else{
                forward("/shoppingCartView.jsp");
            }
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ShowCartCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
