package ru.otus.travel.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import ru.otus.travel.entities.CountryEntity;

public interface CountryRepository extends CrudRepository<CountryEntity, String>{
	List<CountryEntity> findAllByOrderByShortNameAsc();
}
