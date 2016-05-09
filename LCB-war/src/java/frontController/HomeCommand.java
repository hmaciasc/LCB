/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package frontController;

import controller.BookFacadeLocal;
import controller.DiscountFacadeLocal;
import entity.Book;
import entity.Discount;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import util.ShoppingCart;
import util.StatisticsBean;

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
            DiscountFacadeLocal discounts = InitialContext.doLookup("java:global/LCB/LCB-ejb/DiscountFacade");
            HttpSession session = request.getSession(false);
            int page = 1;
            if (session == null) {
                StatisticsBean stats = InitialContext.doLookup("java:global/LCB/LCB-ejb/StatisticsBean");
                stats.addVisit();
                session = request.getSession(true);
                page = 1;
            }
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            if (cart == null) {
                cart = new ShoppingCart();
                session.setAttribute("cart", cart);
            }
            if (request.getParameter("pageNumber") != null) {
                page = Integer.parseInt(request.getParameter("pageNumber"));
            }
            session.setAttribute("bookCount", books.findAll().size());
            
            List<Integer> starred = (List<Integer>) session.getAttribute("starredList");
            if (starred == null) {
                starred = new LinkedList();
                session.setAttribute("starredList", starred);
            }

            List<Book> bookList = getBooks(books, page);
            ArrayList<Book> list= new ArrayList<>();
            for (Book book : bookList) {
                list.add(book);
            }
            
            session.setAttribute("books", list);
            List<Book> allBooks = books.findAll();
            list = new ArrayList<>();
            for (Book book : allBooks) {
                list.add(book);
            }
            session.setAttribute("allBooks", list);

            List<Discount> discountList = discounts.findAll();
            ArrayList<Discount> lista= new ArrayList<>();
            for (Discount discount : discountList) {
                lista.add(discount);
            }
            session.setAttribute("discounts", lista);

            session.setAttribute("error", "");
            if (request.getParameter("view") != null) {
                forward("/booksView.jsp");
            }else{
                forward("/indexView.jsp");
            }
            } catch (ServletException | IOException | NamingException ex) {
                Logger.getLogger(HomeCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private List<Book> getBooks(BookFacadeLocal books, int page) {
        int booksPerPage = 6;
        int range[] = {booksPerPage * (page - 1), booksPerPage * (page - 1) + booksPerPage - 1};
        return books.findRange(range);
    }
}
