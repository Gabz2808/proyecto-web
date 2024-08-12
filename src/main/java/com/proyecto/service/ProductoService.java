package com.proyecto.service;

import com.proyecto.domain.Producto;
import java.util.List;

public interface ProductoService {

    //Se obtiene un listado de productos en un list / Read
    public List<Producto> getProductos(boolean activos);

    // Se obtiene un Producto, a partir del id de un producto / READ con parametro
    public Producto getProducto(Producto producto);

    // Se inserta un nuevo producto si el id del producto esta vacío / CREATE
    // Se actualiza un producto si el id del producto NO esta vacío / UPDATE
    public void save(Producto producto);

    // Se elimina el producto que tiene el id pasado por parámetro / DELETE
    public void delete(Producto producto);

    Producto getProductoById(Long id);

    List<Producto> getRelacionados(Long id);

    List<Producto> getRandom(); // Método existente

    Producto getProductoRecomendado(); // Nuevo método para obtener un solo producto recomendado

}
