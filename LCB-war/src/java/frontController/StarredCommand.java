package frontController;

import controller.StarredFacadeLocal;
import entity.Client;
import entity.Starred;
import java.io.IOException;
import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class StarredCommand extends FrontCommand{

    @Override
    public void process() {
        try {
            HttpSession session = request.getSession(true);
            Integer bookIsbn = Integer.parseInt(request.getParameter("bookIsbn"));
            StarredFacadeLocal starreds = InitialContext.doLookup("java:global/LCB/LCB-ejb/StarredFacade");
            List<Integer> starredList = (List<Integer>) session.getAttribute("starredList");
            Integer starredID = -1;
            for (int i = 0; i < starreds.findAll().size(); i++) {
                if(starreds.findAll().get(i).getMail().getMail().equals(session.getAttribute("session"))){
                    starredID = starreds.findAll().get(i).getId();
                    break;
                }
            }
            if(starredID == -1){
                if(starredList.isEmpty()){
                    starredList.add(bookIsbn);
                }else{
                    if(starredList.lastIndexOf(bookIsbn) == -1){
                        starredList.add(bookIsbn);
                    }
                }
                Starred starredCreation = createStarred(session, starredList);
                starreds.create(starredCreation);
                session.setAttribute("starredList", starredList);
            }else{
                LinkedList<Starred> allStarredList = new LinkedList<>();
                for (Starred starred : starreds.findAll()) {
                    allStarredList.add(starred);
                }
                
                for (int i = 0; i < allStarredList.size(); i++) {
                    if(allStarredList.get(i).getMail().getMail().equals(session.getAttribute("session"))){
                        Starred starred = allStarredList.get(i);
                        List<Integer> list = (List<Integer>) starred.getStarred();
                        if(list.lastIndexOf(bookIsbn) == -1){
                            list.add(bookIsbn);
                        }
                        starred.setStarred((Serializable) list);
                        session.setAttribute("starredList", list);
                        starreds.edit(starred);
                    }
                }
                
            }

            forward("/booksView.jsp");
        } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(StarredCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private Starred createStarred(HttpSession session, List<Integer> starredList) {
        Starred starred = new Starred();
        starred.setMail((Client) session.getAttribute("client"));
        starred.setStarred((Serializable) starredList);
        return starred;
    }
    
}
