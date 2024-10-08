/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5.Ej4;

/**
 *
 * @author chach
 */
public class Corista extends Persona {
    private int tono;

    public Corista(String nombre, int dni, int edad, int tono) {
        super(nombre, edad, dni);
        this.tono = tono;
    }

    public int getTono() {
        return tono;
    }

    public void setTono(int tono) {
        this.tono = tono;
    }

    @Override
    public String toString() {
        return "Corista{" + super.toString() + " tono=" + tono + '}';
    }
}
