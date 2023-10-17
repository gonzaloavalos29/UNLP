/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Gonzalo
 */
public class Ejercicio1 {
    
    public static void main(String[] args) {
        
        Triangulo triangulo = new Triangulo("Rojo", "Azul", 1, 2, 3);
        Circulo circulo = new Circulo(6, "Verde", "Amarillo");
        
        System.out.println(triangulo.toString());
        System.out.println(circulo.toString());
        
        circulo.despintar();
        System.out.println(circulo.toString());
    }
    
}
