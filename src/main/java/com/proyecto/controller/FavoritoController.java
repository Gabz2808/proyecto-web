package com.proyecto.controller;

import com.proyecto.domain.Favorito;
import com.proyecto.service.FavoritoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class FavoritoController {

    @Autowired
    private FavoritoService favoritoService;

    @GetMapping("/favoritos/{idUsuario}")
    public List<Favorito> getFavoritosByUsuario(@PathVariable long idUsuario) {
        return favoritoService.getProductosFavoritos(idUsuario);
    }
}
