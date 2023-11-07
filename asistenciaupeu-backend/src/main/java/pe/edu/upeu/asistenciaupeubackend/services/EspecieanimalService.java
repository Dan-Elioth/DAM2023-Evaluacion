package pe.edu.upeu.asistenciaupeubackend.services;

import java.util.List;
import java.util.Map;

import pe.edu.upeu.asistenciaupeubackend.models.Especieanimal;

public interface EspecieanimalService {

    Especieanimal save(Especieanimal especieanimal);
    
    List<Especieanimal> findAll();

    Map<String, Boolean> delete(Long id);

    Especieanimal getEspecieanimalById(Long id);

    Especieanimal update(Especieanimal especieanimal, Long id);

    
}