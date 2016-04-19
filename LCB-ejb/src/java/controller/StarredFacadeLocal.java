/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Starred;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Soraya
 */
@Local
public interface StarredFacadeLocal {

    void create(Starred starred);

    void edit(Starred starred);

    void remove(Starred starred);

    Starred find(Object id);

    List<Starred> findAll();

    List<Starred> findRange(int[] range);

    int count();
    
}
