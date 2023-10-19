package parcialturnof;

/*
monto destinado a viáticos
*/

public class Director extends Persona {
    private double montoViaticos;
    
    public Director(String nombre, int DNI, int añoIngreso, double sueldoBasico, double montoViaticos) {
        super(nombre, DNI, añoIngreso, sueldoBasico);
        this.setMontoViaticos(montoViaticos);
    }

    public double getMontoViaticos() {
        return montoViaticos;
    }
    public void setMontoViaticos(double montoViaticos) {
        this.montoViaticos = montoViaticos;
    }
    
    //El Director recibe el monto destinado a viáticos
    public double cobrarSueldo() {
        double aux = super.cobrarSueldo();
        double extra = this.getMontoViaticos();
        return aux + extra;
    }
}