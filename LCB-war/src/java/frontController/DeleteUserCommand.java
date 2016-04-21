package frontController;

import controller.ClientFacadeLocal;
import entity.Client;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class DeleteUserCommand extends FrontCommand {

    @Override
    public void process() {
        try {
            HttpSession session = request.getSession();
            Client sessionClient = getClient(session);
            if(sessionClient == null || sessionClient.getIsadmin() == 0){
                session.setAttribute("error", "Inicia sesión como administrador para ver esta página.");
                forward("/errorView.jsp");
            }
            
            ClientFacadeLocal clients = InitialContext.doLookup("java:global/LCB/LCB-ejb/ClientFacade");
            Client client = clients.find(request.getParameter("deleteClientEmail"));
            if(client != null){
                clients.remove(client);
            }else{
                session.setAttribute("error", "El cliente no existe.");
                forward("/errorView.jsp");
            }
            forward("/userManagementView.jsp");
        } catch (ServletException | IOException | NamingException ex) {
            Logger.getLogger(DeleteUserCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private Client getClient(HttpSession session) {
        return (Client) session.getAttribute("client");
    }
    
    
    
}
