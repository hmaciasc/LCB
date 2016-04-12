/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.BookValues;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author noe_s_000
 */
@Local
public interface BookValuesFacadeLocal {

    void create(BookValues bookValues);

    void edit(BookValues bookValues);

    void remove(BookValues bookValues);

    BookValues find(Object id);

    List<BookValues> findAll();

    List<BookValues> findRange(int[] range);

    int count();
    
}
