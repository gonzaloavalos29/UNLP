/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial1;

/**
 *
 * @author chach
 */
public class Materia {
    
    private String nombre;
    private double nota;
    private int fecha;

    public Materia(String nombre, double nota, int fecha) {
        this.nombre = nombre;
        this.nota = nota;
        this.fecha = fecha;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getNota() {
        return nota;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }

    public int getFecha() {
        return fecha;
    }

    public void setFecha(int fecha) {
        this.fecha = fecha;
    }

    @Override
    public String toString() {
        return "Materia{" + "nombre=" + nombre + ", nota=" + Math.round(nota) + ", fecha=" + fecha + '}';
    }
    
}
