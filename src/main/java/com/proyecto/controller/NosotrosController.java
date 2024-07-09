package com.proyecto.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NosotrosController {
    @GetMapping("/nosotros")
    public String nosotros(){
        return "nosotros";
    }
}
