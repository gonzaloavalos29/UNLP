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
public class Ejercicio1 {
    
    public static void main(String[] args) {
        
        Triangulo triangulo = new Triangulo(3, 3, 3, "rojo", "azul"); 
        
        System.out.println("Calcular Perimetro: ");
        System.out.print(triangulo.calcularPerimetro());
        System.out.println("Calcular area: ");
        System.out.print(triangulo.calcularArea());
        
    }
    
}
