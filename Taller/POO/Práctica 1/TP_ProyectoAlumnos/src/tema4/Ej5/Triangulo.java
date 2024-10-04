/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.Ej5;

import tema4.Ej1.*;

/**
 *
 * @author chach
 */
public class Triangulo extends Figura {
    private int lado1, lado2, lado3, base, altura;

    public Triangulo(int lado1, int lado2, int lado3, int base, int altura, String unCR, String unCL) {
        super(unCR, unCL);
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.base = base;
        this.altura = altura;
    }

    public int getLado1() {
        return lado1;
    }

    public void setLado1(int lado1) {
        this.lado1 = lado1;
    }

    public int getLado2() {
        return lado2;
    }

    public void setLado2(int lado2) {
        this.lado2 = lado2;
    }

    public int getLado3() {
        return lado3;
    }

    public void setLado3(int lado3) {
        this.lado3 = lado3;
    }

    public int getBase() {
        return base;
    }

    public void setBase(int base) {
        this.base = base;
    }

    public int getAltura() {
        return altura;
    }

    public void setAltura(int altura) {
        this.altura = altura;
    }

    
    
    @Override
    public double calcularArea() {
        return (getBase() * getAltura() / 2);
    }

    @Override
    public double calcularPerimetro() {
        return (getLado1() + getLado2() + getLado3());
    }

    @Override
    public String toString() {
        String aux = "Triangulo: " + super.toString() + 
                     " | Lado1: " + getLado1() +
                     " | Lado2: " + getLado2() + 
                     " | Lado3: " + getLado3() + 
                     " | Base: " + getBase() +
                     " | Altura: " + getAltura();
        return aux;
    }

    
    
    
}
