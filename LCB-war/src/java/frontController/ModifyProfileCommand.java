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

public class ModifyProfileCommand extends FrontCommand {

    @Override
    public void process() {
        try {
            ClientFacadeLocal clients = InitialContext.doLookup("java:global/LCB/LCB-ejb/ClientFacade");
            HttpSession session = request.getSession();
            String userId = request.getParameter("clientEmail");
            String userName = request.getParameter("name");
            String lastName = request.getParameter("lastName");
            String address1 = request.getParameter("address1");
            String address2 = request.getParameter("address2");
            String password1 = request.getParameter("password1");
            String password2 = request.getParameter("password2");
            
            Client dbClient = clients.find(userId);
            
            if (dbClient == null || password1 == null || password2 == null || !password1.equals(password2)) {
                session.setAttribute("error", "Las contraseñas no coinciden");
                forward("/errorView.jsp");
            }else{
                if (!password1.isEmpty() && (!dbClient.getPassword().equals(password1))) {
                    dbClient.setPassword(password1);
                }
                if (!address1.isEmpty() && (!dbClient.getAddress1().equals(address1))) {
                    dbClient.setAddress1(address1);
                }
                if (!address2.isEmpty() && (!dbClient.getAddress2().equals(address2))) {
                    dbClient.setAddress2(address2);
                }
                if (!lastName.isEmpty() && (!dbClient.getLastname().equals(lastName))) {
                    dbClient.setLastname(lastName);
                }
                if(!userName.isEmpty() && (!dbClient.getName().equals(userName))){
                    dbClient.setName(userName);
                }
                clients.edit(dbClient);
                session.setAttribute("session", dbClient.getMail());
                session.setAttribute("client", dbClient);
            }
            forward("/profileView.jsp");
        } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(ModifyProfileCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    
}
