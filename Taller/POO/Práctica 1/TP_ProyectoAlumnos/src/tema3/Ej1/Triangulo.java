/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3.Ej1;

/**
 *
 * @author chach
 */
public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String relleno;
    private String linea;

    public Triangulo(double lado1, double lado2, double lado3, String relleno, String linea) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.relleno = relleno;
        this.linea = linea;
    }
    
    public Triangulo(){
        
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

    public String getRelleno() {
        return relleno;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }

    public String getLinea() {
        return linea;
    }

    public void setLinea(String linea) {
        this.linea = linea;
    }
    
    public double calcularPerimetro() {
        return (this.lado1 + this.lado2 + this.lado3);
    }
    
    public double calcularS() {
        return (calcularPerimetro()/2);
    }
    
    public double calcularArea() {
        return (Math.sqrt(calcularS()*(calcularS() - this.lado1) * (calcularS() - this.lado2) * (calcularS() - this.lado3)));
    }

    @Override
    public String toString() {
        return "Triangulo{" + "lado1=" + lado1 + ", lado2=" + lado2 + ", lado3=" + lado3 + ", relleno=" + relleno + ", linea=" + linea + '}';
    }
    
}
