package library_project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date; 
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import library_project.dao.Q_dao;
import library_project.dao.S_dao;
import library_project.dto.Book;
import library_project.dto.Borrower_data;
import library_project.dto.Querys;
import library_project.dto.S_dto;

@Controller
public class S_controller {
	
	@Autowired
	S_dao sda;
	
	@Autowired
	Borrower_data bd;
	
	@Autowired
	Q_dao qo;
	
	@RequestMapping("/registerStudent")
	public ModelAndView saveSt(@ModelAttribute S_dto sd)
	{
		try {
			S_dto s1=sda.save(sd);
			if(s1!=null)
			{
				ModelAndView view=new ModelAndView("s_register.jsp");
				String s2="Registration Successfull";
				view.addObject("s",s2);
				return view;
			}
		} catch (Exception e) {
			// TODO: handle exception
			ModelAndView view=new ModelAndView("s_register.jsp");
			String s3="The email already existed";
			view.addObject("s3",s3);
			return view;
		}
		
		return null;
		
	}
	
	
	@RequestMapping("/slog")
	public ModelAndView log(@ModelAttribute S_dto sd,HttpSession hs)
	{
		String s=sda.login(sd);
		if(s.equals("success"))
		{
			hs.setAttribute("email", sd.getEmail());
			List<Book> lb=sda.getBooks();
			System.out.println(lb);
			ModelAndView view=new ModelAndView("s_home.jsp");
			view.addObject("lb",lb);
			return view;
		}
		else if(s.equals("password incorrect"))
		{
			
			ModelAndView view=new ModelAndView("s_login.jsp");
			view.addObject("s",s);
			return view;
		}
		else if(s.equals("request not accepted"))
		{
			
			ModelAndView view=new ModelAndView("s_login.jsp");
			view.addObject("s",s);
			return view;
		}
		else
		{
			ModelAndView view=new ModelAndView("s_login.jsp");
			view.addObject("s",s);
			return view;
		}
		
	}
	
	@RequestMapping("/fetchs")
	public ModelAndView fetchs(HttpSession hs)
	{
		String email=(String) hs.getAttribute("email");
		S_dto l=sda.fetchd(email);
		if(l!=null)
		{
			System.out.println(l);
			ModelAndView view=new ModelAndView("s_profile.jsp");
			view.addObject("l",l);
			return view;
		}
		return null;
		
	}
	
	
	
	
	@RequestMapping("/requ")
	public ModelAndView requ(@RequestParam String email)
	{
		sda.re(email);
		String me="request sended";
		ModelAndView view=new ModelAndView("s_login.jsp");
		view.addObject("me",me);
		return view;
	}
	@RequestMapping("/logou")
	public ModelAndView log(HttpSession hs)
	{
		String email=(String) hs.getAttribute("email");
		sda.logupdateStatus(email);
		hs.invalidate();
		ModelAndView view=new ModelAndView("s_login.jsp");
		return view;
	}
	
	@RequestMapping("/borrowBooks")
	public void borrowBook(
	        @RequestParam String id,
	        @RequestParam String date,
	        HttpSession hs,
	        HttpServletResponse response) throws IOException {
	    
	    String email = (String) hs.getAttribute("email");
	    int idd = Integer.parseInt(id);
	    S_dto student = sda.fetchd(email);
	    Book book = sda.fetchb(idd);

	    response.setContentType("text/plain");
	    response.setCharacterEncoding("UTF-8");

	    if (book.getQuantity() > 0) {
	        Date borrowDate = java.sql.Date.valueOf(date);

	        // Decrease quantity of the book
	        book.setQuantity(book.getQuantity() - 1);
	        sda.updateBook(book); // Save the updated book

	        // Borrow the book
	        Borrower_data borrowerData = new Borrower_data();
	        borrowerData.setBorrow_date(borrowDate);
	        borrowerData.setStudent(List.of(student));
	        borrowerData.setBook(List.of(book));
	        
	        sda.borrowStore(borrowerData); // Store the borrow transaction

	        // Check quantity and respond appropriately
	        if (book.getQuantity() == 0) {
	            response.getWriter().write("Book borrowed successfully. Book is now out of stock.");
	        } else {
	            response.getWriter().write("Book borrowed successfully!");
	        }
	        return;
	    }

	    response.getWriter().write("Failed to borrow the book. It might be out of stock.");
	}
	
	
	
	
	@RequestMapping("/mylist")
	public ModelAndView myBookList(HttpSession hs)
	{
		String email=(String)hs.getAttribute("email");
		S_dto student = sda.fetchd(email);
		int id=student.getId();
		List<Borrower_data> lb=sda.mylist(id);
		System.out.println("abcdefg");
		System.out.println(lb);
		ModelAndView view=new ModelAndView("mylist.jsp");
		view.addObject("lb",lb);
		return view;
	}
	
