/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package frontController;

import java.io.IOException;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

/**
 *
 * @author javi
 */
public class LogOutCommand extends FrontCommand {

    @Override
    public void process() {
        HttpSession session = request.getSession();
        Enumeration e = session.getAttributeNames();
        while (e.hasMoreElements()) {
            String name = (String) e.nextElement();
            if(!name.equals("books"))
                session.setAttribute(name, null);
        }
        try {
            forward("/FrontControllerServlet?command=HomeCommand");
        } catch (ServletException | IOException ex) {
            Logger.getLogger(LogOutCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
