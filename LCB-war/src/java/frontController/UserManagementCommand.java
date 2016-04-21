package frontController;

import controller.ClientFacadeLocal;
import entity.Client;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class UserManagementCommand extends FrontCommand {

    @Override
    public void process() {
        try {
            HttpSession session = request.getSession();
            Client client = (Client) session.getAttribute("client");
            if(client == null || client.getIsadmin() == 0){
                try {
                    forward("/errorView.jsp");
                } catch (ServletException | IOException ex) {
                    Logger.getLogger(UserManagementCommand.class.getName()).log(Level.SEVERE, null, ex);
                }
            }else{
                ClientFacadeLocal clients = InitialContext.doLookup("java:global/LCB/LCB-ejb/ClientFacade");
                Client clientToModify = clients.find(request.getParameter("clientEmail"));
                List<Client> list = new ArrayList<>();
                list.add(clientToModify);
                session.setAttribute("modClient", list);
                forward("/FrontControllerServlet?command=GetAllClientsCommand");
            }
        } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(UserManagementCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
