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
public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private int cantSubsidios;
    private Subsidio[] subsidios;

    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.cantSubsidios = 0;
        this.subsidios = new Subsidio[5];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    public void agregarSubsidio(Subsidio unSubsidio) {
        if (this.cantSubsidios < 5) {
            this.subsidios[this.cantSubsidios++] = unSubsidio;
        }
    }
    
    public double dineroTotal() {
        int i = 0;
        double aux = 0;
        while (i < this.cantSubsidios && this.subsidios[i].isOtorgado()) {
            aux += this.subsidios[i].getMonto();
            i++;
        }
        return aux;
    }
    
    public void otorgarSubsidios() {
        for (int i = 0; i < this.cantSubsidios; i++) {
            if (!this.subsidios[i].isOtorgado())
                this.subsidios[i].setOtorgado(true);
        }
    }

    @Override
    public String toString() {
        return "Investigador{" + "nombre=" + this.nombre + ", categoria=" + this.categoria + ", especialidad=" + this.especialidad + " TotalDinero= " + this.dineroTotal() + '}';
    }
    
    
}
