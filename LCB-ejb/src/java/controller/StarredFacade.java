/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Starred;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Soraya
 */
@Stateless
public class StarredFacade extends AbstractFacade<Starred> implements StarredFacadeLocal {

    @PersistenceContext(unitName = "LCB-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public StarredFacade() {
        super(Starred.class);
    }
    
}
