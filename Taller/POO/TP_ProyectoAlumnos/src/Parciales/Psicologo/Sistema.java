/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales.Psicologo;

/**
 *
 * @author Gonzalo
 */
public class Sistema {
    
    private int maxDias = 5;
    private int maxTurnos = 6;
    private Paciente matriz_pacientes [][] = new Paciente[maxDias][maxTurnos];
    
    public Sistema() { // Constructor del sistema sin pacientes
    }
    
    public void agendarPaciente(Paciente p, int d, int t) { // Se asume que d y t son válidos y que el turno está libre
        this.matriz_pacientes[d][t] = p;
    }
    
    public void liberarPaciente(String nombrePaciente) {
        for (int i = 0; i < this.maxDias; i++) {
            for (int j = 0; j < this.maxTurnos; j++) {
                if (this.matriz_pacientes[i][j] != null) {
                    if (this.matriz_pacientes[i][j].getNombre().equals(nombrePaciente)) {
                        this.matriz_pacientes[i][j] = null;
                    }
                }
            }
        }
    }
    
    public boolean pacienteTieneTurno(int dia, String nombrePaciente) { // i es el día pasado por parámetro
        boolean tieneTurno = false;
        int turno = 0;
        while (turno < maxTurnos && !tieneTurno) {
            if (this.matriz_pacientes[dia][turno] != null) {
                if (this.matriz_pacientes[dia][turno].getNombre().equals(nombrePaciente)) {
                    tieneTurno = true;
                }
            }
            turno++;
        } 
        return tieneTurno;        
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < maxDias; i++) {
            aux = aux + "DÍA NÚMERO " + (i+1) + "\n";
            for (int j = 0; j < maxTurnos; j++) {
                aux = aux + "Turno nro. " + (j+1) + ": ";
                if (this.matriz_pacientes[i][j] != null) {
                    aux = aux + this.matriz_pacientes[i][j].toString();
                } else {
                    aux = aux + "vacío";
                }
                aux = aux + "\n";
            }
        }
        return aux;
    }
    
    
    
}
