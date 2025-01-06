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
import library_project.repository.S_repository;
@Repository
public class S_dao implements S_repository{

	EntityManager em=Persistence.createEntityManagerFactory("veeranji").createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	@Override
	public S_dto save(S_dto sd) {
		et.begin();
		em.persist(sd);
		et.commit();
		return sd;
	}

	@Override
	public String login(S_dto sd) {
	    try {
	        // Clear persistence context to avoid stale entities
	        em.clear();
	        
	        Query q = em.createQuery("select a from S_dto a where email = ?1");
	        q.setParameter(1, sd.getEmail());
	        S_dto l = (S_dto) q.getSingleResult();
	        
	        if (l != null) {
	            em.refresh(l); // Ensure the entity is fresh
	            System.out.println(l.getBorrow_status() + " hello ");
	            
	            if (sd.getPwd().equals(l.getPwd())) {
	                if (l.getBorrow_status().equals("approved")) {
	                    return "success";
	                } else {
	                    return "request not accepted";
	                }
	            } else {
	                return "password incorrect";
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "email invalid";
	    }
	    return null;
	}


	@Override
	public void re(String email) {
		try {
			Query q = em.createQuery("select a from S_dto a where email = ?1");
	        q.setParameter(1, email);
	        S_dto l = (S_dto) q.getSingleResult();
	        if(l!=null)
	        {
	        	l.setBorrow_status("requested");
	        	et.begin();
	        	em.merge(l);
	        	et.commit();
	        }
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	@Override
	public void logupdateStatus(String email) {
		
		try {
			Query q = em.createQuery("select a from S_dto a where email = ?1");
	        q.setParameter(1, email);
	        S_dto l = (S_dto) q.getSingleResult();
	        if(l!=null)
	        {
	        	l.setBorrow_status("null");
	        	et.begin();
	        	em.merge(l);
	        	et.commit();
	        }
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Override
	public List<Book> getBooks() {
		Query q=em.createQuery("select a from Book a");
		List<Book> l=q.getResultList();
		return l;
	}

	@Override
	public S_dto fetchd(String email) {
		try {
			Query q = em.createQuery("select a from S_dto a where email = ?1");
	        q.setParameter(1, email);
	        S_dto l = (S_dto) q.getSingleResult();
	        if(l!=null)
	        {
	        	return l;
	        }
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	@Override
	public Book fetchb(int id) {
		et.begin();
		Book b=em.find(Book.class, id);
		et.commit();
		if(b!=null)
		{
			return b;
		}
		else
		{
			return null;
		}
	}

	@Override
	public Borrower_data borrowStore(Borrower_data b) {
	    if (b.getId() != 0) {
	        b.setId(0); 
	    }
	    
	    et.begin();  

	    try {
	        em.persist(b);  
	        et.commit(); 
	    } catch (Exception e) {
	        et.rollback(); 
	        e.printStackTrace();
	    }

	    return b;  
	}
	
	//need to give in repository
	public void updateBook(Book book) {
	   
	    et.begin();
	    Book existingBook = em.find(Book.class, book.getId());
	    if (existingBook != null) {
	        existingBook.setQuantity(book.getQuantity());
	       
	        em.merge(existingBook); 
	        et.commit();
	    } else {
	        System.out.println("Book not found for update.");
	    }
	}
	@Override
	public List<Borrower_data> mylist(int id)
	{
	    Query q = em.createQuery("select b from Borrower_data b join b.student s where s.id = :id");
	    q.setParameter("id", id);
	    List<Borrower_data> lb = q.getResultList(); 
	    return lb; 
	}
	
	
	@Override
	public void submitdate(Borrower_data bd)
	{
		et.begin();
		Borrower_data bds=em.find(Borrower_data.class, bd.getId());
		if(bds!=null)
		{
			if(bds.getSubmit_date()==null)
			{
				bds.setSubmit_date(bd.getSubmit_date());
			}
			em.merge(bds);
			et.commit();
		}
	}

	@Override
	public List<Book> fetchAll() {
		Query q=em.createQuery("select a from Book a");
		List<Book> ls=q.getResultList();
		return ls;
	}

	
	@Override
	public String delete(String email) {
		try {
			Query q = em.createQuery("select a from S_dto a where email = ?1");
	        q.setParameter(1, email);
	        S_dto l = (S_dto) q.getSingleResult();
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
	public void stupdate(S_dto sd) {
		try {
			Query q = em.createQuery("select a from S_dto a where email = ?1");
	        q.setParameter(1, sd.getEmail());
	        S_dto l = (S_dto) q.getSingleResult();
	        if(l!=null)
	        {
	        	if(sd.getName()!=null)
	        	{
	        		l.setName(sd.getName());
	        	}
	        	if(sd.getAddress()!=null)
	        	{
	        		l.setAddress(sd.getAddress());
	        	}
	        	if(sd.getGender()!=null)
	        	{
	        		l.setGender(sd.getGender());
	        	}
	        	if(sd.getPwd()!=null)
	        	{
	        		l.setPwd(sd.getPwd());
	        	}
	        	if(sd.getBranch()!=null)
	        	{
	        		l.setBranch(sd.getBranch());
	        	}
	        	if(sd.getBorrow_status()!=null)
	        	{
	        		l.setBorrow_status(sd.getBorrow_status());
	        	}
	        	et.begin();
	        	em.merge(l);
	        	et.commit();
	        }
		} catch (Exception e) {
			
		}
		
	}



	

}
