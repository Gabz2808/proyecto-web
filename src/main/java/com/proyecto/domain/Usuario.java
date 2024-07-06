package com.proyecto.domain;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;
@Data
@Entity
@Table(name = "usuario")
public class Usuario implements Serializable {
    private static final long serialVersionUID = 1L; //Incrementar valores en1 1

    @Id //Indica el ID
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long idUsuario;

    private String nombreCompleto;
    private String email;
    private String contrasena;
    private boolean esAdmin = false;


    public Usuario() {
    }

    public Usuario(String nombreCompleto, boolean esAdmin) {
        this.nombreCompleto = nombreCompleto;
        this.esAdmin = esAdmin;
    }
}
