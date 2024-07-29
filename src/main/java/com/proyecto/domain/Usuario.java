package com.proyecto.domain;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.List;
import javax.validation.constraints.NotEmpty;
import lombok.Data;

@Data
@Entity
@Table(name = "usuario")
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long idUsuario;
    
    @NotEmpty
    private String username;
    @NotEmpty
    private String password;
    private String nombre;
    private String apellidos;
    private String correo;
    private String telefono;
    @Column(name = "ruta_imagen")
    private String rutaImagen;
    private boolean activo;
    
    @OneToMany
    @JoinColumn(name="id")
    private List<Rol> roles;

    public Usuario() {
    }

    public Usuario(String nombre) {
        this.nombre = nombre;
    }

}
