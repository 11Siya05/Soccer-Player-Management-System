/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.ejb.bl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import za.ac.tut.model.entities.Contract;

/**
 *
 * @author siyam
 */
@Stateless
public class ContractFacade extends AbstractFacade<Contract> implements ContractFacadeLocal {

    @PersistenceContext(unitName = "SoccerPlayersManagementSystemEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ContractFacade() {
        super(Contract.class);
    }
    
}