	@RequestMapping("/submitbook")
	public ModelAndView subdate(@RequestParam String borrowerDataId)
	{
		Date submitDate = new java.sql.Date(System.currentTimeMillis());
		int idd = Integer.parseInt(borrowerDataId);
		bd.setId(idd);
		bd.setSubmit_date(submitDate);
		sda.submitdate(bd);
		ModelAndView view=new ModelAndView("mylist.jsp");
		 view.addObject("message", "Book submitted successfully!");
		return view;
	}
	
	
	@RequestMapping("/search")
	public ModelAndView searchBook(@RequestParam("query") String query) {
	    List<Book> lb = sda.fetchAll();
	    if (lb != null && !lb.isEmpty()) {
	        List<Book> filteredBooks = lb.stream()
	                .filter(book -> book.getName().toLowerCase().contains(query.toLowerCase()) || 
	                                book.getAuthor().toLowerCase().contains(query.toLowerCase()) ||
	                                book.getGeanre().toLowerCase().contains(query.toLowerCase()))
	                .collect(Collectors.toList());

	        ModelAndView view = new ModelAndView("s_home.jsp");
	        view.addObject("lb", filteredBooks);
	        return view;
	    }

	    // If no books found, send an empty list
	    ModelAndView view = new ModelAndView("s_home.jsp");
	    view.addObject("lb", new ArrayList<Book>());
	    return view;
	}

	
	@RequestMapping("/sprofile")
	public ModelAndView fetch(HttpSession hs)
	{
		String email=(String)hs.getAttribute("email");
		S_dto s=sda.fetchd(email);
		ModelAndView view=new ModelAndView("s_profile.jsp");
		view.addObject("s",s);
		return view;
	}

	@RequestMapping("/sdelete")
	public ModelAndView del(HttpSession hs)
	{
		String email=(String) hs.getAttribute("email");
		sda.delete(email);
		ModelAndView view=new ModelAndView("s_delete_success.jsp");
		return view;
	}
	
	@RequestMapping("/supdate")
	public ModelAndView supdate(@ModelAttribute S_dto sd,HttpSession hs)
	{
		String email=(String) hs.getAttribute("email");
		sd.setEmail(email);
		sda.stupdate(sd);
		List<Book> lb = sda.getBooks();
		ModelAndView view=new ModelAndView("s_home.jsp");
		view.addObject("lb",lb);
		return view;
	}
	
	@RequestMapping("/shome")
	public ModelAndView shome()
	{
		List<Book> lb = sda.getBooks();
		ModelAndView view=new ModelAndView("s_home.jsp");
		view.addObject("lb",lb);
		return view;
	}
	
	@RequestMapping("/resetPassword")
	public ModelAndView forget(@ModelAttribute S_dto sd)
	{
		sda.stupdate(sd);
		ModelAndView view=new ModelAndView("s_forget_success.jsp");
		return view;
	}

	@RequestMapping("/sendQuery")
	public ModelAndView querysm(@ModelAttribute Querys q)
	{
		qo.qsave(q);
		System.out.println(q);
		ModelAndView view=new ModelAndView("query.jsp");
		view.addObject("queries", qo.qget());
		return view;
	}

}
