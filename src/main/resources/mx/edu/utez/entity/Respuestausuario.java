package mx.edu.utez.entity;
// Generated 21-jun-2018 22:32:54 by Hibernate Tools 4.3.1



/**
 * Respuestausuario generated by hbm2java
 */
public class Respuestausuario  implements java.io.Serializable {


     private Integer idRespuestaUsuario;
     private Aplicacion aplicacion;
     private Respuesta respuesta;
     private byte correcta;

    public Respuestausuario() {
    }

    public Respuestausuario(Aplicacion aplicacion, Respuesta respuesta, byte correcta) {
       this.aplicacion = aplicacion;
       this.respuesta = respuesta;
       this.correcta = correcta;
    }
   
    public Integer getIdRespuestaUsuario() {
        return this.idRespuestaUsuario;
    }
    
    public void setIdRespuestaUsuario(Integer idRespuestaUsuario) {
        this.idRespuestaUsuario = idRespuestaUsuario;
    }
    public Aplicacion getAplicacion() {
        return this.aplicacion;
    }
    
    public void setAplicacion(Aplicacion aplicacion) {
        this.aplicacion = aplicacion;
    }
    public Respuesta getRespuesta() {
        return this.respuesta;
    }
    
    public void setRespuesta(Respuesta respuesta) {
        this.respuesta = respuesta;
    }
    public byte getCorrecta() {
        return this.correcta;
    }
    
    public void setCorrecta(byte correcta) {
        this.correcta = correcta;
    }




}


