/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.Ej2;

/**
 *
 * @author chach
 */
public class Jugador extends Empleado {
    private int numPartidosJugados, numGolesAnotados;

    public Jugador(int numPartidosJugados, int numGolesAnotados, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.numPartidosJugados = numPartidosJugados;
        this.numGolesAnotados = numGolesAnotados;
    }

    public int getNumPartidosJugados() {
        return numPartidosJugados;
    }

    public void setNumPartidosJugados(int numPartidosJugados) {
        this.numPartidosJugados = numPartidosJugados;
    }

    public int getNumGolesAnotados() {
        return numGolesAnotados;
    }

    public void setNumGolesAnotados(int numGolesAnotados) {
        this.numGolesAnotados = numGolesAnotados;
    }
    
    public double calcularEfectividad() {
        return (getNumGolesAnotados() / getNumPartidosJugados());
    }
    
}
