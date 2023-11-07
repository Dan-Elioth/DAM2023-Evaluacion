package pe.edu.upeu.asistenciaupeubackend.mappers;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import pe.edu.upeu.asistenciaupeubackend.dtos.InventanimalDto;
import pe.edu.upeu.asistenciaupeubackend.models.Inventanimal;

@Mapper(componentModel = "spring")

public interface InventanimalMapper {


    InventanimalDto toInventanimalDto(Inventanimal inventanimal);

    @Mapping(target = "especieanimalId", ignore = true)
    Inventanimal inventanimalCrearDtoToInventanimal(InventanimalDto.InventanimalCrearDto inventanimalCrearDto);
    
}