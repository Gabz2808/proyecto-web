package com.proyecto.domain;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Builder;

import java.util.Date;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "v_favoritos_productos")
public class Favorito {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id")
    private long idFavorito;

    @Column(name = "id_usuario", nullable = false)
    private long idUsuario;

    @Column(name = "id_producto", nullable = false)
    private long idProducto;

    @Column(name = "id_categoria", nullable = false)
    private long idCategoria;

    @Column(name = "nombre", nullable = false)
    private String nombre;

    @Column(name = "descripcion")
    private String descripcion;

    @Column(name = "precio", nullable = false)
    private double precio;

    @Column(name = "ruta_imagen")
    private String rutaImagen;

    @Column(name = "fecha_adicion", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaAdicion;
}
