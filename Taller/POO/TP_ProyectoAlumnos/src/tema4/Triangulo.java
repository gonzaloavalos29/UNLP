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
public class Triangulo extends Figura {
    
    private double lado1;
    private double lado2;
    private double lado3;
    
    public Triangulo (String unColorR, String unColorL, int lado1, int lado2, int lado3) {
        
        super(unColorR, unColorL); // Constructor de la superclase
        this.setLado1(lado1);
        this.setLado2(lado2);
        this.setLado3(lado3);
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    
    // Otros métodos
    @Override // La superclase Figura obliga a escribir un método con el mismo nombre
    public double calcularPerimetro() {
        double calculo = (this.getLado1() + this.getLado2() + this.getLado3());
        return calculo;
    }
    
    @Override
    public double calcularArea() {
        double aux = (this.getLado1() + this.getLado2() + this.getLado3()) / 2;
        double calculo = Math.sqrt(aux * (aux - this.getLado1()) * (aux - this.getLado2()) * (aux - this.getLado3()));
        return calculo;
    }

    @Override
    public String toString() {
        String aux = super.toString(); // Obtener el texto del toString de la Superclase Figura
        String texto = aux + " Lado 1: " + this.getLado1() +
                             " Lado 2: " + this.getLado2() +
                             " Lado 3: " + this.getLado3();
        return texto;
    }
    
}
