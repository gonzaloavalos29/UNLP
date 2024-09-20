/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;


public class Ej03Matrices {

    public static void main(String[] args) {
        //Paso 2. iniciar el generador aleatorio   
        GeneradorAleatorio.iniciar();
	 
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios
        int matriz[][] = new int[5][5];
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                matriz[i][j] = GeneradorAleatorio.generarInt(31);
            }
        }
    
        //Paso 4. mostrar el contenido de la matriz en consola
        for (int i = 0; i < 5; i++) {
            System.out.println();
            for (int j = 0; j < 5; j++) {
                System.out.print("[" + i + "]" + "[" + j + "]");
                System.out.print(": " + matriz[i][j] + " ");
            }
        }
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int suma = 0;
        for (int j = 0; j < 5; j++) {
            suma += matriz[0][j];
        }
        System.out.println();
        System.out.println("Suma de elementos de fila 0: " + suma);
    
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        int vector[] = new int[5];
        for (int j = 0; j < 5; j++) {
            suma = 0;
            for (int i = 0; i < 5; i++) {
                suma += matriz[i][j];
            }
            vector[j] += suma;
            System.out.println("Posicion " + j + ", suma: " + vector[j]);
        }

        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        System.out.println("Ingrese valor entero a buscar: ");
        int valor = Lector.leerInt();
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                if (matriz[i][j] == valor) {
                    System.out.println("Posicion del valor: " + "[" + i + "]" + "[" + j + "]");
                }
            }
        }
//        int i = 0; int j = 0;
//        boolean encontre = false;
//        while ((encontre == false) && (i < 5)) { 
//            while ((encontre == false) && (j < 5)) {
//                if (matriz[i][j] == valor) {
//                    encontre = true;
//                    System.out.println("Posicion del valor: " + "[" + i + "]" + "[" + j + "]");
//                }
//                j++;
//            }
//            i++;
//        }
//        if (encontre == false)
//            System.out.println("No se encontró el valor.");
    }
}
