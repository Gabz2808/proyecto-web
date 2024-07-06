package com.proyecto.controller;

import com.proyecto.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
    @Autowired
    private UsuarioService service;

    @GetMapping("/login")
    public String login(Model modelo) {
        modelo.addAttribute("usuario",service.getUsuarios());

        return "login";
    }
    @GetMapping("register")
    public String register(Model modelo){
        modelo.addAttribute("usuario",service.getUsuarios());
        return "register";
    }


}
