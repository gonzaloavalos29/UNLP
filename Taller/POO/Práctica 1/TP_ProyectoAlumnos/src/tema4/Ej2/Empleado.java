/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.Ej2;

/**
 *
 * @author chach
 */
public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad;

    public Empleado(String nombre, double sueldo, int antiguedad) {
        this.nombre = nombre;
        this.sueldo = sueldo;
        this.antiguedad = antiguedad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    public abstract double calcularEfectividad();

    @Override
    public String toString() {
        return "Empleado{" + "nombre=" + nombre + ", sueldo=" + sueldo + ", antiguedad=" + antiguedad + '}';
    }
}
