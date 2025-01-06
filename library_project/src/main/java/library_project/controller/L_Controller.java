package library_project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import library_project.dao.L_dao;
import library_project.dao.Q_dao;
import library_project.dao.S_dao;
import library_project.dto.Book;
import library_project.dto.Borrower_data;
import library_project.dto.L_dto;
import library_project.dto.Querys;
import library_project.dto.S_dto;


@Controller

public class L_Controller {
	@Autowired
	L_dao lda;
	
	@Autowired
	Q_dao qo;
	
	@RequestMapping("/register")
	public ModelAndView saveLi(@ModelAttribute L_dto ld)
	{
		System.out.println("juhygfdfgh");
		try {
			L_dto l1=lda.save(ld);
			if(l1!=null)
			{
				String s="Registration Successfull";
				ModelAndView view=new ModelAndView("l_register.jsp");
				view.addObject("s",s);
				return view;
			}
		} catch (Exception e) {
			String s1="the email already existed";
			ModelAndView view=new ModelAndView("l_register.jsp");
			view.addObject("s1",s1);
			return view;
		}
		return null;
		
	}
	
	@RequestMapping("/logi")
	public ModelAndView log(@ModelAttribute L_dto ld,HttpSession hs)
	{
		String s=lda.login(ld);
		if(s.equals("success"))
		{
			hs.setAttribute("email", ld.getEmail());
			ModelAndView view=new ModelAndView("l_home.jsp");
			return view;
		}
		else if(s.equals("password incorrect"))
		{
			ModelAndView view=new ModelAndView("l_login.jsp");
			view.addObject("s",s);
			return view;
		}
		else
		{
			ModelAndView view=new ModelAndView("l_login.jsp");
			view.addObject("s",s);
			return view;
		}
	}
	
	@RequestMapping("/fetch")
	public ModelAndView fetchD(HttpSession hs)
	{
		String email=(String) hs.getAttribute("email");
		L_dto l=lda.fetch(email);
		if(l!=null)
		{
			System.out.println(l);
			ModelAndView view=new ModelAndView("l_profile.jsp");
			view.addObject("l",l);
			return view;
		}
		return null;
		
	}
	
	@RequestMapping("/delete")
	public ModelAndView del(HttpSession hs)
	{
		String email=(String) hs.getAttribute("email");
		lda.delete(email);
		ModelAndView view=new ModelAndView("l_delete_success.jsp");
		return view;
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession hs)
	{
		hs.invalidate();
		ModelAndView view=new ModelAndView("l_login.jsp");
		return view;
		
	}
	
	@RequestMapping("/update")
	public ModelAndView up(@ModelAttribute L_dto ld,HttpSession hs)
	{
		String email=(String) hs.getAttribute("email");
		ld.setEmail(email);
		lda.update(ld);
		ModelAndView view=new ModelAndView("l_update_success.jsp");
		return view;
		
	}
	
	
	@RequestMapping("/appr")
	public ModelAndView appr() {
	    // Fetch the list of requests
	    List<S_dto> ls = lda.requestes();  // 'lda.requestes()' should return the list of requests
	    ModelAndView view = new ModelAndView("approvals.jsp");  // Redirecting to the JSP

	    // Check if the list is null or empty to avoid errors
	    if (ls != null) {
	        // Add the list and its size (approvalCount) to the model
	        view.addObject("ls", ls);  // Pass the list to the view
	        view.addObject("approvalCount", ls.size());  // Pass the approval count to the view
	    } else {
	        view.addObject("approvalCount", 0);  // If no requests, set the count to 0
	    }

	    return view;
	}

	
	@RequestMapping("/accept")
	public ModelAndView ap(@RequestParam String email)
	{
		lda.app(email);
		ModelAndView view=new ModelAndView("l_home.jsp");
		view.addObject("s","approved");
		return view;
	}
	
	@RequestMapping("/addb")
	public ModelAndView addbook(@ModelAttribute Book b)
	{
		Book bo=lda.addb(b);
		if(bo!=null)
		{
			System.out.println(bo);
			ModelAndView view=new ModelAndView("add_books.jsp");
			view.addObject("s","book added successfully");
			return view;
		}
		return null;
	}
	
	@RequestMapping("/borrow")
	public ModelAndView borroweData()
	{
		List<Borrower_data> lb=lda.allData();
		ModelAndView view=new ModelAndView("borrower_data.jsp");
		view.addObject("lb",lb);
		return view;
	}
	
	@RequestMapping("/searchdata")
	public ModelAndView searchData(@RequestParam("searchQuery") String query) {
		List<Borrower_data> lb=lda.allData();
	    if (lb != null && !lb.isEmpty()) {
	        List<Borrower_data> filteredBooks = lb.stream()
	                .filter(borrower -> {
	                    boolean isSubmitDateNotSubmitted = borrower.getSubmit_date() == null;
	                    boolean isStudentNameMatch = borrower.getStudent().stream()
	                            .anyMatch(student -> student.getName().toLowerCase().contains(query.toLowerCase()));
	                    return isSubmitDateNotSubmitted || isStudentNameMatch;
	                })
	                .collect(Collectors.toList());
	        ModelAndView view = new ModelAndView("borrower_data.jsp");
	        view.addObject("lb", filteredBooks);
	        return view;
	    }
	    ModelAndView view = new ModelAndView("borrower_data.jsp");
	    view.addObject("lb", new ArrayList<Borrower_data>());
	    return view;
	}

	@RequestMapping("/resetPasswordd")
	public ModelAndView forgetpass(@ModelAttribute L_dto ld)
	{
		lda.update(ld);
		ModelAndView view=new ModelAndView("l_forget_success.jsp");
		return view;
	}
	
	@RequestMapping("/qsol")
	public ModelAndView qsolu()
	{
		
		List<Querys> ls=qo.qget();
		ModelAndView view=new ModelAndView("solve_query.jsp");
		view.addObject("ls",ls);
		return view;
		
	}
	
	@RequestMapping("/saveSolution")
	public ModelAndView saveSolution(@RequestParam("queryId") int queryId, @RequestParam("solution") String solution) {
	    qo.updateSolution(queryId, solution);
	    System.out.println(queryId+" "+solution);
	    List<Querys> ls = qo.qget();
	    ModelAndView view = new ModelAndView("solve_query.jsp");
	    view.addObject("ls", ls);
	    return view;

	}


}
