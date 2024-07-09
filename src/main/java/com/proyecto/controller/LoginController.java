package com.proyecto.controller;

import com.proyecto.domain.Usuario;
import com.proyecto.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {
    @Autowired
    private UsuarioService usuarioService;

    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }
    @PostMapping("/login")
    public String loginSubmit(@RequestParam String correo, @RequestParam String contrasena) {
        Usuario usuario = usuarioService.findByEmailAndPassword(correo, contrasena);
        if (usuario != null) {
            return "redirect:/";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("usuario", new Usuario());
        return "register";
    }

    @PostMapping("/register")
    public String registerSubmit(Usuario usuario, @RequestParam String email, Model modelo) {
        Usuario usuarioEncontrado = usuarioService.findByEmail(email);
        boolean mostrarError = true;

        if (usuarioEncontrado != null) {
            modelo.addAttribute("errorVisible", true);
            return "register";
        }else{
            usuario.setEsAdmin(false);
            usuarioService.save(usuario);
            modelo.addAttribute("errorVisible", false);
            return "redirect:/login";
        }

    }
}
