package ar.edu.unlp.objetos.uno.ejercicio19;

public class PoliticaDeCancelacionFlexible implements PoliticaDeCancelacion {
	@Override
	public double reembolsar(Reserva r) {
		return r.costo();
	}
}
