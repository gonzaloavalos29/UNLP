/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.Ej5;

import tema4.Ej1.*;


public abstract class Figura {
    private String colorRelleno;
    private String colorLinea;
   
    public Figura(String unCR, String unCL){
        setColorRelleno(unCR);
        setColorLinea(unCL);
    }
    
    public String toString(){
        String aux = "Perímetro: " + this.calcularPerimetro() +
                     " | Area: " + this.calcularArea() +
                     " | CR: "  + getColorRelleno() + 
                     " | CL: " + getColorLinea();             
        return aux;
    }

    public String getColorRelleno(){
        return colorRelleno;       
    }
    public void setColorRelleno(String unColor){
        colorRelleno = unColor;       
    }
    public String getColorLinea(){
        return colorLinea;       
    }
    public void setColorLinea(String unColor){
        colorLinea = unColor;       
    }
    
    public void despintar() {
        this.setColorLinea("Negro");
        this.setColorRelleno("Blanco");
    }
    
    public abstract double calcularArea();
    public abstract double calcularPerimetro();
     
}
