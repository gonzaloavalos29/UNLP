package tp2;

public class BinaryTree<T> {
	private T data;
	private BinaryTree<T> leftChild;
	private BinaryTree<T> rightChild;
	
	public BinaryTree(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public BinaryTree<T> getLeftChild() {
		return leftChild;
	}

	public BinaryTree<T> getRightChild() {
		return rightChild;
	}

	public void addLeftChild(BinaryTree<T> child) {
		this.leftChild = child;
	}
	
	public void addRightChild(BinaryTree<T> child) {
		this.rightChild = child;
	}
	
	public void removeLeftChild() {
		this.leftChild = null;
	}
	
	public void removeRightChild() {
		this.rightChild = null;
	}
	
	public boolean isEmpty() {
		return (this.isLeaf() && this.getData() == null);
	}
	
	public boolean isLeaf() {
		return (!this.hasLeftChild() && !this.hasRightChild());
	}
	
	public boolean hasLeftChild() {
		return this.leftChild != null;
	}
	
	public boolean hasRightChild() {
		return this.rightChild != null;
	}
	
	@Override
	public String toString() {
		return this.getData().toString();
	}
	
	public int contarHojas() {
		return 0;
	}
	
	public BinaryTree<T> espejo() {
		return null;
	}
	
	public void entreNiveles(int n, int m) {
		
	}
	
	// Recorrido pre-orden
	public void printPreOrden() {
		System.out.println(this.getData() + "///");
		if (this.hasLeftChild()) {
			this.getLeftChild().printPreOrden();
		}
		if (this.hasRightChild()) {
			this.getRightChild().printPreOrden();
		}
	}
	// Método principal que ejecuta el programa
	public static void main(String[] args) {
		// Se instancia el siguiente árbol de ejemplo
		// Pre orden
		// Se procesa primero la raíz y luego sus hijos izquierdo y derecho.
		BinaryTree<Integer> ab = new BinaryTree<Integer>(40);
		BinaryTree<Integer> hijoIzquierdo = new BinaryTree<Integer>(25);
		hijoIzquierdo.addLeftChild(new BinaryTree<Integer>(10));
		hijoIzquierdo.addRightChild(new BinaryTree<Integer>(32));
		BinaryTree<Integer> hijoDerecho = new BinaryTree<Integer>(78);
		ab.addLeftChild(hijoIzquierdo);
		ab.addRightChild(hijoDerecho);
		ab.printPreOrden();
	}
	
}
