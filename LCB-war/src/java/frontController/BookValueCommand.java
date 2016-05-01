package frontController;

import controller.BookFacadeLocal;
import controller.BookValuesFacadeLocal;
import entity.Book;
import entity.BookValues;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class BookValueCommand extends FrontCommand {

    private String userMail;
    private int bookIsbn;
    private int value;
    private BookFacadeLocal books;
    private BookValuesFacadeLocal bookValues;
    
    @Override
    public void process() {
        try {
            books = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookFacade");
            bookValues = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookValuesFacade!controller.BookValuesFacadeLocal");
        } catch (NamingException ex) {
            Logger.getLogger(BookValueCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        userMail = (String) request.getParameter("clientMail");
        bookIsbn = Integer.parseInt(request.getParameter("bookIsbn"));
        try {
            if (request.getParameter("bookValue") == null) {
                HttpSession session = request.getSession(false);
                session.setAttribute("error", "No has seleccionado una puntuación");
                forward("/errorView.jsp");
            }else{
                value = Integer.parseInt(request.getParameter("bookValue"));
                addBookValue();
                forward("/FrontControllerServlet?command=HomeCommand");
            }
        } catch (ServletException | IOException ex) {
            Logger.getLogger(BookValueCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }
    
    public void addBookValue () {
        BookValues bookValue = new BookValues(userMail, bookIsbn);
        bookValue.setValue(value);
        bookValues.edit(bookValue);
        
        int valuesSum = 0;
        int nValues = 0;
        List<BookValues> values = bookValues.findAll();
        for (BookValues value1 : values) {
            if (value1.getBookValuesPK().getBookisbn() == bookIsbn) {
                valuesSum += value1.getValue();
                nValues ++;
            } 
        }
        int media = valuesSum / nValues;
        
        Book book = books.find(bookIsbn);
        book.setUsersvalue(media);
        books.edit(book);
    }
    
}
