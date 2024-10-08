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
public class CoroHileras extends Coro {
    private int DIMF,DIMC,filas=0,columnas=0;
    private Persona matriz [] [];
    
    
    public CoroHileras(Persona director, String nombreDelCoro,int filas,int columnas){
        super(director,nombreDelCoro);
        this.DIMC=columnas;
        this.DIMF=filas;
        matriz = new Persona [DIMF][DIMC];
    }

    public int getFilas() {
        return filas;
    }

    public void setFilas(int filas) {
        this.filas = filas;
    }

    public int getColumnas() {
        return columnas;
    }

    public void setColumnas(int columnas) {
        this.columnas = columnas;
    }
    
    @Override
    public void agregarCorista(Persona unCorista){
        if((columnas<DIMC)&&(filas<DIMF)){
            matriz[filas][columnas] = unCorista;
            this.filas++;
        }else{
            if(columnas<DIMC){
                this.columnas++;
                filas=0;
                matriz[filas][columnas]=unCorista;
            }else{
                System.out.println("No hay mas espacio en el coro");
            }
        }
    }
    
    @Override
    public boolean estaLleno(){
        boolean aux=false;
        if((this.filas==DIMF)&&(this.columnas==DIMC)){
            aux=true;    
        }
        return aux;       
    }
    
    @Override
    public boolean bienFormado(){
        boolean aux=true;
        int x=0,y;
        while((x<this.filas-1)&&(aux==true)){
            y=0;
            while((y<this.columnas)&&(aux==true)){
                if(matriz[x][y].getTonoOAntiguadad()!=matriz[x+1][y].getTonoOAntiguadad()){
                    aux=false;
                }
                y++;
            } 
            x++;
        }
        if(aux==true){
            x=0;
            while((x<this.columnas-1)&&(aux==true)){
                y=0;
                while((y<this.filas)&&(aux==true)){
                    if(matriz[x][y].getTonoOAntiguadad()<matriz[x][y+1].getTonoOAntiguadad())
                        aux=false;
                    y++;
                }  
                x++;
           }   
        }
        return aux;
    }
    
    
}
