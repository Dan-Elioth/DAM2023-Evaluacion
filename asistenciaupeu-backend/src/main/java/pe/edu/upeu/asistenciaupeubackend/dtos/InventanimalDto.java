package pe.edu.upeu.asistenciaupeubackend.dtos;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import pe.edu.upeu.asistenciaupeubackend.models.Especieanimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class InventanimalDto {
    

    Long id;

    String adultos;
    String jovenes;

    @JsonFormat(pattern = "yyyy-MM-dd")
    LocalDate fechaMes;

    @JsonIgnoreProperties({"inventanimals"})
    Especieanimal especieanimalId;

    public record InventanimalCrearDto(Long id, LocalDate fechaMes, String adultos, String jovenes, Long especieanimalId) {
    }
}
