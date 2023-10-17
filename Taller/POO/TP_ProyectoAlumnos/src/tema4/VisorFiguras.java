/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Gonzalo
 */
public class VisorFiguras {
    
    private int guardadas;
    private int capacidadMaxima = 5;
    private Figura [] vector;

    public VisorFiguras(){
        this.guardadas = 0;
        this.vector = new Figura[this.capacidadMaxima];
    }

    public void guardar(Figura f){
        if (this.quedaEspacio()) {
            this.vector[this.guardadas] = f;
            this.guardadas++;
        } else {
            System.out.println("ERROR: No queda más espacio libre.");
        }
    }

    public boolean quedaEspacio(){
        return (this.guardadas < this.capacidadMaxima);
    }

    public void mostrar(){
        int i;
        for (i = 0; i < this.guardadas; i++)
            System.out.println(this.vector[i].toString());
    }
    
    public int getGuardadas() {
        return this.guardadas;
    }
}
