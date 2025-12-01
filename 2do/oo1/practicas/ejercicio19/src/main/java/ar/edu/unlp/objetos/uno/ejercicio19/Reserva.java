package ar.edu.unlp.objetos.uno.ejercicio19;

import java.time.LocalDate;

public class Reserva {
	private DateLapse periodo;
	private Propiedad propiedad;
	private Usuario inquilino;
	
	public Reserva(DateLapse p, Propiedad prop, Usuario inquilino) {
		super();
		this.periodo = p;
		this.propiedad = prop;
		this.inquilino = inquilino;
	}
	
	public boolean isDisponible(DateLapse p) {
		return this.periodo.overlapse(p);
	}
	
	public int cantDias() {
		return this.periodo.sizeInDays();
	}
	
	public double costo() {
		return this.cantDias() * this.propiedad.getPrecioNoche();
	}
	
	public boolean estaEnCurso() {
		LocalDate hoy = LocalDate.now();
		return !this.periodo.getFrom().isAfter(hoy) && !this.periodo.getTo().isBefore(hoy);
	}
}
