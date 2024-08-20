package com.proyecto.controller;

import com.proyecto.domain.Favorito;
import com.proyecto.domain.Usuario;
import com.proyecto.service.FavoritoService;
import com.proyecto.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Optional;

@Controller
public class PerfilController {

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private FavoritoService favoritoService;

    @GetMapping("/perfil/{id}-{nombre}-{apellidos}")
    public String getPerfilById(@PathVariable("id") Long id, Model model) {
        Optional<Usuario> usuarioOpt = Optional.ofNullable(usuarioService.getUsuarioPorId(id));
        if (usuarioOpt.isPresent()) {
            Usuario usuario = usuarioOpt.get();
            List<Favorito> favoritos = favoritoService.getProductosFavoritos(id);
            model.addAttribute("usuario", usuario);
            model.addAttribute("favoritos", favoritos);
            return "perfil";
        } else {
            return "error/404"; // O la vista de error que tengas definida
        }
    }
}
