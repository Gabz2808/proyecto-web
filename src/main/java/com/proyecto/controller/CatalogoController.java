package com.proyecto.controller;

import com.proyecto.service.ProductoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CatalogoController {

    @Autowired
    private ProductoService productoService;

    @GetMapping("/catalogo")
    public String productos(Model model) {
        model.addAttribute("productos", productoService.getProductos(true));
        return "catalogo";
    }
}
