
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos

import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double
        int DF = 3;
        //Paso 3: Crear el vector para 15 double 
        double [] vectorJugadores =  new double[DF]; // indices de 0 a 15
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i, cantJugadores = 0;
        double alturaPromedio = 0, alturaJugador = 0;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i = 0; i < DF; i++) {
            System.out.println("Ingrese la altura del jugador: ");
            alturaJugador = Lector.leerDouble(); // lee un double
            vectorJugadores[i] = alturaJugador; 
            alturaPromedio += alturaJugador;
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
            alturaPromedio = alturaPromedio / DF;
            System.out.println("Altura promedio: " + alturaPromedio);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for (i = 1; i < DF; i++) {
            if (vectorJugadores[i] >= alturaPromedio) {
                cantJugadores = cantJugadores + 1;
            }
        }
        //Paso 9: Informar la cantidad.
        System.out.println("Cantidad de jugadores con altura promedio o mayor: " + cantJugadores);
    }
    
}
