/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author alumnos
 */
public class Ej04 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int[][] edificio = new int[8][4];
        GeneradorAleatorio.iniciar();
        int piso, oficina;
        for (int i = 0; i < 8; i++) {
            for (int j = 0; j < 4; j++) {
                edificio[i][j] = 0;
            }
        }
        System.out.println("Ingrese numero de piso: ");
        piso = Lector.leerInt();
        System.out.println("Ingrese numero de oficina: ");
        oficina = Lector.leerInt();
        while (piso != 9) {
            edificio[piso][oficina] = edificio[piso][oficina] + 1;
            System.out.println("Ingrese numero de piso: ");
            piso = Lector.leerInt();
            System.out.println("Ingrese numero de oficina: ");
            oficina = Lector.leerInt();
        }
        
        for (int i = 0; i < 8; i++) {
            System.out.println();
            for (int j = 0; j < 4; j++) {
                System.out.print("(" + i + ")(" + j + "):" + edificio[i][j] + " | ");
            }
        }
        
    }
    
}
