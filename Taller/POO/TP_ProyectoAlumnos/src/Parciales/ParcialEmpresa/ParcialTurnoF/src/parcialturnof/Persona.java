package parcialturnof;

/*
nombre, DNI, año de
ingreso a la empresa, sueldo básico
*/

public abstract class Persona {
    private String nombre;
    private int DNI;
    private int añoIngreso;
    private double sueldoBasico;

    //Constructor
    public Persona(String nombre, int DNI, int añoIngreso, double sueldoBasico) {
        this.setNombre(nombre);
        this.setDNI(DNI);
        this.setAñoIngreso(añoIngreso);
        this.setSueldoBasico(sueldoBasico);
    }
    
    //Getters y setters
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }
    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getAñoIngreso() {
        return añoIngreso;
    }
    public void setAñoIngreso(int añoIngreso) {
        this.añoIngreso = añoIngreso;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }
    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }
    
    //Retornar el sueldo a cobrar por los empleados (Encargados y Director). En ambos casos la
    //empresa incorpora al sueldo básico una comisión del 10% si supera los 20 años de antigüedad.
    
    //LO QUE TIENE EN COMÚN
    public double cobrarSueldo() {
        double aux = this.getSueldoBasico();
        if ((2023 - this.getAñoIngreso()) > 20) //Antiguedad
            aux = aux * 1.10;
        return aux;
    }
    
    @Override
    public String toString() {
        return "Nombre: " + nombre + " / DNI: " + DNI + " / Sueldo a cobrar: = " + this.cobrarSueldo(); //Binding dinámico
    }
}