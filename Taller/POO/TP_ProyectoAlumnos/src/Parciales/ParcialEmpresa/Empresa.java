package Parciales.ParcialEmpresa;

import java.time.Clock;

/*
nombre, direccion, Director, vector de Encargados hasta N
 */

public class Empresa {
    private String nombre;
    private String direccion;
    private Director director;
    
    private Encargado [] vec_encargados;
    private int vec_dimF;
    
    public Empresa(String nombre, String direccion, Director unDirector, int numEncargados) {
        this.setNombre(nombre);
        this.setDireccion(direccion);
        this.setDirector(unDirector);
        
        //Este vector se inicializa con todos los valores en NULL
        this.vec_dimF = numEncargados;
        this.vec_encargados = new Encargado[this.vec_dimF];
    }

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Director getDirector() {
        return director;
    }
    public void setDirector(Director director) {
        this.director = director;
    }
    
    //Métodos
    public void asignarEncargado(Encargado unEncargado, int numSucursal) {
        if (this.vec_encargados[numSucursal] == null) {
            this.vec_encargados[numSucursal] = unEncargado;
        } else {
            System.out.println("ERROR: Ese lugar está ocupado");
        }
    }
    
    //toString
    //Retomar un String que represente la empresa, que contenga: nombre, dirección, representación del
    //Director y la representación de los Encargados junto a su número de sucursal. Indique si existe
    //alguna sucursal sin Encargado.
    public String toString() {
        String aux = "";
        
        //Empresa
        aux = "[EMPRESA: " + this.getNombre() + " / DIRECCIÓN: " + this.getDireccion() + "]\n";
        
        //Director
        aux = aux + "(DIRECTOR = " + this.getDirector().toString() + ")\n";
        
        //Encargados
        for (int i = 0; i < this.vec_dimF; i++) {
            if (this.vec_encargados[i] != null) {
                aux = aux + "(Nro. sucursal: " + (i+1) + " / " + this.vec_encargados[i].toString() + "\n)";
            } else {
                aux = aux + "(Sin encargado)" + "\n";
            }
        }
        
        //Devolver toString
        return aux;
    }
}