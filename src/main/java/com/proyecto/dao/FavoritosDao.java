package com.proyecto.dao;

import com.proyecto.domain.Producto;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface FavoritosDao extends JpaRepository<Producto, Long> {
 

}
