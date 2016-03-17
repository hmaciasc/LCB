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
            BookFacadeLocal books = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookFacade");
            HttpSession session = request.getSession();
            List<Book> bookList = books.findAll();
            List<Book> list = new ArrayList<>();

            if (request.getParameter("select").equals("0")) {
                for (Book book : bookList) {
                    if (book.getTitle().equals(request.getParameter("search"))) {
                        list.add(book);
                    }
                }
            } else if (request.getParameter("select").equals("1")) {
                for (Book book : bookList) {
                    if (book.getAuthor().equals(request.getParameter("search"))) {
                        list.add(book);
                    }
                }
            }else{
                for (Book book : bookList) {
                    if (book.getCategory().equals(request.getParameter("search"))) {
                        list.add(book);
                    }
                }
            }
            session.setAttribute("searchResult", list);
            forward("/searchView.jsp");
        } catch (ServletException | IOException | NamingException ex) {
            Logger.getLogger(SearchCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
