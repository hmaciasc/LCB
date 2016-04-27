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
import pdf.PdfHandler;
import util.ShoppingCart;

/**
 *
 * @author maxi
 */
public class PayCommand extends FrontCommand{

    @Override
    public void process() {
        try {
            String method = request.getParameter("paySelector");
            request.setAttribute("price", request.getAttribute("price"));
            
            HttpSession session = request.getSession();
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            PdfHandler pdf = new PdfHandler(cart);
            
            session.setAttribute("bill", pdf.getAbsolutePath());
            
            if (method.equals("Paypal")) {
                forward("/paypalPaymentView.jsp");
            } else {
                forward("/creditCardPaymentView.jsp");
            }
        } catch (ServletException | IOException ex) {
            Logger.getLogger(PayCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
