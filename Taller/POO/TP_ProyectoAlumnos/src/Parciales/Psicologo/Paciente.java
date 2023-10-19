/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales.Psicologo;

/**
 *
 * @author Gonzalo
 */
public class Paciente {
    
    private String nombre;
    private boolean tieneObraSocial;
    private double costoSesion;

    public Paciente(String nombre, boolean tieneObraSocial, double costoSesion) {
        this.setNombre(nombre);
        this.setTieneObraSocial(tieneObraSocial);
        this.setCostoSesion(costoSesion);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isTieneObraSocial() {
        return tieneObraSocial;
    }

    public void setTieneObraSocial(boolean tieneObraSocial) {
        this.tieneObraSocial = tieneObraSocial;
    }

    public double getCostoSesion() {
        return costoSesion;
    }

    public void setCostoSesion(double costoSesion) {
        this.costoSesion = costoSesion;
    }

    @Override
    public String toString() {
        return "Paciente{" + "nombre=" + nombre + ", tieneObraSocial=" + tieneObraSocial + ", costoSesion=" + costoSesion + '}';
    }
    
}
