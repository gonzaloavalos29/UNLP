/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Gonzalo
 */
public class Jugador extends Empleado {
    private int partidosJugados = 0;
    private int golesAnotados = 0;

    public Jugador(String nombre, double sueldo, int antiguedad, int partidosJugados, int golesAnotados) {
        super(nombre, sueldo, antiguedad);
        this.setPartidosJugados(partidosJugados);
        this.setGolesAnotados(golesAnotados);
    }

    // Getters
    public int getPartidosJugados() {
        return partidosJugados;
    }
    
    public int getGolesAnotados() {
        return golesAnotados;
    }

    // Setters
    public void setPartidosJugados(int partidosJugados) {
        this.partidosJugados = partidosJugados;
    }

    public void setGolesAnotados(int golesAnotados) {
        this.golesAnotados = golesAnotados;
    }
    
    // Método heredado
    public double calcularEfectividad() {
        double calculo = (this.getGolesAnotados() / this.getPartidosJugados());
        return calculo;
    }
    public double calcularSueldoACobrar() {
        double calculo = this.calcularSueldoBasico();
        if (this.calcularEfectividad() > 0.5)
            calculo += this.getSueldo(); // Sumarle otro sueldo básico
        return calculo;
    }
}

