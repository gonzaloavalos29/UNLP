package tp1.Ej03;

public class Profesor extends Persona {
	private String catedra;
	private String facultad;
	
	public Profesor(String nom, String apellido, String email, String catedra, String facultad) {
		super(nom, apellido, email);
		this.setCatedra(catedra);
		this.setFacultad(facultad);
	}
	
	public String getCatedra() {
		return this.catedra;
	}
	
	public String getFacultad() {
		return this.facultad;
	}
	
	public void setCatedra(String catedra) {
		this.catedra = catedra;
	}
	
	public void setFacultad(String facultad) {
		this.facultad = facultad;
	}
	
	public String tusDatos() {
		return super.tusDatos() + " Catedra=" + this.getCatedra() + " Facultad=" + this.getFacultad() + " ";
	}
}
