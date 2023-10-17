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
public class Entrenador extends Empleado {
    private int campeonatosGanados = 0;
    
    public Entrenador(String nombre, double sueldo, int antiguedad, int campeonatosGanados) {
        super(nombre, sueldo, antiguedad);
        this.setCampeonatosGanados(campeonatosGanados);
    }

    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }
    
    public double calcularEfectividad() {
        double calculo = (this.getCampeonatosGanados() / this.getAntiguedad());
        return calculo;
    }
    
    public double calcularSueldoACobrar() {
        double calculo = this.calcularSueldoBasico();
        
        // Se adiciona un plus por campeonatos ganados
        if (this.getCampeonatosGanados() > 0 || this.getCampeonatosGanados() <= 4) {
            calculo += 5000;
        } else if (this.getCampeonatosGanados() >= 5 || this.getCampeonatosGanados() <= 10) {
            calculo += 30000;
        } else if (this.getCampeonatosGanados() > 10) {
            calculo += 50000;
        }
        
        return calculo;
    }
    
}
