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

public class ModifyUserCommand extends FrontCommand {

    @Override
    public void process() {
        try {
            HttpSession session = request.getSession();
            Client client = (Client) session.getAttribute("client");
            if(client == null || client.getIsadmin() == 0){
                try {
                    forward("/errorView.jsp");
                } catch (ServletException | IOException ex) {
                    Logger.getLogger(ModifyUserCommand.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            ClientFacadeLocal clients = InitialContext.doLookup("java:global/LCB/LCB-ejb/ClientFacade");
            Client clientToModify = getClient(session);
            clients.edit(clientToModify);
            forward("/userManagementView.jsp");
        } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(ModifyUserCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private Client getClient(HttpSession session) {
        Client client = new Client();
        Client originalClient = getClient(session, "modClient");
        client.setMail(originalClient.getMail());
        if(!getRequest("address1").equals("noChange")){ 
            client.setAddress1(getRequest("address1"));
        }else{
            client.setAddress1(originalClient.getAddress1());
        }
        
        if(!getRequest("address2").equals("noChange")){ 
            client.setAddress2(getRequest("address2"));
        }else{
            client.setAddress2(originalClient.getAddress2());
        }
        
        if(!getRequest("name").equals("noChange")){ 
            client.setName(getRequest("name"));
        }else{
            client.setName(originalClient.getName());
        }
        
        if(!getRequest("lastname").equals("noChange")){ 
            client.setLastname(getRequest("lastname"));
        }else{
            client.setLastname(originalClient.getLastname());
        }
        
        if(!getRequest("password").equals("noChange")){
            client.setPassword(getRequest("password"));
        }else{
            client.setPassword(getClient(session, "modClient").getPassword());
        }
        
        if(!getRequest("admin").equals("noChange")){
            client.setIsadmin(Integer.parseInt(getRequest("admin")));
        }else{
            client.setIsadmin(originalClient.getIsadmin());
        }
        System.out.println("CLIENT: "+ client);
        return client;
    }

    private String getRequest(String parameter) {
        String value = request.getParameter(parameter);
        if(value.isEmpty())
            return "noChange";
        return value;
    }

    private Client getClient(HttpSession session, String parameter) {
        List<Client> list = (ArrayList) session.getAttribute(parameter);
        return list.get(0);
    }
}
