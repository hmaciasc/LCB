/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Discount;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Famïa
 */
@Stateless
public class DiscountFacade extends AbstractFacade<Discount> implements DiscountFacadeLocal {

    @PersistenceContext(unitName = "LCB-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DiscountFacade() {
        super(Discount.class);
    }
    
}
