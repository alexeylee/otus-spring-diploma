package ru.otus.travel.entities;

import javax.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@NoArgsConstructor

@Entity
@Table(name="travellers", schema = "public", catalog = "travel_db")
public class TravellerEntity  
{
	@Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Column(name = "contract_id", nullable = false)
	private long contractId;
	
	@Column(name = "first_name", nullable = false)
	private String firstName;
	
	@Column(name = "last_name", nullable = false)
	private String lastName;
	
	@Column(name = "date_of_birth", nullable = false)
	private LocalDate date_of_birth;
	
	@Column(name = "sex", nullable = false)
	private String gender;
	
	@Column(name = "accident_rate", nullable = false)
	private BigDecimal accident_rate; 
	
	@Column(name = "medical_rate", nullable = false)
	private BigDecimal medical_rate; 

	@Transient
	@Override
	public String toString()
	{
		return this.lastName + " " + this.firstName;
	}

}