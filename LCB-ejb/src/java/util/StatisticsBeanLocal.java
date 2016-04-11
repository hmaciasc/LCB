/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import javax.ejb.Local;

/**
 *
 * @author hmaci
 */
@Local
public interface StatisticsBeanLocal {
    
    public void startup();
    public int getVisits();
    public void addVisit();
    public int getRegisteredUsers();
    public void addRegisteredUser();
    public int getNumberOfBooks();
    public void setNumberOfBooks(int numberOfBooks);
}
