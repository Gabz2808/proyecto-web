package com.proyecto.controller;

import com.proyecto.domain.Producto;
import com.proyecto.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class ProductoPageController {

    @Autowired
    private ProductoService productoService;

    @GetMapping("/catalogo/{id}")
    public String getProductoById(@PathVariable Long id, Model model) {
        Producto producto = productoService.getProductoById(id);
        List<Producto> productosRelacionados = productoService.getRelacionados(producto.getCategoria().getId());
        model.addAttribute("producto", producto);
        model.addAttribute("productosRelacionados", productosRelacionados);
        return "productoPage";
    }
}
