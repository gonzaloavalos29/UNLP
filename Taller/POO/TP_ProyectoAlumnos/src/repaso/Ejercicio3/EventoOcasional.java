/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso.Ejercicio3;

public class EventoOcasional extends Recital {
    
    private String motivo; // A beneficio, Show de TV o Show Privado
    private String contratante;
    private int diaEvento;

    public EventoOcasional(String motivo, String contratante, int diaEvento, String nombreBanda, int cantTemas) {
        super(nombreBanda, cantTemas);
        this.motivo = motivo;
        this.contratante = contratante;
        this.diaEvento = diaEvento;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getContratante() {
        return contratante;
    }

    public void setContratante(String contratante) {
        this.contratante = contratante;
    }

    public int getDiaEvento() {
        return diaEvento;
    }

    public void setDiaEvento(int diaEvento) {
        this.diaEvento = diaEvento;
    }
    
    public void actuar() {
        if (this.getMotivo().toLowerCase().equals("Show de Beneficencia")) {
            System.out.println("Recuerden colaborar con: " + this.getContratante());
        } else if (this.getMotivo().toLowerCase().equals("Show de TV")) {
            System.out.println("Saludos amigos televidentes");
        } else {
            System.out.println("Un felíz cumpleaños para... " + this.getContratante());
        }
        super.actuar();
    }

    @Override
    public int calcularCosto() {
        int costo;
        if (this.getMotivo().toLowerCase().equals("show de tv")) {
            costo = 50000;
        } else if (this.getMotivo().toLowerCase().equals("show privado")) {
            costo = 150000;
        } else {
            costo = 0;
        }
        return costo;
    }
    
}
