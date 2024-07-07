package com.proyecto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HeaderController {

    @GetMapping("/header")
    public String header(Model model) {
        
        boolean isLoggedIn = false;
        model.addAttribute("isLoggedIn", isLoggedIn);

        return "header";
    }
}