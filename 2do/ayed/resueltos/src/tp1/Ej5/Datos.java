package tp1.Ej5;

public class Datos {

	private int max;
	private int min;
	private double prom;
	
	public Datos() {
		
	}
	
	public Datos(int max, int min, double prom) {
		this.setMax(max);
		this.setMin(min);
		this.setProm(prom);
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public double getProm() {
		return prom;
	}

	public void setProm(double prom) {
		this.prom = prom;
	}

	@Override
	public String toString() {
		return "Datos [max=" + this.getMax() + ", min=" + this.getMin() + ", prom=" + this.getProm() + "]";
	}
	
}
