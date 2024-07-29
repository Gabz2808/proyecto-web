package com.proyecto.domain;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.List;
import javax.validation.constraints.NotEmpty;
import lombok.Data;


@Data
@Entity
@Table(name = "rol")
public class Rol implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_rol")
    private long idRol;

    @NotEmpty
    private String nombre;
    
    @Column(name="id_usuario")
    private Long idUsuario;
    
    public Rol() {
    }

    public Rol(String nombre) {
        this.nombre = nombre;
    }

}
