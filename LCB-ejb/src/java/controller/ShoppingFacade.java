/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Shopping;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Soraya
 */
@Stateless
public class ShoppingFacade extends AbstractFacade<Shopping> implements ShoppingFacadeLocal {

    @PersistenceContext(unitName = "LCB-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ShoppingFacade() {
        super(Shopping.class);
    }
    
}
