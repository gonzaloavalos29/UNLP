package tp3.Ej4;

public class AreaEmpresa {

	private String identificacion;
	private int tardanza;
	
	public AreaEmpresa(String id, int tard) {
		this.identificacion = id;
		this.tardanza = tard;
	}

	public String getIdentificacion() {
		return identificacion;
	}

	public int getTardanza() {
		return tardanza;
	}

	public void setIdentificacion(String identificacion) {
		this.identificacion = identificacion;
	}

	public void setTardanza(int tardanza) {
		this.tardanza = tardanza;
	}
	
}
