package ar.edu.unlp.objetos.uno.ejercicio19;

public class PoliticaDeCancelacionModerada implements PoliticaDeCancelacion {
	@Override
	public double reembolsar(Reserva r) {
		if (r.cantDias() >= 7) {
			return r.costo();
		}
		if (r.cantDias() > 2) {
			return r.costo() * 0.5;
		}
		return 0;
	}
}
