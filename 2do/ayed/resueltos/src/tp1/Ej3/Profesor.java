package tp1.Ej3;

public class Profesor extends Persona {

	private String catedra;
	private String facultad;
	
	public Profesor(String nom, String ape, String email, String catedra, String facultad) {
		super(nom, ape, email);
		this.setCatedra(catedra);
		this.setFacultad(facultad);
		
	}

	public String getCatedra() {
		return catedra;
	}

	public void setCatedra(String catedra) {
		this.catedra = catedra;
	}

	public String getFacultad() {
		return facultad;
	}

	public void setFacultad(String facultad) {
		this.facultad = facultad;
	}

	@Override
	public String toString() {
		return super.toString()	+ " Catedra=" + this.getCatedra() + " Facultad=" + this.getFacultad() + " ";
 	}
	

	
}
