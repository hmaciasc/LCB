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
import javax.servlet.RequestDispatcher;
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
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        ArrayList<Book> cartBooks = (ArrayList) cart.getCart();
        request.setAttribute("cartBooks", cartBooks);
        
        try {
            forward("/shoppingCartView.jsp");
        } catch (ServletException ex) {
            Logger.getLogger(ShowCartCommand.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ShowCartCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
