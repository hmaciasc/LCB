/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package frontController;

import controller.DiscountFacadeLocal;
import entity.Discount;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
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
            HttpSession session = request.getSession();
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

            DiscountFacadeLocal DBConnectionD = InitialContext.doLookup("java:global/LCB/LCB-ejb/DiscountFacade");
            Discount discount = new Discount();

            String discountCode = request.getParameter("discountCode");
            Double price = Double.parseDouble(request.getParameter("price"));
            if(discountCode != null){
                discount = DBConnectionD.find(Integer.parseInt(discountCode));
                if(discount != null){
                    price = price - (price * discount.getDiscount()/100);
                    price = price*(java.lang.Math.pow(10, 2));
                    Long l = new Long(java.lang.Math.round(price));
                    price = l.doubleValue();
                    price = price/java.lang.Math.pow(10, 2);

                }
            }
            String method = request.getParameter("paySelector");
            session.setAttribute("price", price);

            PdfHandler pdf = new PdfHandler(cart, discount.getDiscount(), price);

            session.setAttribute("bill", pdf.getAbsolutePath());
            if (method.equals("Paypal")) {
                forward("/paypalPaymentView.jsp");
            } else {
                forward("/creditCardPaymentView.jsp");
            }
        } catch (ServletException | IOException | NamingException ex) {
            Logger.getLogger(PayCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
