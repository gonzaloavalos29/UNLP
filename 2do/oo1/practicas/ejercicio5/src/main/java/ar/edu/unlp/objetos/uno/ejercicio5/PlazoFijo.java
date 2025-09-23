package ar.edu.unlp.objetos.uno.ejercicio5;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class PlazoFijo implements Inversion{
	private LocalDate fechaDeConstitucion;
	private double montoDepositado;
	private double porcentajeDeInteresDiario;
	public PlazoFijo(LocalDate fechaDeConstitucion, double montoDepositado, double porcentajeDeInteresDiario) {
		this.fechaDeConstitucion = fechaDeConstitucion;
		this.montoDepositado = montoDepositado;
		this.porcentajeDeInteresDiario = porcentajeDeInteresDiario;
	}
	
	public double valorActual() {
		double cantDias = ChronoUnit.DAYS.between(fechaDeConstitucion, LocalDate.now()); // ChronoUnit.DAYS.between(fecInicio, fecFin)
		return this.montoDepositado + (this.montoDepositado * this.porcentajeDeInteresDiario/100 * cantDias);
	}
	
}
