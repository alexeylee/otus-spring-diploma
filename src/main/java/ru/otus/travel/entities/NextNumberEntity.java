package ru.otus.travel.entities;

import javax.persistence.*;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor

@Entity
@Table(name="next_number", schema = "public", catalog = "travel_db")
public class NextNumberEntity {
	
	public NextNumberEntity(long year, long next_number) {
		this.year = year;
		this.next_number = next_number;
	}
	
	@Id
	@Column(name = "year")
	private long year;
	
	@Column(name = "next_number", nullable = false)
	private long next_number;
}
