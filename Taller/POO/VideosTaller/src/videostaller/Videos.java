/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package videostaller;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author Gonzalo
 */
public class Videos {
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("Ingrese su nombre");
        String nombre = Lector.leerString();
        System.out.println("Ingrese su sueldo");
        double sueldo = Lector.leerDouble();
        System.out.println(nombre + " cobra " + sueldo + " pesos.");
        
        GeneradorAleatorio.iniciar();
        sueldo = GeneradorAleatorio.generarDouble(500);
        System.out.println(nombre + " cobra " + sueldo + " pesos.");
        
        sueldo = GeneradorAleatorio.generarDouble(500);
        System.out.println(nombre + " cobra " + sueldo + " pesos.");
        
        sueldo = GeneradorAleatorio.generarDouble(500);
        System.out.println(nombre + " cobra " + sueldo + " pesos.");
    }
    
}
