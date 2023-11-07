package pe.edu.upeu.asistenciaupeubackend.models;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 *
 * @author DELL
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "inventario_animales")


public class Inventanimal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Size(max = 100)
    @Column(name="adultos", length = 100, nullable = false)
    private String adultos;

    @Size(max = 100)
    @Column(name="jovenes", length = 100, nullable = false)
    private String jovenes;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @Basic(optional = false)
    @Column(name = "fechaMes", nullable = false)
    @Temporal(TemporalType.DATE)
    private LocalDate fechaMes;

    
    @JoinColumn(name = "especieanimal_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    @JsonIgnoreProperties("inventanimals")
    private Especieanimal especieanimalId;

}
