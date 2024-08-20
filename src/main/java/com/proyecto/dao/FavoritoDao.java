package com.proyecto.dao;

import com.proyecto.domain.Favorito;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FavoritoDao extends JpaRepository<Favorito, Long> {
    List<Favorito> findByIdUsuario(long idUsuario);
}
