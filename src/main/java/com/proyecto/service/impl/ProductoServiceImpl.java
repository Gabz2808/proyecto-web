package com.proyecto.service.impl;

import com.proyecto.dao.ProductoDao;
import com.proyecto.domain.Producto;
import com.proyecto.service.ProductoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductoServiceImpl implements ProductoService {

    @Autowired
    private ProductoDao productoDao;

    @Override
    @Transactional(readOnly = true)
    public List<Producto> getProductos(boolean activos) {
        var lista = productoDao.findAll();
        if (activos) {
            lista.removeIf(e -> !e.isActivo());
        }
        return lista;
    }

    @Override
    @Transactional(readOnly = true)
    public Producto getProducto(Producto producto) {
        return productoDao.findById(producto.getId()).orElse(null);
    }

    @Override
    @Transactional
    public void save(Producto producto) {
        productoDao.save(producto);
    }

    @Override
    @Transactional
    public void delete(Producto producto) {
        productoDao.delete(producto);
    }

    @Override
    @Transactional(readOnly = true)
    public Producto getProductoById(Long id) {
        return productoDao.findById(id).orElse(null);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Producto> getRelacionados(Long id) {
        return productoDao.findTop5ByCategoriaId(id);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Producto> getRandom() {
        return productoDao.random(); // Devuelve una lista de productos aleatorios
    }

    @Override
    @Transactional(readOnly = true)
    public Producto getProductoRecomendado() {
        List<Producto> productos = productoDao.random(); // Obtiene una lista de productos aleatorios
        return productos.isEmpty() ? null : productos.get(0); // Devuelve el primer producto si la lista no está vacía
    }

}
