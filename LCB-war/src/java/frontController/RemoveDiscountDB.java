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

/**
 *
 * @author Famïa
 */
public class RemoveDiscountDB extends FrontCommand{

    @Override
    public void process() {
    
        try {
            DiscountFacadeLocal DBConnection = InitialContext.doLookup("java:global/LCB/LCB-ejb/DiscountFacade");
            Discount discounts;
            
            String id = request.getParameter("discountID");
            
            discounts = DBConnection.find(Integer.parseInt(id));
            
            if (discounts != null){
                try {
                    DBConnection.remove(discounts);
                } catch (Exception e) {
                    HttpSession session = request.getSession();
                    session.setAttribute("error", "No se puede eliminar el descuento porque está asociado a un libro");
                    forward("/errorView.jsp");
                }
            }
            
            forward("/FrontControllerServlet?command=HomeCommand");
        } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(RemoveDiscountDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
