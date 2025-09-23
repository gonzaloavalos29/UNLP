package ar.edu.unlp.oo1.ejercicio2;

import java.time.LocalDate;

public class Ticket extends Balanza {

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
		return this.precioTotal * 0.21;
	}
	
	@Override
	public String toString() {
		return "Ticket [fecha=" + fecha + ", cantidadDeProductos=" + cantidadDeProductos + ", pesoTotal=" + pesoTotal
				+ ", precioTotal=" + precioTotal + "]";
	}

	public LocalDate getFecha() {
		return fecha;
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
	
	
}
