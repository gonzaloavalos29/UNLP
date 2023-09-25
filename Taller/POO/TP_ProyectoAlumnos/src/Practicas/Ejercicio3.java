/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author Gonzalo
 */
public class Ejercicio3 {
    
    public static void main(String[] args) {
        
	//Paso 2. iniciar el generador aleatorio     
	GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int DIMF = 9;
        int DIMC = 9;
        int [][] enteros = new int[5][9];
        int [] vectorPosiciones = new int[5];
        int sumaFilas = 0;
        int i, j;
        int num = 0;
        boolean esta = false;
        for (i = 0; i < 5; i++) {
            for (j = 0; j < 5; j++) {
                enteros[i][j] = GeneradorAleatorio.generarInt(10);
                vectorPosiciones[j] += enteros[i][j];
            }
        }
        //Paso 4. mostrar el contenido de la matriz en consola
        for (i = 0; i < 5; i++) {
            System.out.println("------");
            for (j = 0; j < 5; j++) {
                System.out.print("(" + i + ", " + j + "): " + enteros[i][j] + " | ");
            }
        }
        System.out.println("------");
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        for (i = 0; i < 5; i++) {
            System.out.println("------");
            for (j = 0; j < 5; j++) {
                if (i == 0)
                    sumaFilas += enteros[i][j];
                System.out.print("(" + i + ", " + j + "): " + enteros[i][j] + " | ");
            }
        }
        System.out.println(sumaFilas);
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        for (i = 0; i < 5; i++) 
            System.out.println("Vector posiciones: " + vectorPosiciones[i]);
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        num = Lector.leerInt();
        for (i = 0; i < 5; i++)
            for (j = 0; j < 5; j++)
                if (num == enteros[i][j])   
                    esta = true;
        System.out.println(esta);
    }
    
}
