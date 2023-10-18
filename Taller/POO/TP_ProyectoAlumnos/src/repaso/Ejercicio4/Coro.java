/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso.Ejercicio4;

/**
 *
 * @author Gonzalo
 */
public abstract class Coro {
    
    private Director director;
    private int cantCoristas;
    private int cantFilas;
    private int cantColumnas;

    public Coro(Director director, int cantCoristas) {
        this.director = director;
        this.cantCoristas = cantCoristas;
    }

    public Coro(Director director, int cantFilas, int cantColumnas) {
        this.setDirector(director);
        this.cantFilas = cantFilas;
        this.cantColumnas = cantColumnas;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }
    public int getCantCoristas() {
        return cantCoristas;
    }
    public int getCantFilas() {
        return cantFilas;
    }
    public int getCantColumnas() {
        return cantColumnas;
    }

    public String toString() {
         String aux = " // INFORMACIÓN DEL CORO // \n";
         aux = aux + director.toString() + "\n";
         //aux = aux + this.mostrarCoristas();
         return aux;
    }
    
    // Otros métodos
    public abstract void agregarCorista(Corista nuevoCorista);
    public abstract boolean estaLleno();
    public abstract boolean estaBienFormado();
    public abstract String mostrarCoristas();
    
    
    
}
