/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales.ParcialGNC;

/**
 *
 * @author Gonzalo
 */
public class Venta {
    
    private String DNI;
    private int cantCombustible;
    private double montoAbonado;
    private String medioPago; // Efectivo, crédito o débito

    public Venta(String DNI, int cantCombustible, double montoAbonado, String medioPago) {
        this.setDNI(DNI);
        this.setCantCombustible(cantCombustible);
        this.getMontoAbonado();
        this.setMedioPago(medioPago);
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public int getCantCombustible() {
        return cantCombustible;
    }

    public void setCantCombustible(int cantCombustible) {
        this.cantCombustible = cantCombustible;
    }

    public double getMontoAbonado() {
        return montoAbonado;
    }

    public void setMontoAbonado(double montoAbonado) {
        this.montoAbonado = montoAbonado;
    }

    public String getMedioPago() {
        return medioPago;
    }

    public void setMedioPago(String medioPago) {
        this.medioPago = medioPago;
    }

    @Override
    public String toString() {
        return "Venta{" + "DNI=" + DNI + ", cantCombustible=" + cantCombustible + ", montoAbonado=" + montoAbonado + ", medioPago=" + medioPago + '}';
    }
}
