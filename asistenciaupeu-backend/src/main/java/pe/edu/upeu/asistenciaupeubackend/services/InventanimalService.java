package pe.edu.upeu.asistenciaupeubackend.services;
import java.util.List;
import java.util.Map;

import pe.edu.upeu.asistenciaupeubackend.dtos.InventanimalDto;
import pe.edu.upeu.asistenciaupeubackend.models.Inventanimal;

public interface InventanimalService {
    
    Inventanimal save(InventanimalDto.InventanimalCrearDto inventanimal);

    List<Inventanimal> findAll();

    Map<String, Boolean> delete(Long id);

    Inventanimal getInventanimalById(Long id);

    Inventanimal update(InventanimalDto.InventanimalCrearDto inventanimal, Long id);
}
