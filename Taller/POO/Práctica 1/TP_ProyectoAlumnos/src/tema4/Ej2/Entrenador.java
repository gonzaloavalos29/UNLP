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
public class Entrenador extends Empleado {
    private int cantCampeonatosGanados;

    public Entrenador(int cantCampeonatosGanados, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.cantCampeonatosGanados = cantCampeonatosGanados;
    }

    public int getCantCampeonatosGanados() {
        return cantCampeonatosGanados;
    }

    public void setCantCampeonatosGanados(int cantCampeonatosGanados) {
        this.cantCampeonatosGanados = cantCampeonatosGanados;
    }
    
    public double calcularEfectividad() {
        return (getCantCampeonatosGanados() / this.getAntiguedad());
    }
    
}
