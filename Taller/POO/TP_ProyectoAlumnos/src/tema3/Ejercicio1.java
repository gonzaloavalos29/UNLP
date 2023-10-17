/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.Lector;

/**
 *
 * @author Alumno
 */
public class Ejercicio1 {
    
    public static void main(String[] args) {
        
//        Triangulo triangulo2 = new Triangulo(0, 0, 0, "", "");
//        triangulo2.setLado1(Lector.leerDouble());
//        triangulo2.setLado2(Lector.leerDouble());
//        triangulo2.setLado3(Lector.leerDouble());
//        triangulo2.setColorLinea(Lector.leerString());
//        triangulo2.setColorRelleno(Lector.leerString());
        
        Triangulo triangulo1 = new Triangulo(3.50, 4.50, 4.50, "Azul", "Blanco");
        
//        System.out.println(triangulo1.calcularPerimetro());
//        System.out.println(triangulo1.calcularArea());

        System.out.println(triangulo1);
    }
    
}
