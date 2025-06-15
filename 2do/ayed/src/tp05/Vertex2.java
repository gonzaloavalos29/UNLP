package tp05;

public interface Vertex2<T> {
	
	/**
	 * Retorna el dato del vértice.
	 * 
	 * @return
	 */
	public T getData();

	/**
	 * Reemplaza el dato del vértice.
	 * 
	 * @param dato
	 */
	public void setData(T data);

	/**
	 * Retorna la posición del vértice en el grafo.
	 * 
	 * @return
	 */
	public int getPosition();
}
