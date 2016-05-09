package frontController;

import entity.Book;
import entity.Client;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class ShowSuggestionsCommand extends FrontCommand {

    @Override
    public void process() {
        try {
            List<Book> list = new ArrayList<>();
            HttpSession session = request.getSession();

            EntityManagerFactory emf = Persistence.createEntityManagerFactory("LCB-ejbPU");
            EntityManager em = emf.createEntityManager();
            
            String query = "SELECT b FROM Book b WHERE b.usersvalue IS NOT NULL ORDER BY b.usersvalue DESC";
            List<Book> searchList = em.createQuery(query).getResultList();
            if(!searchList.isEmpty()){
                for (Book book : searchList) {
                    if(list.size() <= 10){
                       list.add(book); 
                    }
                }
                session.setAttribute("recomendations", list);
            }else{
                session.setAttribute("recomendations", null);
            }
            em.close();
            forward("/suggestionsView.jsp");
        } catch (ServletException | IOException ex) {
            Logger.getLogger(SearchCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }    
}