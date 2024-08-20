package com.proyecto.service;

import com.proyecto.domain.Favorito;
import java.util.List;

public interface FavoritoService {
    List<Favorito> getProductosFavoritos(long idUsuario);
}
