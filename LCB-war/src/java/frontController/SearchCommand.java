/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package frontController;

//import NewServlet;
import controller.BookFacadeLocal;
import entity.Book;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

/**
 *
 * @author javi
 */
public class SearchCommand extends FrontCommand {

    @Override
    public void process() {
        try {
            //BookFacadeLocal books = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookFacade");
            List<Book> list = new ArrayList<>();
            HttpSession session = request.getSession();

            EntityManagerFactory emf = Persistence.createEntityManagerFactory("LCB-ejbPU");
            EntityManager em = emf.createEntityManager();
            
            String search = getParameter("search").toLowerCase();
            String query = "SELECT b FROM Book b WHERE LOWER(b."+getTypeOfSearch()+") LIKE :search";
            List<Book> searchList = em.createQuery(query).setParameter("search", "%"+search+"%").getResultList();
            if(!searchList.isEmpty()){
                for (Book book : searchList) {
                    list.add(book);
                }
                session.setAttribute("searchResult", list);
                forward("/searchView.jsp");
            }else{
                session.setAttribute("searchResult", null);
                forward("/searchView.jsp");
            }
        } catch (ServletException | IOException ex) {
            Logger.getLogger(SearchCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private String getTypeOfSearch(){
        if(getParameter("select").equals("0")){
            return "title";
        }else if(getParameter("select").equals("1")){
            return "author";
        }else if(getParameter("select").equals("2")){
            return "category";
        }else{
            return "invalid";
        }
    }

    private String getParameter(String parameter) {
        return request.getParameter(parameter);
    }
    
}
