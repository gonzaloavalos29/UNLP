package Parciales.ParcialEmpresa;

/*
cantidad de empleados a cargo
*/

public class Encargado extends Persona {
    private int cantEmpleados;

    public Encargado(String nombre, int DNI, int añoIngreso, double sueldoBasico, int cantEmpleados) {
        super(nombre, DNI, añoIngreso, sueldoBasico);
        this.setCantEmpleados(cantEmpleados);
    }
    
    public int getCantEmpleados() {
        return cantEmpleados;
    }
    public void setCantEmpleados(int cantEmpleados) {
        this.cantEmpleados = cantEmpleados;
    }
    
    //El Encargado tiene un adicional del 1000 pesos por cada empleado a cargo
    public double cobrarSueldo() {
        double aux = super.cobrarSueldo();
        double extra = this.getCantEmpleados() * 1000;
        return aux + extra;
    }
}