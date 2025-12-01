package ar.edu.unlp.objetos.uno.ejercicio23;

public class Conductor extends Usuario {
	private Vehiculo vehiculo;
	
	public Conductor(String nombre, double saldo, Vehiculo vehiculo) {
		super(nombre, saldo);
		this.vehiculo = vehiculo;
	}

	@Override
	protected double recargo() {
		double saldo = this.getSaldo();
		if (vehiculo.getAntiguedad() < 5) {
			saldo *= 0.01;
		} else {
			saldo *= 0.10;
		}
		return saldo;
	}

	@Override
	protected double bonificacion() {
		return this.vehiculo.getValor() * 0.001;
	}
}
