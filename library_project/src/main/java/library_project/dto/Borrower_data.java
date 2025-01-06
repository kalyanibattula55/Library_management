package library_project.dto;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class Borrower_data {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    // Use java.util.Date for borrow_date and submit_date
    @Temporal(TemporalType.DATE)  // This ensures that only the date (not the time) is stored
    private Date borrow_date;
    
    @Temporal(TemporalType.DATE)
    private Date submit_date;

    @ManyToMany(cascade = CascadeType.PERSIST)
    private List<Book> book;

    @ManyToMany(cascade = CascadeType.PERSIST)
    private List<S_dto> student;
}
