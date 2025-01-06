package library_project.dao;

import java.util.List; 

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import library_project.dto.Book;
import library_project.dto.Borrower_data;
import library_project.dto.L_dto;
import library_project.dto.S_dto;
import library_project.repository.L_repository;
@Repository
public class L_dao implements L_repository{

	EntityManager em=Persistence.createEntityManagerFactory("veeranji").createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	@Override
	public L_dto save(L_dto ld) {
		et.begin();
		em.persist(ld);
		et.commit();
		return ld;
	}

	@Override
	public String login(L_dto ld) {
		    try {
		        Query q = em.createQuery("select a from L_dto a where email = ?1");
		        q.setParameter(1, ld.getEmail());
		        L_dto l = (L_dto) q.getSingleResult();
		        if (l.getPwd().equals(ld.getPwd())) {
		            return "success";
		        } else {
		            return "password incorrect";
		        }
		    } catch (javax.persistence.NoResultException e) {
		        return "email incorrect";
		    }

		
	}

	@Override
	public L_dto fetch(String email) {
		try {
	        Query q = em.createQuery("select a from L_dto a where email = ?1");
	        q.setParameter(1, email);
	        L_dto l = (L_dto) q.getSingleResult();
	        if(l!=null)
	        {
	        	return l;
	        }
	        
	    } catch (javax.persistence.NoResultException e) {
	    	return null;
	        
	    }
		return null;

	}

	@Override
	public String delete(String email) {
		try {
			Query q = em.createQuery("select a from L_dto a where email = ?1");
	        q.setParameter(1, email);
	        L_dto l = (L_dto) q.getSingleResult();
	        if(l!=null)
	        {
	        	et.begin();
	        	em.remove(l);
	        	et.commit();
	        	return "removed successfully";
	        }
		} catch (Exception e) {
			return "invalid user";
		}
		return null;
	}

	@Override
	public void update(L_dto ld) {
		try {
			Query q = em.createQuery("select a from L_dto a where email = ?1");
	        q.setParameter(1, ld.getEmail());
	        L_dto l = (L_dto) q.getSingleResult();
	        if(l!=null)
	        {
	        	if(ld.getName()!=null)
	        	{
	        		l.setName(ld.getName());
	        	}
	        	if(ld.getAddress()!=null)
	        	{
	        		l.setAddress(ld.getAddress());
	        	}
	        	if(ld.getGender()!=null)
	        	{
	        		l.setGender(ld.getGender());
	        	}
	        	if(ld.getPwd()!=null)
	        	{
	        		l.setPwd(ld.getPwd());
	        	}
	        	et.begin();
	        	em.merge(l);
	        	et.commit();
	        }
		} catch (Exception e) {
			
		}
	}

	@Override
	public List<S_dto> requestes() {
		Query q = em.createQuery("select a from S_dto a where borrow_status = ?1");
        q.setParameter(1, "requested");
        List<S_dto> ls=q.getResultList();
        
		return ls;
	}

	@Override
	public void app(String email) {
		Query q = em.createQuery("select a from S_dto a where email = ?1");
        q.setParameter(1, email);
		S_dto sd=(S_dto) q.getSingleResult();
		if(sd!=null)
		{
			sd.setBorrow_status("approved");
			et.begin();
			em.merge(sd);
			et.commit();
		}
	}

	@Override
	public Book addb(Book b) {
		et.begin();
		em.persist(b);
		et.commit();
		return b;
	}

	@Override
	public List<Borrower_data> allData() {
		Query q = em.createQuery("select b from Borrower_data b");
		List<Borrower_data> lb = q.getResultList();
		return lb;
	}

	@Override
	public List<Borrower_data> searchBorrowedBooks(String searchQuery) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
