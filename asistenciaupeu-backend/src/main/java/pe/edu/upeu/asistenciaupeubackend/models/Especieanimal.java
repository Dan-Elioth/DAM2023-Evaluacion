package pe.edu.upeu.asistenciaupeubackend.models;


import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "especie_animal")


public class Especieanimal {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    
    @Column(name="especie", length = 100, nullable = false)
    @Size(max = 100)
    private String especie;
            

    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "especieanimal_id", referencedColumnName = "id")
    @JsonIgnoreProperties("especieanimalId")
    public List<Inventanimal> inventanimals;
}
