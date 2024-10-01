/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.Ej1;


public class Ejercicio1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Circulo cir = new Circulo(5, "Rojo", "Azul");
        Cuadrado cua = new Cuadrado(5, "Rojo", "Azul");
        Triangulo tri = new Triangulo(2, 2, 2, 3, 4, "Rojo", "Azul");
        Rectangulo rec = new Rectangulo(5, 2.5, "Rojo", "Azul");
        System.out.println(cir.toString());
        System.out.println(cua.toString());
        System.out.println(tri.toString());
        System.out.println(rec.toString());
        cir.despintar();
        tri.despintar();
        System.out.println(cir.toString());
        System.out.println(tri.toString());
    }
}
