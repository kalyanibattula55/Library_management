package library_project.repository;

import java.util.List;

import library_project.dto.Book;
import library_project.dto.Borrower_data;
import library_project.dto.L_dto;
import library_project.dto.S_dto;

public interface L_repository {
	
	L_dto save(L_dto ld);
	String login(L_dto ld);
	L_dto fetch(String email);
	String delete(String email);
	void update(L_dto ld);
	
	List<S_dto> requestes();
	
	void app(String email);
	
	
	Book addb(Book b);
	
	List<Borrower_data> allData();
	List<Borrower_data> searchBorrowedBooks(String searchQuery);
}
