package com.proyecto.service;

import com.proyecto.domain.Categoria;
import java.util.List;



public interface CategoriaService {
    
    //Se obtiene un listado de categorias en un list / Read
    public List<Categoria> getCategorias(boolean activos);
    
   // Se obtiene un Categoria, a partir del id de un categoria / READ con parametro
    public Categoria getCategoria(Categoria categoria);
    
    // Se inserta un nuevo categoria si el id del categoria esta vacío / CREATE
    // Se actualiza un categoria si el id del categoria NO esta vacío / UPDATE
    public void save(Categoria categoria);
    
    // Se elimina el categoria que tiene el id pasado por parámetro / DELETE
    public void delete(Categoria categoria);
}    
