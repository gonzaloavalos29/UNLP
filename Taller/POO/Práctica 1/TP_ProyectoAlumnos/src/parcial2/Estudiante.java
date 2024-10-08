/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author chach
 */
public class Estudiante {
    
    private String nombre;
    private int dni;
    private int numeroTema;

    public Estudiante(String nombre, int dni) {
        this.nombre = nombre;
        this.dni = dni;
        this.numeroTema = -1;
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

    public int getNumeroTema() {
        return numeroTema;
    }

    public void setNumeroTema(int numeroTema) {
        this.numeroTema = numeroTema;
    }
    
    public void asignarTema(int m) {
        this.numeroTema = GeneradorAleatorio.generarInt(m) + 1;
    }

    @Override
    public String toString() {
        return "Estudiante{" + "nombre=" + nombre + ", dni=" + dni + ", numeroTema=" + numeroTema + '}';
    }
    
}
