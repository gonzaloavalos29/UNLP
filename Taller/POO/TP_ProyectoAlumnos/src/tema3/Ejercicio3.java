/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.*;
public class Ejercicio3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estanteria estante1 = new Estanteria();
        GeneradorAleatorio.iniciar();
        String nom;
        int i;
        for(i=0;i<10;i++){
            Libro libro = new Libro(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarString(4),GeneradorAleatorio.generarInt(4),GeneradorAleatorio.generarString(4),GeneradorAleatorio.generarString(4),GeneradorAleatorio.generarDouble(6));
            if(i == 5){
                libro.setTitulo("mujercitas");
            estante1.agregarLibro(libro);
            }
        }
        System.out.println(estante1.devolverTitulo("mujercitas").getPrimerAutor());
    }
    
}
