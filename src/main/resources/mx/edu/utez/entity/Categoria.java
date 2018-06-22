package mx.edu.utez.entity;
// Generated 21-jun-2018 22:32:54 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Categoria generated by hbm2java
 */
public class Categoria  implements java.io.Serializable {


     private Integer idCategoria;
     private String nombre;
     private String descripcion;
     private Set<Pregunta> preguntas = new HashSet<Pregunta>(0);
     private Set<Examen> examens = new HashSet<Examen>(0);

    public Categoria() {
    }

	
    public Categoria(String nombre, String descripcion) {
        this.nombre = nombre;
        this.descripcion = descripcion;
    }
    public Categoria(String nombre, String descripcion, Set<Pregunta> preguntas, Set<Examen> examens) {
       this.nombre = nombre;
       this.descripcion = descripcion;
       this.preguntas = preguntas;
       this.examens = examens;
    }
   
    public Integer getIdCategoria() {
        return this.idCategoria;
    }
    
    public void setIdCategoria(Integer idCategoria) {
        this.idCategoria = idCategoria;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public Set<Pregunta> getPreguntas() {
        return this.preguntas;
    }
    
    public void setPreguntas(Set<Pregunta> preguntas) {
        this.preguntas = preguntas;
    }
    public Set<Examen> getExamens() {
        return this.examens;
    }
    
    public void setExamens(Set<Examen> examens) {
        this.examens = examens;
    }




}


