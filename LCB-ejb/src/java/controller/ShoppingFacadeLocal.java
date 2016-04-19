/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Shopping;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Soraya
 */
@Local
public interface ShoppingFacadeLocal {

    void create(Shopping shopping);

    void edit(Shopping shopping);

    void remove(Shopping shopping);

    Shopping find(Object id);

    List<Shopping> findAll();

    List<Shopping> findRange(int[] range);

    int count();
    
}
