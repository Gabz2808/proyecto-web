package com.proyecto.controller;

import com.proyecto.domain.Categoria;
import com.proyecto.domain.Producto;
import com.proyecto.service.CategoriaService;
import com.proyecto.service.ProductoService;
import com.proyecto.service.impl.FirebaseStorageServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@Slf4j
@RequestMapping("/producto")
public class ProductoController {
    
    @Autowired
    private ProductoService productoService;

    @Autowired
    private CategoriaService categoriaService;


    @GetMapping("/listado")
    public String inicio(Model model) {
        var categorias = categoriaService.getCategorias(true);
        var productos = productoService.getProductos(false);
        model.addAttribute("categorias", categorias);
        model.addAttribute("productos", productos);
        model.addAttribute("totalProductos", productos.size());
        return "/producto/listado";
    }

    @GetMapping("/nuevo")
    public String productoNuevo(Producto producto) {
        return "/producto/modifica";
    }

    @Autowired
    private FirebaseStorageServiceImpl firebaseStorageService;
    
    @PostMapping("/guardar")
    public String productoGuardar(Producto producto,
            @RequestParam("imagenFile") MultipartFile imagenFile) {
        if (!imagenFile.isEmpty()) {
            productoService.save(producto);
            producto.setRutaImagen(
                    firebaseStorageService.cargaImagen(
                            imagenFile, 
                            "producto", 
                            producto.getId()));
        }
        productoService.save(producto);
        return "redirect:/producto/listado";
    }

    @GetMapping("/eliminar/{id}")
    public String productoEliminar(Producto producto) {
        productoService.delete(producto);
        return "redirect:/producto/listado";
    }

    @GetMapping("/modificar/{id}")
    public String productoModificar(Producto producto, Model model) {
        List<Categoria> categorias = categoriaService.getCategorias(true);
        producto = productoService.getProducto(producto);
        model.addAttribute("producto", producto);
        model.addAttribute("categorias", categorias);
        return "/producto/modifica";
    }
}
