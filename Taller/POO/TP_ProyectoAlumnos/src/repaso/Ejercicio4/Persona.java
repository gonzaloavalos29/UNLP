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
public class Persona {
    
    private String nombre;
    private String DNI;
    private int edad;

    public Persona(String nombre, String DNI, int edad) {
        this.setNombre(nombre);
        this.setDNI(DNI);
        this.setEdad(edad);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    @Override
    public String toString() {
        String aux = "[NOMBRE: " + this.getNombre() + " / DNI: " + this.getDNI() + " / EDAD: " + this.getEdad() + " ";
        return aux;
    }

    
    
}
