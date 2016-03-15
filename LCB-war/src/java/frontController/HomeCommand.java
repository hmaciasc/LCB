/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package frontController;

import controller.BookFacadeLocal;
import entity.Book;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import util.ShoppingCart;

/**
 *
 * @author maxi
 */
public class HomeCommand extends FrontCommand{
    
    
    @Override
    public void process() {
        try {
            BookFacadeLocal books;
            books = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookFacade");
            HttpSession session = request.getSession(true);
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            if (cart == null) {
                cart = new ShoppingCart();
                //cart.initialize();
                session.setAttribute("cart", cart);
            }

            List<Book> bookList = books.findAll();
            ArrayList<Book> list= new ArrayList<>();
            for (Book book : bookList) {
                list.add(book);
            }
            //request.setAttribute("books", list);
            session.setAttribute("books", list);
            
            forward("/indexView.jsp");
            } catch (ServletException | IOException | NamingException ex) {
                Logger.getLogger(HomeCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
