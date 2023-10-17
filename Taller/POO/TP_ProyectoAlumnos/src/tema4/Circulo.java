/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

import tema3.*;

/**
 *
 * @author Alumno
 */
public class Circulo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;

    public Circulo(double radio, String colorRelleno, String colorLinea) {
        this.radio = radio;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }
    
    public double calcularArea(){
        return Math.pow(Math.PI * this.radio, 2);
    }
    
    public double calcularPerimetro() {
        return (2 * Math.PI * this.radio);
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }

    @Override
    public String toString() {
        return "Circulo{" + "radio=" + this.radio + ", colorRelleno=" + this.colorRelleno + ", colorLinea=" + this.colorLinea + '}';
    }

    void despintar() {
        this.colorRelleno = "blanco";
        this.colorLinea = "Negro";
//To change body of generated methods, choose Tools | Templates.
    }
    
}
