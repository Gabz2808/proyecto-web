package com.proyecto.dao;

import com.proyecto.domain.Producto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductoDao extends JpaRepository<Producto, Long> {

    List<Producto> findTop5ByCategoriaId(Long categoriaId);


}
