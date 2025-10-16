package tp1.Ej3;

public class Estudiante extends Persona{

	private String comision;
	private String direccion;
	
	public Estudiante() {
		
	}
	
	public Estudiante(String nombre, String apellido, String email, String comision, String direccion) {
		super(nombre, apellido, email);
		this.comision = comision;
		this.direccion = direccion;
	}
	
	public String getComision() {
		return comision;
	}
	public void setComision(String comision) {
		this.comision = comision;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	
	@Override
	public String tusDatos() {
		return super.toString() + " Comision=" + this.getComision() + " Direccion=" + this.getDireccion();
  	}
	
}
