/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Gonzalo
 */
public class Trabajador extends Persona {
    private String oficio;

    public Trabajador(String oficio, String nombre, int DNI, int edad) {
        super(nombre, DNI, edad);
        this.oficio = oficio;
    }

    public String getOficio() {
        return oficio;
    }

    public void setOficio(String oficio) {
        this.oficio = oficio;
    }

    @Override
    public String toString() {
        String aux = super.toString();
        aux = aux + " Soy " + this.getOficio() + ".";
        return aux;
    }

    
    
}
