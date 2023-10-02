/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;

import PaqueteLectura.Lector;
import tema2.Persona;

/**
 *
 * @author Gonzalo
 */
public class Ejercicio1 {
    
    public static void main(String[] args) {
        String nombre;
        int dni, edad;
        
        System.out.println("Ingrese un nombre: ");
        nombre = Lector.leerString();
        System.out.println("Ingrese un DNI: ");
        dni = Lector.leerInt();
        System.out.println("Ingrese una edad: ");
        edad = Lector.leerInt();
        
        Persona persona = new Persona(nombre, dni, edad);
        System.out.println(persona.toString());
    }
    
}
