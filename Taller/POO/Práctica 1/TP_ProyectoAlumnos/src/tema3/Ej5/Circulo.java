/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3.Ej5;

/**
 *
 * @author chach
 */
public class Circulo {
    private double radio;
    private String color;
    private String linea;

    public Circulo(double radio, String color, String linea) {
        this.radio = radio;
        this.color = color;
        this.linea = linea;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getLinea() {
        return linea;
    }

    public void setLinea(String linea) {
        this.linea = linea;
    }
    
    public double calcularPerimetro() {
        return (2 * Math.PI * radio);
    }
    
    public double calcularArea() {
        return (Math.PI * (Math.pow(radio, 2)));
    }

    @Override
    public String toString() {
        return "Circulo{" + "radio=" + radio + ", color=" + color + ", linea=" + linea + '}';
    }
    
    
}
