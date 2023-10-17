package tema3;

import tema2.Persona;

public class Habitacion {
    private double costo;
    private boolean ocupada;
    private Persona cliente;
    
    public Habitacion(double unCosto, boolean estaOcupada, Persona unCliente){
        costo = unCosto;
        ocupada = estaOcupada;
        cliente = unCliente;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public boolean getOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public Persona getCliente() {
        return cliente;
    }

    public void setCliente(Persona cliente) {
        this.cliente = cliente;
    }
    
    @Override
    public String toString() {
        return "Habitacion{" + "costo=" + costo + ", ocupada=" + ocupada + ", cliente=" + cliente + '}';
    }
}
