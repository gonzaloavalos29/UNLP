/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.Ej5;

import tema4.Ej1.*;
import tema3.Ej5.*;

/**
 *
 * @author chach
 */
public class Circulo extends Figura {
    private double radio;

    public Circulo(double radio, String unCR, String unCL) {
        super(unCR, unCL);
        this.radio = radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    @Override
    public double calcularPerimetro() {
        return (2 * Math.PI * radio);
    }
    
    @Override
    public double calcularArea() {
        return (Math.PI * (Math.pow(radio, 2)));
    }

    @Override
    public String toString() {
        String aux = "Circulo: " + super.toString() + " | Radio: " + getRadio();
        return aux;
    }
}
