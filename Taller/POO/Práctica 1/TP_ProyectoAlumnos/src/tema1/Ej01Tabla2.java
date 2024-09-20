/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;

public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        GeneradorAleatorio.iniciar();
        int i = 0, num = 0;
        while ((num != 11) && (i < DF)) {
            num = GeneradorAleatorio.generarInt(12);
            tabla2[i]= num*2; 
            System.out.println("(" + i + ")" + "2x" + num + " = " + tabla2[i]);
            i++;
        }

    }
    
}
