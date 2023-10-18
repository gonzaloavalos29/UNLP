/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso.Ejercicio1;

/**
 *
 * @author Gonzalo
 */
public class Subsidio {
    
    private double monto;
    private String motivo;
    private boolean otorgado = false;

    public Subsidio(double monto, String motivo) {
        this.setMonto(monto);
        this.setMotivo(motivo);
    }

    //Getters
    public double getMonto() {
        return monto;
    }
    public String getMotivo() {
        return motivo;
    }
    public boolean getOtorgado() {
        return otorgado;
    }

    //Setters
    public void setMonto(double monto) {
        this.monto = monto;
    }
    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }
    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
}
