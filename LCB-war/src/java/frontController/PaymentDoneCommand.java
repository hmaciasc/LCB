/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package frontController;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import util.ShoppingCart;

/**
 *
 * @author maxi
 */
public class PaymentDoneCommand extends FrontCommand{

    @Override
    public void process() {
        try {
            HttpSession session = request.getSession();
            ShoppingCart cart;
            cart = new ShoppingCart();
            //cart.initialize();
            session.setAttribute("cart", cart);
            request.setAttribute("paidMessage", "Pedido pagado satisfactoriamente");
            forward("/indexView.jsp");
        } catch (ServletException | IOException ex) {
            Logger.getLogger(PaymentDoneCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
