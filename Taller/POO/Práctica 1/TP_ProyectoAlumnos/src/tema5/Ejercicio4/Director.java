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
public class Director extends Persona {
    private int edad;
    private int antiguedad;

    public Director(String nombre, int dni, int edad, int antiguedad) {
        super(nombre, dni);
        this.edad = edad;
        this.antiguedad = antiguedad;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        return super.toString() + " EDAD=" + this.edad + " ANTIGUEDAD=" + this.antiguedad;
    }
    
}
