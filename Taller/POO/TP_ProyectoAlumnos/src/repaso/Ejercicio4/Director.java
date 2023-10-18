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
public class Director extends Persona {
    
    private int antiguedad;

    public Director(String nombre, String DNI, int edad, int antiguedad) {
        super(nombre, DNI, edad);
        this.antiguedad = antiguedad;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        String aux = super.toString();
        aux = aux + "DIRECTOR - ANTIGUEDAD: " + this.getAntiguedad() + "]";
        return aux;
    }
    
    
    
}
