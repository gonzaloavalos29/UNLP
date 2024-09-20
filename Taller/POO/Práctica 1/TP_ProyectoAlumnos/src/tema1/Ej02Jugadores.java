
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;



public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        double[] jugadores;
        
        //Paso 3: Crear el vector para 15 double 
        jugadores = new double[15];
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i, cantAlturaPromedio = 0; 
        double alturas = 0, alturaPromedio = 0;
                
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i = 0; i < 15; i++) {
            System.out.println("Ingrese altura del jugador " + i + ": ");
            jugadores[i] = Lector.leerDouble();
            System.out.println("Altura del jugador " + i + ": " + jugadores[i]);
        }
        
        //Paso 7: Calcular el promedio de alturas, informarlo
        for (i = 0; i < 15; i++) {
            alturas += jugadores[i];
        }
        System.out.println("Alturas suma: " + alturas);
        alturaPromedio = alturas / 15;
        System.out.println("Altura promedio: " + alturaPromedio);
        
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for (i = 0; i < 15; i++) {
            if (jugadores[i] > alturaPromedio) {
                cantAlturaPromedio += 1;
            }
        }
     
        //Paso 9: Informar la cantidad.
        System.out.println("La cantidad de jugadores que están por encima de la altura promedio son: " + cantAlturaPromedio);
    }
    
}
