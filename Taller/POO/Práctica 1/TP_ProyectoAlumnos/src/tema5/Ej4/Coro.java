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
    private int cantCoristas;
    private int cantActual = 0;

    public Coro(String nombreCoro, Director director, int cantCoristas) {
        this.nombreCoro = nombreCoro;
        this.director = director;
        this.cantCoristas = cantCoristas;
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

    public int getCantCoristas() {
        return cantCoristas;
    }

    public void setCantCoristas(int cantCoristas) {
        this.cantCoristas = cantCoristas;
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
    public boolean estaLleno() {
        if (this.cantActual == this.cantCoristas)
            return true;
        else
            return false;
    }
    public abstract boolean estaBienFormado();
    
}
