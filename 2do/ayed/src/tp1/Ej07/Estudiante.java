package tp1.Ej07;

public class Estudiante {
	private String apellido;
	private String nombre;
	private String email;
	private String facultad;
	public Estudiante(String apellido, String nombre, String email, String facultad) {
		this.apellido = apellido;
		this.nombre = nombre;
		this.email = email;
		this.facultad = facultad;
	}
	public String getApellido() {
		return apellido;
	}
	public String getNombre() {
		return nombre;
	}
	public String getEmail() {
		return email;
	}
	public String getFacultad() {
		return facultad;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setFacultad(String facultad) {
		this.facultad = facultad;
	}
	@Override
	public String toString() {
		return "Estudiante [apellido=" + apellido + ", nombre=" + nombre + ", email=" + email + ", facultad=" + facultad
				+ "]";
	}
	
	@Override
	public boolean equals(Object obj) {
		boolean result = false;
		if ((obj != null) && (obj instanceof Estudiante)) {
			Estudiante e = (Estudiante)obj;
			if ((e.getApellido() == this.getApellido()) && (e.getNombre() == this.getNombre()) && (e.getFacultad() == this.facultad) && (e.getEmail() == this.email)) 
				result = true;
		}
		return result;
	}
	
	
}
