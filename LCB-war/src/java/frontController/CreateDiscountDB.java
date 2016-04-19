package frontController;

import controller.DiscountFacadeLocal;
import entity.Discount;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;

public class CreateDiscountDB extends FrontCommand{

    @Override
    public void process() {
        try {
            DiscountFacadeLocal DBConnection = InitialContext.doLookup("java:global/LCB/LCB-ejb/DiscountFacade");
            Discount discounts = new Discount();
            Discount find;
            
            String discountName = request.getParameter("discountName");
            String discount = request.getParameter("discount");
            
            if (discountName != null && discount != null){
                discounts.setDiscountname(discountName);
                discounts.setDiscount(Integer.parseInt(discount));
                
                find = DBConnection.find(discountName);
                System.out.println("hola");
                if (find == null){
                    DBConnection.create(discounts);
                }
            }
            
            forward("/FrontControllerServlet?command=HomeCommand");
            
        } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(CreateDiscountDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
}
