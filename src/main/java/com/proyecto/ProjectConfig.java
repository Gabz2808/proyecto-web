package com.proyecto;

import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Configuration
public class ProjectConfig implements WebMvcConfigurer {

    /*Los siguientes metodos son para incorporar el tema de internacionalizacion en el proyecto */

 /*localeResolver se utiliza para crear una sesion de cambio de idioma*/
    @Bean
    public LocaleResolver localeResolver() {
        var slr = new SessionLocaleResolver();
        slr.setDefaultLocale(new Locale("es"));
        slr.setLocaleAttributeName("session.current.locale");
        slr.setTimeZoneAttributeName("session.current.timezone");
        return slr;
    }

    /* localeChangeInterceptor se utiliza para crear un interceptor de cambio de idioma*/
    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
        var lci = new LocaleChangeInterceptor();
        lci.setParamName("lang");
        return lci;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registro) {
        registro.addInterceptor(localeChangeInterceptor());
    }

    @Bean("messageSource")
    public MessageSource messageSource() {
        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
        messageSource.setBasenames("messages");
        messageSource.setDefaultEncoding("UTF-8");
        return messageSource;
    }

    /* Los siguiente métodos son para implementar el tema de seguridad dentro del proyecto */
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("index");
        registry.addViewController("/index").setViewName("index");
        registry.addViewController("/login").setViewName("login");
        registry.addViewController("/registro/nuevo").setViewName("/registro/nuevo");
    }
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests((request) -> request
                        .requestMatchers("/", "/index", "/errores/**",
                                "/carrito/**", "/pruebas/**", "/reportes/**",
                                "/servicios/**", "/producto/listado/**", "/nosotros/**",
                                "/registro/**", "/js/**", "/webjars/**", "/catalogo/**","/catalogo/{id}", "/register", "/login"
                                ,"/perfil"
                        ).permitAll()
                        .requestMatchers(
                                "/producto/nuevo", "/producto/guardar",
                                "/producto/modificar/**", "/producto/eliminar/**",
                                "/categoria/listado/**",
                                "/categoria/nuevo", "/categoria/guardar",
                                "/categoria/modificar/**", "/categoria/eliminar/**"
                        ).hasRole("ADMIN")
                        .requestMatchers(
                                "/usuario/listado"
                        ).hasAnyRole("ADMIN", "VENDEDOR")
                        .requestMatchers(
                                "/facturar/carrito"
                        ).hasRole("USER")
                )
                .formLogin((form) -> form
                        .loginPage("/login")
                        .defaultSuccessUrl("/index", true)
                        .permitAll()
                )
                .logout((logout) -> logout.permitAll());
        return http.build();
    }


    /* El siguiente método se utiliza para completar la clase no es 
    realmente funcional, la próxima semana se reemplaza con usuarios de BD */    
//    @Bean
//    public UserDetailsService users() {
//        UserDetails admin = User.builder()
//                .username("juan")
//                .password("{noop}123")
//                .roles("USER", "VENDEDOR", "ADMIN")
//                .build();
//        UserDetails sales = User.builder()
//                .username("rebeca")
//                .password("{noop}456")
//                .roles("USER", "VENDEDOR")
//                .build();
//        UserDetails user = User.builder()
//                .username("pedro")
//                .password("{noop}789")
//                .roles("USER")
//                .build();
//        return new InMemoryUserDetailsManager(user, sales, admin);
//    }
    
    @Autowired
   private UserDetailsService userDetailsService;
    
    @Autowired
    public void configurerGlobal(AuthenticationManagerBuilder build)
            throws Exception {
        build
                .userDetailsService(userDetailsService)
                .passwordEncoder(new BCryptPasswordEncoder());
    }
}