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
public class Ejercicio5 {
    public static void main(String[] args) {
        Circulo circulo = new Circulo(5, "azul", "rojo");
        
        System.out.println(circulo.calcularPerimetro());
        System.out.println(circulo.calcularArea());
        System.out.println(circulo);
    }
}
