package com.proyecto.controller;

import com.proyecto.domain.Usuario;
import com.proyecto.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Optional;

@Controller
public class PerfilController {

    @Autowired
    private UsuarioService usuarioService;

    @GetMapping("/perfil/{id}-{nombre}-{apellidos}")
    public String getPerfilById(@PathVariable("id") Long id, Model model) {
        Optional<Usuario> usuarioOpt = Optional.ofNullable(usuarioService.getUsuarioPorId(id));
        if (usuarioOpt.isPresent()) {
            model.addAttribute("usuario", usuarioOpt.get());
            return "perfil";
        } else {
            return "error/404"; // O la vista de error que tengas definida
        }
    }
}
