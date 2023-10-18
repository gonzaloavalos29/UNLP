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
public class Corista extends Persona {
    
    private int tonoFundamental;

    public Corista(String nombre, String DNI, int tonoFundamental, int edad) {
        super(nombre, DNI, edad);
        this.tonoFundamental = tonoFundamental;
    }

    public int getTonoFundamental() {
        return tonoFundamental;
    }

    public void setTonoFundamental(int tonoFundamental) {
        this.tonoFundamental = tonoFundamental;
    }

    @Override
    public String toString() {
        String aux = super.toString();
        aux = aux + "CORISTA - TONO FUNDAMENTAL: " + this.getTonoFundamental() + "]";
        return aux;
    }
    
    
    
}
