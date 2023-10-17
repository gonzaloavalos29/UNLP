/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

import PaqueteLectura.Lector;

/**
 *
 * @author Gonzalo
 */
public class Ejercicio6 {
    public static void main(String[] args){
        SistemaAño sistaño = new SistemaAño("La Plata", "-34.921", "57.955", 3, 2021);
        SistemaMes sistmes = new SistemaMes("Mar del Plata", "-38.002", "-57.556", 4, 2020);
        int i;
        double temp;
        
        //Cargar el vector del sistema de informe anual
        for (i = 0; i < sistaño.getAñosConsecutivos(); i++){
            System.out.print("Introduzca el promedio anual de temperatura para el año " + (sistaño.getAñoBase() + i) + ": ");
            temp = Lector.leerDouble();
            sistaño.registrarTemp(temp, i + sistaño.getAñoBase());
        }
        
        //Informar promedios anuales
        System.out.println("");
        System.out.println(sistaño.toString());
        
        //Informar el mes y año en el que se registró la mayor temperatura
        System.out.println("");
        System.out.println(sistaño.devolverMayorTemp());
        
        //Cargar el vector del sistema de informe mensual
        for (i = 0; i < 12; i++){
            System.out.print("Introduzca el promedio mensual histórico de temperatura para el mes " + (i+1) + ": ");
            temp = Lector.leerDouble();
            sistaño.registrarTemp(temp, i + sistaño.getAñoBase());
        }
        
        //Informar promedios anuales
        System.out.println("");
        System.out.println(sistaño.toString());
        
        //Informar el mes y año en el que se registró la mayor temperatura
        System.out.println("");
        System.out.println(sistmes.devolverMayorTemp());
    }
}
