package ar.edu.unlp.oo1.ejercicio2;

import java.util.ArrayList;
import java.util.List;

import ar.edu.unlp.objetos.uno.ejercicio4.Producto;

public class Balanza {
	
	private int cantidadDeProductos;
	private double precioTotal;
	private double pesoTotal;
	List<Producto> productos = new ArrayList();
	
	public void ponerEnCero() {
		this.cantidadDeProductos = 0;
		this.precioTotal = 0;
		this.pesoTotal = 0;
	}
	
	public void agregarProducto(Producto p) {
		this.cantidadDeProductos++;
		this.precioTotal += p.getPrecio();
		this.pesoTotal += p.getPeso();
	}
	public int getCantidadDeProductos() {
		return this.cantidadDeProductos;
	}
	public double getPrecioTotal() {
		return this.precioTotal;
	}
	public double getPesoTotal() {
		return this.pesoTotal;
	}

	public Ticket emitirTicket() {
		Ticket tick = new Ticket(this.cantidadDeProductos, this.pesoTotal, this.precioTotal);
		return tick;
	}
	
	public List<Producto> getProductos() {
		Producto prod;
		this.productos.add(prod.ag);
		return this.productos;
	}
	
}
