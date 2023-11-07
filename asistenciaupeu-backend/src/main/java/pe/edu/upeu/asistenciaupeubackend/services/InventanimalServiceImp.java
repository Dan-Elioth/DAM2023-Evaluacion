package pe.edu.upeu.asistenciaupeubackend.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import pe.edu.upeu.asistenciaupeubackend.dtos.InventanimalDto;
import pe.edu.upeu.asistenciaupeubackend.exceptions.AppException;
import pe.edu.upeu.asistenciaupeubackend.exceptions.ResourceNotFoundException;
import pe.edu.upeu.asistenciaupeubackend.mappers.InventanimalMapper;
import pe.edu.upeu.asistenciaupeubackend.models.Inventanimal;
import pe.edu.upeu.asistenciaupeubackend.repositories.InventanimalRepository;

@RequiredArgsConstructor
@Service
@Transactional

public class InventanimalServiceImp implements InventanimalService {

    @Autowired
    private InventanimalRepository inventanimalRepo;

    @Autowired
    private EspecieanimalService especieanimalService;

    private final InventanimalMapper inventanimalMapper;
    


    @Override
    public Inventanimal save(InventanimalDto.InventanimalCrearDto inventanimal) {

        Inventanimal matEnt = inventanimalMapper.inventanimalCrearDtoToInventanimal(inventanimal);
        matEnt.setEspecieanimalId(especieanimalService.getEspecieanimalById(inventanimal.especieanimalId()));
        System.out.println(inventanimal.fechaMes());
        try {
            return inventanimalRepo.save(matEnt);
        } catch (Exception e) {
            throw new AppException("Error-" + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }


    @Override
    public List<Inventanimal> findAll() {
        try {
            return inventanimalRepo.findAll();
        } catch (Exception e) {
            throw new AppException("Error-" + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }


    @Override
    public Map<String, Boolean> delete(Long id) {
        Inventanimal inventanimalx = inventanimalRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Inventarioanimal not exist with id :" + id));
        inventanimalRepo.delete(inventanimalx);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", true);

        return response;
    }


    @Override
    public Inventanimal getInventanimalById(Long id) {
        Inventanimal findInventanimal = inventanimalRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Inventarioanimal not exist with id :" + id));
        return findInventanimal;
    }

    
    @Override
    public Inventanimal update(InventanimalDto.InventanimalCrearDto inventanimal, Long id) {

        Inventanimal inventanimalx = inventanimalRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Periodo not exist with id :" + id));

   
                inventanimalx.setAdultos(inventanimal.adultos());
                inventanimalx.setJovenes(inventanimal.jovenes());
                inventanimalx.setFechaMes(inventanimal.fechaMes());
                inventanimalx.setEspecieanimalId(especieanimalService.getEspecieanimalById(inventanimal.especieanimalId()));

                return inventanimalRepo.save(inventanimalx);
    }




}
