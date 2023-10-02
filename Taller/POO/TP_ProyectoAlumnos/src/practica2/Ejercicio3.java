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
public class Ejercicio3 {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        int dimF1 = 5, dimF2 = 8, dimL1 = 0, dimL2 = 0, dni, edad;
        Persona matrizPersonas [][] = new Persona[dimF1][dimF2]; // dimF1 = días, dimF2 = personas
        String nombre;
        
        // Primer elemento
        System.out.println("Ingrese el nombre del participante: ");
        nombre = Lector.leerString();
        dni = 1000 + GeneradorAleatorio.generarInt(1000);
        edad = 18 + GeneradorAleatorio.generarInt(50);
        
        // Cargar matriz de personas
        while (dimL1 < dimF1 && !(nombre.equals("ZZZ"))) {
            dimL2 = 0;
            while (dimL2 < dimF2 && !(nombre.equals("ZZZ"))) {
                //Crear objeto persona
                Persona participante = new Persona(nombre, dni, edad);
                matrizPersonas[dimL1][dimL2] = participante;
                dimL2++;
                
                System.out.println("Ingrese el nombre del participante: ");
                nombre = Lector.leerString();
                dni = 1000 + GeneradorAleatorio.generarInt(1000);
                edad = 18 + GeneradorAleatorio.generarInt(50);
            }
            dimL1++;
            System.out.println("");
        }
        // Imprimir matriz
        int i, j;
        System.out.println(dimL1 + " " + dimL2);
        
        for (i = 0; i < dimL1; i++) {
            System.out.println("CASTING / DÍA: " + (i+1));
            for (j = 0; j < dimL2; j++)
                System.out.println("Persona entrevistada: " + matrizPersonas[i][j].toString()); //Leer el nombre de la persona
        }
    }
}
