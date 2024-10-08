/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej4p5;

/**
 *
 * @author Alumno
 */
public class CoroSemiCircular extends Coro{
    private int diml=0,DIMF;
    private Persona vector [];
    
    public CoroSemiCircular (Persona director, String nombreDelCoro,int cantCoristas){
        super(director,nombreDelCoro);
        this.DIMF=cantCoristas;
        vector = new Persona [DIMF];
    }
    
    
    
    public int getDiml() {
        return diml;
    }

    public void setDiml(int diml) {
        this.diml = diml;
    }
    
    @Override
    public void agregarCorista(Persona unCorista){
        if(diml<DIMF){
            vector[diml] = unCorista;
            this.diml++;
        }else{
            System.out.println("No hay mas espacio en el coro");
        }
    }
    
    @Override
    public boolean estaLleno(){
        boolean aux=false;
        if(this.diml==this.DIMF)
            aux=true;
        return aux;
    }
    
    @Override
    public boolean bienFormado(){
        boolean aux=true;
        int x=0;
        while((x<this.diml-1)&&(aux==true)){
            if(vector[x+1].getTonoOAntiguadad()>vector[x].getTonoOAntiguadad())
                aux=false;
            x++;    
        }
        return aux;
    }
    
}
