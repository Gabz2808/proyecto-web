package com.proyecto.service;

import com.proyecto.domain.Usuario;
import java.util.List;

public interface UsuarioService {

    public List<Usuario> getUsuarios();

    public Usuario getUsuario(Usuario usuario);

    public void save(Usuario usuario);

    public void delete(Usuario usuario);

    Usuario findByEmailAndPassword(String email, String contrasena);

    Usuario findByEmail(String email);

}
