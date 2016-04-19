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
            
            String discountName = request.getParameter("discountName2");
            
            discounts = DBConnection.find(discountName);
            
            if (discounts != null){
                DBConnection.remove(discounts);
            }
            
            forward("/FrontControllerServlet?command=HomeCommand");
        } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(RemoveDiscountDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
