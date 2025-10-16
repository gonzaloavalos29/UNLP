package ar.edu.unlp.objetos.uno.ejercicio4;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Ticket{

	private LocalDate fecha;
	private int cantidadDeProductos;
	private double pesoTotal;
	private double precioTotal;
	
	public Ticket(int cantidadDeProductos, double pesoTotal, double precioTotal) {
		this.fecha = LocalDate.now();
		this.cantidadDeProductos = cantidadDeProductos;
		this.pesoTotal = pesoTotal;
		this.precioTotal = precioTotal;
	}
	
	public double impuesto() {
		return this.getPrecioTotal() * 0.21;
	}
	public int getCantidadDeProductos() {
		return cantidadDeProductos;
	}
	public double getPesoTotal() {
		return pesoTotal;
	}
	public double getPrecioTotal() {
		return precioTotal;
	}
	public LocalDate getFecha() {
		return this.fecha;
	}
}
