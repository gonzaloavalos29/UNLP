/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej4p5;

/**
 *
 * @author Alumno
 */
public class Persona {
    private String nombre;
    private int dni,edad,tonoOAntiguadad;

    public Persona(String nombre, int dni, int edad, int tonoOAntiguadad) {
        this.nombre = nombre;
        this.dni = dni;
        this.edad = edad;
        this.tonoOAntiguadad = tonoOAntiguadad;
    }
    
    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getTonoOAntiguadad() {
        return tonoOAntiguadad;
    }

    public void setTonoOAntiguadad(int tonoOAntiguadad) {
        this.tonoOAntiguadad = tonoOAntiguadad;
    }
    
    
}
