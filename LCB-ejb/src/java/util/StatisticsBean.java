/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import controller.BookFacadeLocal;
import controller.ClientFacadeLocal;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
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
    
    
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    @PostConstruct
    public void startup() {
        Logger.getLogger(StatisticsBean.class.getName()).log(Level.INFO, "Singleton PostConstruct!");
        try {
            ClientFacadeLocal clients =  InitialContext.doLookup("java:global/LCB/LCB-ejb/ClientFacade");
            registeredUsers = clients.count();
            BookFacadeLocal books = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookFacade");
            numberOfBooks = books.count();
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
    
    public void addRegisteredUser(){
        registeredUsers++;
    }

    public int getNumberOfBooks() {
        return numberOfBooks;
    }

    public void setNumberOfBooks(int numberOfBooks) {
        this.numberOfBooks = numberOfBooks;
    }
    
    
    
}
