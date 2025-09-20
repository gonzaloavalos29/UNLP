package ar.edu.unlp.objetos.uno.presupuestos;

public class Item 
{
    private String detalle;
    private int cantidad;
    private float costoUnitario;
    
	public Item(String detalle, int cantidad, float costoUnitario) {
		this.detalle = detalle;
		this.cantidad = cantidad;
		this.costoUnitario = costoUnitario;
	}

	public String getDetalle() {
		return detalle;
	}

	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public float getCostoUnitario() {
		return costoUnitario;
	}

	public void setCostoUnitario(float costoUnitario) {
		this.costoUnitario = costoUnitario;
	}
	
	public double costo() {
		return getCantidad() * getCostoUnitario();
	}
    
}
