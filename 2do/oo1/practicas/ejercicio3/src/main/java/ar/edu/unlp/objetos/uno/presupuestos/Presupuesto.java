package ar.edu.unlp.objetos.uno.presupuestos;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Presupuesto {

	private LocalDate fecha;
	private String cliente;
	List<Item> item = new ArrayList();
	
	public Presupuesto(String cliente) {
		this.fecha = LocalDate.now();
		this.cliente = cliente;
	}
	
	public LocalDate getFecha() {
		return fecha;
	}
	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}
	public String getCliente() {
		return cliente;
	}
	public void setCliente(String cliente) {
		this.cliente = cliente;
	}
	
	public void agregarItem(Item item) {
		this.item.add(item);
	}
	
	public float calcularTotal() {
		float total = 0;
		for (Item i: item) {
			total += i.costo();
		}
		return total;
	}
	
}
