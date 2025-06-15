package tp05;

public interface Edge2<T> {
	
	/**
	 * Retorna el vértice destino de la arista.
	 * 
	 * @return
	 */
	public Vertex<T> getTarget();
	
	/**
	 * Retorna el peso de la arista
	 * 
	 * @return
	 */
	public int getWeight();

}
