/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author chach
 */
public class Parcial2 {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        FechaParcial fp1;
        Estudiante e;
        
        fp1 = new FechaParcial(2, 4);
        
        int i, j;
        for(i=0;i<2;i++){
            for(j=0;j<4;j++){
                e = new Estudiante(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarInt(20));
                fp1.agregarEstudiante(e, i);
            }
        }
        
        fp1.temas(1);
        System.out.println(fp1.toString(1));
    }
}
