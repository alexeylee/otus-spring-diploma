package ru.otus.travel.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import ru.otus.travel.entities.NextNumberEntity;

public interface NumeratorRepository extends CrudRepository<NextNumberEntity, Long>{
	
	Optional<NextNumberEntity> findByYear();
}
