/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package frontController;

import controller.BookFacadeLocal;
import entity.Book;
import java.io.IOException;
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
public class AddToCartCommand extends FrontCommand{
    
    
    @Override
    public void process() {
        
        try {
            BookFacadeLocal books;
            HttpSession session = request.getSession();
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            Integer isbn = Integer.parseInt(request.getParameter("bookIsbn"));
            books = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookFacade");
            List<Book> bookList = books.findAll();
            
            for (Book book : bookList) {
                if (book.getIsbn().equals(isbn)) {
                    cart.addBoookToCart(book);
                    //session.setAttribute("cart", cart);
                }
            }
            //forward("/NewServlet");
            forward("/indexView.jsp");
        } catch (ServletException | IOException | NamingException ex) {
            Logger.getLogger(AddToCartCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
