/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compte.gestion;

import compte.usage.CompteBancaire;
import java.util.Collection;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author DELL
 */
@Stateless
public class GestionBancaire {

    @PersistenceContext(unitName = "TP4PU")
    private EntityManager em;

    public void persist(Object object) {
        em.persist(object);
    }

    public void creerNouveauCompte(){
       creerCompte("Yede", "Fabienne", "15ml", 400);
   }
   
   public CompteBancaire creerCompte(String firstName, String lastName, String accountNumber, double balance){
       CompteBancaire c = new CompteBancaire(firstName, lastName, accountNumber, balance);
       em.persist(c);
       return c;
   }
   
   public Collection<CompteBancaire> getAllComptes(){
       Query q = em.createQuery("select c from CompteBancaire c");
       return q.getResultList();
   }
}
