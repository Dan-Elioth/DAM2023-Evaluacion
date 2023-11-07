package pe.edu.upeu.asistenciaupeubackend.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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

import pe.edu.upeu.asistenciaupeubackend.models.Especieanimal;
import pe.edu.upeu.asistenciaupeubackend.services.EspecieanimalService;

@RestController
@RequestMapping("/asis/especie")
public class EspecieanimalController {

    @Autowired
    private EspecieanimalService especieanimalService;
    
    // @PostMapping("/crear")
    // public ResponseEntity<Especieanimal> createEspecieanimal(@RequestBody Especieanimal especieanimal) {
    //     System.out.println("Especieanimal recibido: " + especieanimal.toString()); // Verificar los datos recibidos
    //     Especieanimal savedEspecieanimal = especieanimalService.save(especieanimal);
    //     return new ResponseEntity<>(savedEspecieanimal, HttpStatus.CREATED);
    // }


     @PostMapping("/crear")
     public ResponseEntity<Especieanimal> createEspecieanimal(@RequestBody Especieanimal especieanimal) {
         if (especieanimal.getEspecie() != null) {
             Especieanimal savedEspecieanimal = especieanimalService.save(especieanimal);
             return new ResponseEntity<>(savedEspecieanimal, HttpStatus.CREATED);
        } else {
            // Devolver una respuesta indicando que el campo 'especie' es obligatorio.
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
     }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ResponseEntity<List<Especieanimal>> listRaza() {
        List<Especieanimal> especieanimals = especieanimalService.findAll();
        return ResponseEntity.ok(especieanimals);
    }


    @GetMapping("/buscar/{id}")
    public ResponseEntity<Especieanimal> getEspecieanimalById(@PathVariable Long id) {
        Especieanimal especieanimal = especieanimalService.getEspecieanimalById(id);
        return new ResponseEntity<>(especieanimal, HttpStatus.OK);
    }


    @PutMapping("/editar/{id}")
    public ResponseEntity<Especieanimal> updateEspecieanimal(@PathVariable Long id, @RequestBody Especieanimal especieanimal) {
        Especieanimal updateEspecieanimal = especieanimalService.update(especieanimal, id);
        return new ResponseEntity<>(updateEspecieanimal, HttpStatus.OK);
    }

    @DeleteMapping("/eliminar/{id}")
    public ResponseEntity<Map<String, Boolean>> deleteEspecieanimal(@PathVariable Long id) {
        Map<String, Boolean> response = especieanimalService.delete(id);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}
