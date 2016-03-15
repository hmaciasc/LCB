/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import entity.Book;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateful;

/**
 *
 * @author maxi
 */
@Stateful
public class ShoppingCart implements ShoppingCartLocal {

    private List<Book> bookList;
    private double cost;

    public ShoppingCart() {
        initialize();
    }
    
    
    
    @Override
    public void initialize() {
        this.bookList = new ArrayList<Book>();
        this.cost = 0.0;
    }

    @Override
    public void addBoookToCart(Book book) {
        bookList.add(book);
        System.out.println("PRECIO: "+ book.getPrice());
        System.out.println("Tamaño: " + bookList.size());
        cost += (double) book.getPrice();
    }

    @Override
    public void removeFromCart(String title) {
        for (Book book : bookList) {
            if (book.getTitle().equals(title)) {
                bookList.remove(book);
                cost -= (double) book.getPrice();
            }
        }
    }

    @Override
    public List<Book> getCart() {
        return bookList;
    }

    @Override
    public void resetCart() {
        bookList = new ArrayList<>();
    }

    @Override
    public double getCost() {
        return cost;
    }
}
