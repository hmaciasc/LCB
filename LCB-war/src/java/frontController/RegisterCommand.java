/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hmaci
 */
public class RegisterCommand extends FrontCommand{

    @Override
    public void process() {
        try {
            ClientFacadeLocal clients = InitialContext.doLookup("java:global/LCB/LCB-ejb/ClientFacade");
            HttpSession session = request.getSession();
            ArrayList<Client> list = new ArrayList<>();
            if (checkParameters(request)) {
                String user = request.getParameter("user");
                Client client = clients.find(user);
                if(client == null){
                    Client newClient = createClient();
                    clients.create(newClient);
                    list.add(newClient);
                    session.setAttribute("session", request.getParameter("user"));
                    session.setAttribute("client", newClient);
                    request.setAttribute("clients", list);
                    forward("/loginView.jsp");
                }else{
                    session.setAttribute("error", "El usuario ya existe.");
                    forward("/errorView.jsp");
                }
            }else{
                session.setAttribute("error", "Error al autentificarse.");
                forward("/errorView.jsp");
            }
        } catch (NamingException ex) {
            System.out.println("NOPE");
        } catch (ServletException | IOException ex) {
        Logger.getLogger(LoginCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private Client createClient() throws NumberFormatException {
        Client newClient = new Client();
        newClient.setMail(request.getParameter("user"));
        newClient.setName(request.getParameter("name"));
        newClient.setLastname(request.getParameter("lastname"));
        newClient.setPassword(request.getParameter("password1"));
        newClient.setAddress1(request.getParameter("address1"));
        newClient.setAddress2(request.getParameter("address2"));
        newClient.setIsadmin(Integer.parseInt("0"));
        return newClient;
    }

    private boolean checkParameters(HttpServletRequest request) {
        String email = request.getParameter("user");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        if (password1.equals(password2) && email != null) {
            return true;
        }
        return false;
    }
    
}
