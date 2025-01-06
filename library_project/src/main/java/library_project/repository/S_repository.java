package library_project.repository;

import java.util.List;

import library_project.dto.Book;
import library_project.dto.Borrower_data;
import library_project.dto.L_dto;
import library_project.dto.S_dto;

public interface S_repository {
	
	S_dto save(S_dto sd);
	String login(S_dto sd);
	void re(String email);//request
	void logupdateStatus(String email);
	List<Book> getBooks();
	S_dto fetchd(String email);
	Book fetchb(int id);
	Borrower_data borrowStore(Borrower_data b);
	List<Borrower_data> mylist(int id);
	void submitdate(Borrower_data bd);
	
	List<Book> fetchAll();
	String delete(String email);
	void stupdate(S_dto sd);
}
