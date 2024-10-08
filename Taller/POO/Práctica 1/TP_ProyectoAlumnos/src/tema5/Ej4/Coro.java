/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5.Ej4;

/**
 *
 * @author chach
 */
public abstract class Coro {
    private String nombreCoro;
    private Director director;
    private int cantActual = 0;

    public Coro(String nombreCoro, Director director) {
        this.nombreCoro = nombreCoro;
        this.director = director;
    }

    public String getNombreCoro() {
        return nombreCoro;
    }

    public void setNombreCoro(String nombreCoro) {
        this.nombreCoro = nombreCoro;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }

    public int getCantActual() {
        return cantActual;
    }

    public void setCantActual(int cantActual) {
        this.cantActual = cantActual;
    }
    
    @Override
    public String toString() {
        String aux;
        aux = "Nombre del coro: " + getNombreCoro() + "\n" +
              "Datos del director: " + "nombre=" + this.director.getNombre() + 
              "Edad=" + this.director.getEdad() + " DNI: " + this.director.getDni() + "\n";
        return aux;
    }
    
    public abstract void agregarCorista(Corista corista);
    public abstract boolean estaLleno();
    public abstract boolean estaBienFormado();
    
}
