package frontController;

import controller.ShoppingFacadeLocal;
import entity.Client;
import entity.Shopping;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class AddShoppingCommand extends FrontCommand{

    @Override
    public void process() {
        try {
            HttpSession session = request.getSession(true);
            ShoppingFacadeLocal shopping = InitialContext.doLookup("java:global/LCB/LCB-ejb/ShoppingFacade");
            List<Shopping> shoppingList = shopping.findAll();
            List<Integer> id = new ArrayList();
            for (Shopping shop : shoppingList) {
                Client client = (Client) session.getAttribute("client"); 
                if (client.getMail().equals(shop.getMail().getMail())) {
                    id.add(shop.getId());
                }
            }
            session.setAttribute("idShopping", id);
            forward("/shoppingListView.jsp");
        } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(AddShoppingCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
