package com.proyecto.domain;

import jakarta.persistence.*;
import java.io.Serializable;
import lombok.Data;

@Data
@Entity
@Table(name = "Producto")
public class Producto implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @ManyToOne
    @JoinColumn(name = "id_categoria")
    private Categoria categoria;

    private String nombre;
    private String descripcion;
    private double precio;

    @Column(name = "ruta_imagen")
    private String rutaImagen;
    private int stock;
    private boolean activo;

    public Producto() {
    }

    public Producto(long id, Categoria categoria, String nombre, String descripcion, double precio, String rutaImagen, int stock, boolean activo) {
        this.id = id;
        this.categoria = categoria;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.rutaImagen = rutaImagen;
        this.stock = stock;
        this.activo = activo;
    }



    

}
