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

public class GetAllClientsCommand extends FrontCommand {

    @Override
    public void process() {
        try {
            HttpSession session = request.getSession();
            Client client = (Client) session.getAttribute("client");
            if(client == null || client.getIsadmin() == 0){
                session.setAttribute("error", "No tienes privilegios de administrador.");
                forward("/errorView.jsp");
            }else{
                ClientFacadeLocal clients = InitialContext.doLookup("java:global/LCB/LCB-ejb/ClientFacade");
                List<Client> clientList = clients.findAll();
                List<Client> list = new ArrayList<>();
                for (Client client1 : clientList) {
                    list.add(client1);
                }
                session.setAttribute("allClients", list);
                forward("/userManagementView.jsp");
            }
        } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(GetAllClientsCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    
    
    
}
