/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.ejb.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.model.entities.Contract;

/**
 *
 * @author siyam
 */
@Local
public interface ContractFacadeLocal {

    void create(Contract contract);

    void edit(Contract contract);

    void remove(Contract contract);

    Contract find(Object id);

    List<Contract> findAll();

    List<Contract> findRange(int[] range);

    int count();
    
}
