package pe.edu.upeu.asistenciaupeubackend.services;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import pe.edu.upeu.asistenciaupeubackend.exceptions.AppException;
import pe.edu.upeu.asistenciaupeubackend.exceptions.ResourceNotFoundException;
import pe.edu.upeu.asistenciaupeubackend.models.Especieanimal;
import pe.edu.upeu.asistenciaupeubackend.repositories.EspecieAnimallRepository;


@RequiredArgsConstructor
@Service
@Transactional

public class EspecieanimalServiceImp implements EspecieanimalService{

    @Autowired
    private EspecieAnimallRepository especieanimallRepo;


    @Override
    public Especieanimal save(Especieanimal especieanimal) {
        if (especieanimal != null) {
            // Asegúrate de que los campos requeridos no sean nulos antes de guardar
            if (especieanimal.getEspecie() != null) {
                try {
                    return especieanimallRepo.save(especieanimal);
                } catch (Exception e) {
                    throw new AppException("Error-" + e.getMessage(), HttpStatus.BAD_REQUEST);
                }
            } else {
                throw new AppException("Error- Campo 'especie' es obligatorio.", HttpStatus.BAD_REQUEST);
            }
        } else {
            throw new AppException("Error- No se ha proporcionado la entidad Especieanimal.", HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public List<Especieanimal> findAll() {
        try {
            return especieanimallRepo.findAll();
        } catch (Exception e) {
            throw new AppException("Error-"+e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }


    @Override
    public Map<String, Boolean> delete(Long id) {
        Especieanimal especieanimalx = especieanimallRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Especie not exist with id :" + id));

        especieanimallRepo.delete(especieanimalx);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", true);

        return response;
    }


    @Override
    public Especieanimal getEspecieanimalById(Long id) {
        Especieanimal findEspecieanimal = especieanimallRepo.findById(id).orElseThrow(() -> new ResourceNotFoundException("Especie not exist with id :" + id));
        return findEspecieanimal;
    }


    @Override
    public Especieanimal update(Especieanimal especieanimal, Long id) {
        Especieanimal especieanimalx = especieanimallRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Periodo not exist with id :" + id));
        especieanimalx.setEspecie(especieanimal.getEspecie());
        return especieanimallRepo.save(especieanimalx);
    }

    
}
