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
public class Estacion {
    
    private String direccion;
    private double precio; // x metro cúbico
    private int dimF = 6;
    private int dimL = 0;
    private Surtidor [] vec_surtidores = new Surtidor[dimF];

    public Estacion(String direccion, double precio) {
        this.setDireccion(direccion);
        this.setPrecio(precio);
        for (int i = 0; i < dimF; i++) {
            vec_surtidores[i] = new Surtidor(false, 0);
        }
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
    public void agregarSurtidor(Surtidor s) {
        if (this.dimL < this.dimF) {
            vec_surtidores[dimL] = s;
            dimL++;
        } else {
            System.out.println("Vector lleno.");
        }
    }
    
    public void generarVenta(int nroSurtidor, String nroDNI, int cantM3, String formaPago) {
        Venta unaVenta = new Venta(nroDNI, cantM3, cantM3 * this.getPrecio(), formaPago);
        this.vec_surtidores[nroSurtidor].agregarVenta(unaVenta);
    }
    
    public void marcarFuera(int cantCombustible) {
        for (int i = 0; i < this.dimF; i++) {
            if (this.vec_surtidores[i].obtenerCantCombustible() < cantCombustible) {
                this.vec_surtidores[i].setEstaFueraDeServicio(true);
            }
        }
    }
    
    public void maxVentaEstacion() {
        double max = -1;
        Venta maxVenta = null;
        for (int i = 0; i < this.dimF; i++) {
            if (this.vec_surtidores[i].maxVentaSurtidor().getMontoAbonado() > max) {
                max = this.vec_surtidores[i].maxVentaSurtidor().getMontoAbonado();
                maxVenta = this.vec_surtidores[i].maxVentaSurtidor();
                System.out.println("La venta máxima de toda la estación es: " + maxVenta.toString());
            }
        }
    }

    @Override
    public String toString() {
        String aux = "";
        aux += "Estación: " + this.getDireccion() + "\n" + "Precio: " + this.getPrecio();
        for (int i = 0; i < dimL; i++) {
            aux += this.vec_surtidores[i].toString();
        }
        return aux;
    }
}
