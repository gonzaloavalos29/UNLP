/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso.Ejercicio2;

/**
 *
 * @author Gonzalo
 */
public class Auto {
    private String nombre;
    private String patente;

    public Auto(String nombre, String patente) {
        this.setNombre(nombre);
        this.setPatente(patente);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    @Override
    public String toString() {
        return "Auto{" + "nombre=" + nombre + ", patente=" + patente + '}';
    }
    
}
