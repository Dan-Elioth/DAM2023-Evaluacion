package pe.edu.upeu.asistenciaupeubackend.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import pe.edu.upeu.asistenciaupeubackend.dtos.InventanimalDto;
import pe.edu.upeu.asistenciaupeubackend.models.Inventanimal;
import pe.edu.upeu.asistenciaupeubackend.services.InventanimalService;



@RestController
@RequestMapping("/asis/invent")
public class InventanimalController {


    @Autowired
    private InventanimalService inventanimalService;


    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ResponseEntity<List<Inventanimal>> listVaca() {
        List<Inventanimal> actDto = inventanimalService.findAll();
        return ResponseEntity.ok(actDto);
    }

    @PostMapping("/crear")
    public ResponseEntity<Inventanimal> createVaca(@RequestBody InventanimalDto.InventanimalCrearDto inventanimal) {
        Inventanimal data = inventanimalService.save(inventanimal);
        return ResponseEntity.ok(data);
    }

    @GetMapping("/buscar/{id}")
    public ResponseEntity<Inventanimal> getInventanimalById(@PathVariable Long id) {
        Inventanimal inventanimal = inventanimalService.getInventanimalById(id);
        return ResponseEntity.ok(inventanimal);
    }

    @PutMapping("/editar/{id}")
    public ResponseEntity<Inventanimal> updateInventanimal(@PathVariable("id") Long id,
    @RequestBody InventanimalDto.InventanimalCrearDto inventanimalDesails) {
        Inventanimal updateInventanimal = inventanimalService.update(inventanimalDesails, id);
        return ResponseEntity.ok(updateInventanimal);
    }

    @DeleteMapping("/eliminar/{id}")
    public ResponseEntity<Map<String, Boolean>> deleteInventanimal(@PathVariable Long id) {
        Map<String, Boolean> result = inventanimalService.delete(id);
        return ResponseEntity.ok(result);
    }
}
