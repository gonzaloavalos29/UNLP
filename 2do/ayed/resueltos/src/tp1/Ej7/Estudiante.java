package tp1.Ej7;

public class Estudiante {

	private String apellido;
	private String nombre;
	private String email;
	private String facultad;
	
	public Estudiante(String apellido, String nombre, String email, String facultad) {
		this.setApellido(apellido);
		this.setNombre(nombre);
		this.setEmail(email);
		this.setFacultad(facultad);
	}
	
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFacultad() {
		return facultad;
	}
	public void setFacultad(String facultad) {
		this.facultad = facultad;
	}

	@Override
	public String toString() {
		return "Estudiante [apellido=" + this.apellido + ", nombre=" + this.nombre + ", email=" + this.email + ", facultad=" + this.facultad
				+ "]";
	}
	
	@Override
	public boolean equals(Object obj) {
		boolean result = false;
		if ((obj != null) && (obj instanceof Estudiante)) {
			Estudiante e = (Estudiante)obj;
			if ((e.getApellido() == this.getApellido()) && (e.getNombre() == this.getNombre()) && (e.getFacultad() == this.facultad) && (e.getEmail() == this.email));
			
		}
		return result;
	}
	
}
