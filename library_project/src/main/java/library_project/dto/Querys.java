package library_project.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Component
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Querys {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private int id;
	private String queryText;
	private String solutionText;

}
