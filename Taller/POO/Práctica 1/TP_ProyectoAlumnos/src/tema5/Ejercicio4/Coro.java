/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5.Ejercicio4;

/**
 *
 * @author chach
 */
public abstract class Coro {
    private String nombre;
    private Director direc;
    private int diml;
    private int cantCoristas; //DIMF
    
    public Coro(Director direc, int cantCoristas, String nom) {
        this.diml = 0;
        this.nombre = nom;
        this.direc = direc;
        this.cantCoristas = cantCoristas;
    }
    
    public boolean CoroLleno() {
        return this.diml == cantCoristas;
    }

    public String getNombre() {
        return nombre;
    }

    public Director getDirec() {
        return direc;
    }

    public int getDiml() {
        return diml;
    }

    public int getCantCoristas() {
        return cantCoristas;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDirec(Director direc) {
        this.direc = direc;
    }

    public void incrementarDiml() {
        this.diml += 1;
    }

    private void setCantCoristas(int cantCoristas) {
        this.cantCoristas = cantCoristas;
    }
    
    public abstract boolean estaLleno();
    public abstract boolean estaBienFormado();
    
    @Override
    public String toString() {
        return "Nombre del coro: " + this.nombre + " Director: " + this.direc.toString() + "\n Data de los coristas: ";
    }
}
