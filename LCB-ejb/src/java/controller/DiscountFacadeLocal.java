/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Discount;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Famïa
 */
@Local
public interface DiscountFacadeLocal {

    void create(Discount discount);

    void edit(Discount discount);

    void remove(Discount discount);

    Discount find(Object id);

    List<Discount> findAll();

    List<Discount> findRange(int[] range);

    int count();
    
}
