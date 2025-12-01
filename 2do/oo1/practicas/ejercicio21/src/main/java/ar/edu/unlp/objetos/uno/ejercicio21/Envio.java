package ar.edu.unlp.objetos.uno.ejercicio21;

import java.time.LocalDate;

public abstract class Envio {
	private LocalDate fechaDespacho;
	private String dirOrigen;
	private String dirDestino;
	private double peso;
	
	public Envio(LocalDate fechaDespacho, String dirOrigen, String dirDestino, double peso) {
		super();
		this.fechaDespacho = fechaDespacho;
		this.dirOrigen = dirOrigen;
		this.dirDestino = dirDestino;
		this.peso = peso;
	}
	
	public LocalDate getFechaDespacho() {
		return this.fechaDespacho;
	}
	
	public String getDirOrigen() {
		return this.dirOrigen;
	}
	
	public String getDirDestino() {
		return this.dirDestino;
	}
	
	public double getPeso() {
		return this.peso;
	}
	
	public abstract double getMonto();
}
