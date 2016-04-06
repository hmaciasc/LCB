/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import entity.Book;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author maxi
 */
@Local
public interface ShoppingCartLocal {
    
    public void initialize();
    public void addBookToCart(Book book);
    public void removeFromCart(String title);
    public List<Book> getCart();
    public void resetCart();
    public double getCost();
}
