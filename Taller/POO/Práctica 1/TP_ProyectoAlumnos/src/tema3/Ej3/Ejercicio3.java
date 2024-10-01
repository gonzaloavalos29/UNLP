/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import PaqueteLectura.*;
import tema3.Ej3.Autor;
import tema3.Ej3.Estanteria;
import tema3.Ej3.Libro;
public class Ejercicio3 {
    
    public static void main(String[] args) {
        //En C se llamaria al nuevo constructor pasandole la dimf por parametro
        Estanteria estante1 = new Estanteria();
        GeneradorAleatorio.iniciar();
            
        int i;
        for(i=0;i<10;i++){
            Autor unAutor = new Autor(GeneradorAleatorio.generarString(8), GeneradorAleatorio.generarString(10), GeneradorAleatorio.generarString(5));
            Libro libro = new Libro(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarString(4),GeneradorAleatorio.generarInt(4), unAutor ,GeneradorAleatorio.generarString(4),GeneradorAleatorio.generarDouble(6));
            if(i == 5){
                libro.setTitulo("mujercitas");
            }
            estante1.agregarLibro(libro);
        }
        System.out.println(estante1.getCantLibros());
        System.out.println(estante1.estaLleno());
        System.out.println(estante1.devolverTitulo("mujercitas").getPrimerAutor().getNombre());
    }
}
