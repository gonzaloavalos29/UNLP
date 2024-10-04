/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5.Ej1;

/**
 *
 * @author chach
 */
public class Proyecto {
    private String nombre;
    private int codigo;
    private String director;
    private int cantInvestigadores;
    private Investigador[] investigadores;

    public Proyecto(String nombre, int codigo, String director) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.director = director;
        this.cantInvestigadores = 0;
        this.investigadores = new Investigador[50];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public int getCantInvestigadores() {
        return cantInvestigadores;
    }

    public void setCantInvestigadores(int cantInvestigadores) {
        this.cantInvestigadores = cantInvestigadores;
    }
    
    public void agregarInvestigador(Investigador unInvestigador) {
        if (this.cantInvestigadores < 50) {
            this.investigadores[this.cantInvestigadores] = unInvestigador;
            cantInvestigadores++;
        }
    }
    
    public double dineroTotalOtorgado() {
        double aux = 0;
        for (int i = 0; i < this.cantInvestigadores; i++) {
            aux += this.investigadores[i].dineroTotal();
        }
        return aux;
    }
    
    public void otorgarTodos(String nombre) {
        int i = 0;
        while (i < this.cantInvestigadores && !this.investigadores[i].getNombre().equals(nombre))
            i++;
        if (i < this.cantInvestigadores)
            this.investigadores[i].otorgarSubsidios();
    }

    @Override
    public String toString() {
        String aux = "Nombre= " + this.nombre + " Codigo= " + this.codigo + " Director=" + this.nombre + " DineroOtorgado= " + this.dineroTotalOtorgado() + "\n";
        for (int i = 0; i < this.cantInvestigadores; i++) {
            aux += this.investigadores[i].toString() + "\n";
        }
        return aux;
    }
}
