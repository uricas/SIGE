package mx.edu.utez.entity;
// Generated 21-jun-2018 22:32:54 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Usuario generated by hbm2java
 */
public class Usuario  implements java.io.Serializable {


     private Integer idUsuario;
     private Rol rol;
     private String nombre;
     private String apellidos;
     private String correo;
     private String usuario;
     private String password;
     private Set<Aplicacion> aplicacions = new HashSet<Aplicacion>(0);
     private Set<Examen> examens = new HashSet<Examen>(0);

    public Usuario() {
    }

	
    public Usuario(Rol rol, String nombre, String apellidos, String correo, String usuario, String password) {
        this.rol = rol;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.correo = correo;
        this.usuario = usuario;
        this.password = password;
    }
    public Usuario(Rol rol, String nombre, String apellidos, String correo, String usuario, String password, Set<Aplicacion> aplicacions, Set<Examen> examens) {
       this.rol = rol;
       this.nombre = nombre;
       this.apellidos = apellidos;
       this.correo = correo;
       this.usuario = usuario;
       this.password = password;
       this.aplicacions = aplicacions;
       this.examens = examens;
    }
   
    public Integer getIdUsuario() {
        return this.idUsuario;
    }
    
    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }
    public Rol getRol() {
        return this.rol;
    }
    
    public void setRol(Rol rol) {
        this.rol = rol;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getApellidos() {
        return this.apellidos;
    }
    
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    public String getCorreo() {
        return this.correo;
    }
    
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    public String getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public Set<Aplicacion> getAplicacions() {
        return this.aplicacions;
    }
    
    public void setAplicacions(Set<Aplicacion> aplicacions) {
        this.aplicacions = aplicacions;
    }
    public Set<Examen> getExamens() {
        return this.examens;
    }
    
    public void setExamens(Set<Examen> examens) {
        this.examens = examens;
    }




}

