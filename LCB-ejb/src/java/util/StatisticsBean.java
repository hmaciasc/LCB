/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import controller.BookFacadeLocal;
import controller.BookValuesFacadeLocal;
import controller.ClientFacadeLocal;
import controller.ShoppingFacadeLocal;
import entity.Book;
import entity.BookValues;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.Schedule;
import javax.ejb.Singleton;
import javax.ejb.Startup;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author hmaci
 */
@Singleton
@Startup
public class StatisticsBean {

    private int visits = 0;
    private int registeredUsers;
    private int numberOfBooks;
    private int numberOfBookCopies = 0;
    private int selloutsCounter = 0;
    private int rating = 0;
    
    @PostConstruct
    @Schedule(second="*/10", minute="*", hour="*")
    public void startup() {
        Logger.getLogger(StatisticsBean.class.getName()).log(Level.INFO, "Singleton PostConstruct!");
        try {
            ClientFacadeLocal clients =  InitialContext.doLookup("java:global/LCB/LCB-ejb/ClientFacade");
            registeredUsers = clients.count();
            BookFacadeLocal books = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookFacade");
            numberOfBooks = books.count();
            numberOfBookCopies = getNumberOfCopies(books);
            ShoppingFacadeLocal sellouts = InitialContext.doLookup("java:global/LCB/LCB-ejb/ShoppingFacade!controller.ShoppingFacadeLocal");
            selloutsCounter = sellouts.count();
            BookValuesFacadeLocal ratings = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookValuesFacade!controller.BookValuesFacadeLocal");
            rating = ratings.count();
        } catch (NamingException ex) {
            Logger.getLogger(StatisticsBean.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getVisits(){
        return visits;
    }
    
    public void addVisit(){
        visits++;
    }

    public int getRegisteredUsers(){
        return registeredUsers;
    }

    public int getNumberOfBooks() {
        return numberOfBooks;
    }
    
    public int getNumberOfBookCopies() {
        return numberOfBookCopies;
    }

    private int getNumberOfCopies(BookFacadeLocal books) {
        int copies = 0;
        List<Book> bookList = books.findAll();
        for (Book book : bookList) {
            copies += book.getCopy();
        }
        return copies;
    }

    public int getSelloutsCounter() {
        return selloutsCounter;
    }

    public int getRating() {
        return rating;
    }
    
    
}
