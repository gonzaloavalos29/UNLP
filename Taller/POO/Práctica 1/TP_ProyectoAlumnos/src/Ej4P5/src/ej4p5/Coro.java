/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej4p5;

/**
 *
 * @author Alumno
 */
public abstract class Coro {
    private Persona director;
    private String nombreDelCoro;

    public Coro(Persona director, String nombreDelCoro) {
        setDirector(director);
        setNombreDelCoro(nombreDelCoro);
    }
    
    public Persona getDirector() {
        return director;
    }

    public void setDirector(Persona director) {
        this.director = director;
    }

    public String getNombreDelCoro() {
        return nombreDelCoro;
    }

    public void setNombreDelCoro(String nombreDelCoro) {
        this.nombreDelCoro = nombreDelCoro;
    }
    
    public abstract void agregarCorista(Persona unCorista);
    
    public abstract boolean estaLleno();
    
    public abstract boolean bienFormado();
    
}
