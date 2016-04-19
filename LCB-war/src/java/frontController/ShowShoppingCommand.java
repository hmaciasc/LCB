package frontController;

import controller.ShoppingFacadeLocal;
import entity.Shopping;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class ShowShoppingCommand extends FrontCommand{

    @Override
    public void process() {
        try {
            HttpSession session = request.getSession(true);
            Integer id = Integer.parseInt(request.getParameter("id"));
            ShoppingFacadeLocal shoppings = InitialContext.doLookup("java:global/LCB/LCB-ejb/ShoppingFacade");
            Shopping shopping = shoppings.find(id);
            session.setAttribute("shopping", shopping);
            forward("/shoppingView.jsp");
        } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(ShowShoppingCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
