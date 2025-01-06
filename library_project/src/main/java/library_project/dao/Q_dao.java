package library_project.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import library_project.dto.Querys;

@Repository
public class Q_dao {
	
	EntityManager em=Persistence.createEntityManagerFactory("veeranji").createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	
	public void qsave(Querys q)
	{
		et.begin();
		em.persist(q);
		et.commit();
	}
	
	public List<Querys> qget()
	{
		Query q=em.createQuery("select a from Querys a");
		List<Querys> lq=q.getResultList();
		return lq;
	}

	public void updateSolution(int queryId, String solution) {
		et.begin();
	    Querys query = em.find(Querys.class, queryId);
	    if (query != null) {
	        query.setSolutionText(solution);
	        em.merge(query);
	        et.commit();
	    } else {
	        throw new IllegalArgumentException("Query with ID " + queryId + " not found.");
	    }
	}


}
