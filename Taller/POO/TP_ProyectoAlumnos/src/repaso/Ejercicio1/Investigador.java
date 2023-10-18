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
public class Investigador {
    
    private String nombre;
    private int categoria;
    private String especialidad;
    
    private Subsidio [] vec_subsidios = new Subsidio [5];
    private int vec_dimL = 0;

    //Constructor
    public Investigador(String nombre, int categoria, String especialidad) {
        this.setNombre(nombre);
        this.setCategoria(categoria);
        this.setEspecialidad(especialidad);
    }
    
    //Getters
    public String getNombre() {
        return nombre;
    }
    public int getCategoria() {
        return categoria;
    }
    public String getEspecialidad() {
        return especialidad;
    }

    //Setters
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }
    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    //Otros métodos
    public void agregarSubsidio(Subsidio unSubsidio) {
        if (this.vec_dimL < 5) {
            this.vec_subsidios[this.vec_dimL] = unSubsidio;
            this.vec_dimL++;
        } else {
            System.out.println("ERROR: No pueden entrar mas elementos en el vector");
        }
    }
    public double getDineroOtorgado() {
        double aux = 0;
        for (int i = 0; i < this.vec_dimL; i++) {
            if (this.vec_subsidios[i].getOtorgado()) {
                aux += this.vec_subsidios[i].getMonto();
            }
        }
        return aux;
    }
    public void otorgarSubsidios() {
        for (int i = 0; i < this.vec_dimL; i++)
            this.vec_subsidios[i].setOtorgado(true);
    }
}
