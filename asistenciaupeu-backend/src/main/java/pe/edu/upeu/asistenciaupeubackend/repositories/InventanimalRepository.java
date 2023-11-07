package pe.edu.upeu.asistenciaupeubackend.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import pe.edu.upeu.asistenciaupeubackend.models.Inventanimal;

public interface InventanimalRepository extends JpaRepository<Inventanimal, Long>{

    
}