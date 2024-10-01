/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3.Ej4;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author chach
 */
public class Habitacion {
    private double costo;
    private boolean ocupada;
    private Persona cliente;

    public Habitacion() {
        costo = GeneradorAleatorio.generarDouble(6001) + 2000;
        ocupada = false;
        cliente = null;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setEstaOcupada(boolean estaOcupada) {
        this.ocupada = estaOcupada;
    }

    public Persona getPersona() {
        return cliente;
    }

    public void setPersona(Persona persona) {
        this.cliente = persona;
    }
    
    public void aumentarPrecio(double n) {
        costo += n;
    }
    
    public void ocupar(){
        this.ocupada = true;
    }
    
    @Override
    public String toString() {
        String aux = "Costo = " + costo + " | Estado = " + ocupada;
        if (ocupada) {
            aux += cliente.toString();
        }
        return aux;
    }
}
