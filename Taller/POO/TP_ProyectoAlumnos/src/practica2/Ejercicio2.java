/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
import tema2.Persona;
        

/**
 *
 * @author Gonzalo
 */
public class Ejercicio2 {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        String nombre;
        int i, cantMayores = 0, dniMenor = 999999, dni, edad, dimF = 15, dimL = 0;
        Persona [] vectorpersonas = new Persona [dimF]; // vector de objetos de clase Persona
        Persona personaConElMenorDNI = new Persona(); // Crear un objeto persona y dejarlo vacío para cargarlo
        
        do {
            System.out.println("Generando persona....  (" + (dimL+1) + ")");
            nombre = GeneradorAleatorio.generarString(10);
            dni = 10000 + GeneradorAleatorio.generarInt(100);
            edad = GeneradorAleatorio.generarInt(100);
            Persona nuevaPersona = new Persona(nombre, dni, edad);
            vectorpersonas[dimL] = nuevaPersona;
            dimL++;
        } while (dimL < dimF && edad != 0);
        
        for (i = 0; i < dimF; i++) {
            if (vectorpersonas[i].getEdad() > 65) // obtener la cantidad de personas mayores a 65
                cantMayores++;
            if (vectorpersonas[i].getDNI() < dniMenor) {
                dniMenor = vectorpersonas[i].getDNI();
                personaConElMenorDNI = vectorpersonas[i];
            }
        }
        
        System.out.println("Hubo un total de " + cantMayores + " personas matores de 65 años");
        System.out.println(personaConElMenorDNI.toString());
        
    }
    
    
    
}
