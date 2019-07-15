package ru.otus.travel.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@Table(name = "countries", schema = "public", catalog = "travel_db")
public class CountryEntity
{
	@Id
	@Column(name = "numeric_code", nullable = false)
	private String numericCode;
	
	@Column(name = "short_name", nullable = false)
	private String shortName;
	
	@Column(name = "english_name", nullable = false)
	private String englishName;
	
	@Column(name = "full_name", nullable = false)
	private String fullName;
	
	@Column(name = "alpha_2_code", nullable = false, unique = true)
	private String alpha2code;
	
	@Column(name = "alpha_3_code", nullable = false, unique = true)
	private String alpha3code;
	
	@Column(name = "is_shengen", nullable = false)
	private boolean shengen;
	
	@Column(name = "currency", nullable = false)
	private String currency;
}
