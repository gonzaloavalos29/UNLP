/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5.Ej3;

/**
 *
 * @author chach
 */
public class EventoOcasional extends Recital {
    private int motivo; // 1. A beneficio - 2. Show de TV - 3. Show privado
    private String contratante;
    private int dia;

    public EventoOcasional(int motivo, String contratante, int dia, String nombreBanda, int cantMax) {
        super(nombreBanda, cantMax);
        this.motivo = motivo;
        this.contratante = contratante;
        this.dia = dia;
    }

    public int getMotivo() {
        return motivo;
    }

    public void setMotivo(int motivo) {
        this.motivo = motivo;
    }

    public String getContratante() {
        return contratante;
    }

    public void setContratante(String contratante) {
        this.contratante = contratante;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    @Override
    public int calcularCosto() {
        int aux;
        if (this.getMotivo() == 1) {
            aux = 0;
        } else {
            if (this.getMotivo() == 2) {
                aux = 50000;
            } else {
                aux = 150000;
            }
        }
        return aux;
    }

    
}
