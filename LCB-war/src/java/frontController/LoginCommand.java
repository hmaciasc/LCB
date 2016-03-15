package frontController;

import controller.ClientFacadeLocal;
import entity.Client;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class LoginCommand extends FrontCommand {

    @Override
    public void process() {
        try {
            ClientFacadeLocal clients = InitialContext.doLookup("java:global/LCB/LCB-ejb/ClientFacade");
            HttpSession session = request.getSession();
            String user = request.getParameter("user");
            Client client = clients.find(user);
            ArrayList<Client> list = new ArrayList<>();
            if(client != null && request.getParameter("password").equals(client.getPassword())){
                list.add(client);
                session.setAttribute("session", client.getMail());
            }else{
                session.setAttribute("session", "Error al autentificarse.");
            }
            request.setAttribute("clients", list);
            forward("/loginView.jsp");
        } catch (NamingException ex) {
            System.out.println("NOPE");
        } catch (ServletException | IOException ex) {
        Logger.getLogger(LoginCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
