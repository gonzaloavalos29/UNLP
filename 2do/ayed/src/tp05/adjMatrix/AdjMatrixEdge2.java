package tp05.adjMatrix;

public class AdjMatrixEdge2<T> implements Edge<T> {
	private Vertex<T> target;
	private int weight;
	
	/**
	 * Constructor de las aristas.  Solo se crean desde el grafo.
	 */
	AdjMatrixEdge(Vertex<T> target, int weight){
		this.target = target;
		this.weight = weight;
	}
	
	@Override
	public Vertex<T> getTarget() {
		return target;
	}

	@Override
	public int getWeight() {
		return weight;
	}
}
