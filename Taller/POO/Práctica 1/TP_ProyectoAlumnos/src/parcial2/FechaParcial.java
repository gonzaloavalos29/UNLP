/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;

/**
 *
 * @author chach
 */
public class FechaParcial {
    private int cantSalas;
    private int cantAlumnos;
    private Estudiante[][] matriz;
    private int [] vector;
    
    public FechaParcial(int n, int m) {
        this.cantSalas = n;
        this.cantAlumnos = m;
        this.matriz = new Estudiante[this.cantSalas][this.cantAlumnos];
        this.vector = new int[this.cantSalas];
        for (int i = 0; i < this.cantSalas; i++) {
            this.vector[i] = 0;
        }
        for (int i = 0; i < this.cantSalas; i++) {
            for (int j = 0; j < this.cantAlumnos; j++) {
                this.matriz[i][j] = new Estudiante("NADA", 0);
            }
        }
    }
    
    public void agregarEstudiante(Estudiante e, int n) {
        this.matriz[n][this.vector[n]++] = e;
    }
    
    public void temas(int m) {
        for (int i = 0; i < this.cantSalas; i++) {
            for (int j = 0; j < this.vector[i]; j++) {
                this.matriz[i][j].asignarTema(m);
            }
        }
    }
    
    private String concatenador(int m){
        String aux = "";
        int i, j;
        for(i=0;i<this.cantSalas;i++){
            for(j=0;j<this.vector[i];j++){
                if(this.matriz[i][j].getNumeroTema() == m){
                    aux = aux + matriz[i][j].toString();
                }
            }
        }
        return aux;
    }
    
    public String toString(int m) {
        return this.concatenador(m);
    }
    
    public int getCantSalas(){
        return cantSalas;
    }

    public int getCantAlumnos() {
        return cantAlumnos;
    }

    private Estudiante[][] getMatriz() {
        return matriz;
    }

    private int[] getVector() {
        return vector;
    }
}
