/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.Lector;

/**
 *
 * @author alumnos
 */
public class Ej05 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int[] puntuacion = new int[4];
        int atencion, comida, precio, ambiente;
        for (int i = 0; i < 4; i++) {
            puntuacion[i] = 0;
        }
        for (int i = 0; i < 5; i++) {
            atencion = 0; comida = 0; precio = 0; ambiente = 0;
            while ((atencion <= 0) || (atencion > 10)) {
                System.out.println("Ingrese puntaje de atención al cliente (1 al 10): ");
                atencion = Lector.leerInt();
            }
            puntuacion[0] += atencion;
            while ((comida <= 0) || (comida > 10)) {
                System.out.println("Ingrese puntaje de calidad de comida (1 al 10): ");
                comida = Lector.leerInt();
            }
            puntuacion[1] += comida;
            while ((precio <= 0) || (precio > 10)) {
                System.out.println("Ingrese puntaje de precio (1 al 10): ");
                precio = Lector.leerInt();
            }
            puntuacion[2] += precio;
            while ((ambiente <= 0) || (ambiente > 10)) {
                System.out.println("Ingrese puntaje de ambiente (1 al 10): ");
                ambiente = Lector.leerInt();
            }
            puntuacion[3] += ambiente;
        }
        for (int i = 0; i < 4; i++) {
            System.out.println("Puntuacion de " + i + ": " + puntuacion[i]);
        }
    }
    
}
