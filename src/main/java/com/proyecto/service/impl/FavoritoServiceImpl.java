package com.proyecto.service.impl;

import com.proyecto.dao.FavoritoDao;
import com.proyecto.domain.Favorito;
import com.proyecto.service.FavoritoService;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FavoritoServiceImpl implements FavoritoService {

    @Autowired
    private FavoritoDao favoritoDao;

    @Override
    @Transactional
    public List<Favorito> getProductosFavoritos(long idUsuario) {
        return favoritoDao.findByIdUsuario(idUsuario);
    }
}
