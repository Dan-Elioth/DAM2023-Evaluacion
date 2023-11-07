package pe.edu.upeu.asistenciaupeubackend.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pe.edu.upeu.asistenciaupeubackend.models.Especieanimal;

@Repository

public interface EspecieAnimallRepository extends JpaRepository<Especieanimal, Long > {

    Optional<Especieanimal> findByEspecie(String especie);
}