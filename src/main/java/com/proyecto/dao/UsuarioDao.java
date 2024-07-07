
package com.proyecto.dao;

import com.proyecto.domain.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsuarioDao extends JpaRepository<Usuario,Long>{

    Usuario findByEmailAndContrasena(String email, String contrasena);
    Usuario findByEmail(String email);

}
