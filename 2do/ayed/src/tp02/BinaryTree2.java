package tp02;

public class BinaryTree2<T> {
	private T data;
	private BinaryTree2<T> leftChild;
	private BinaryTree2<T> rightChild;
	
	public BinaryTree2(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public BinaryTree2<T> getLeftChild() {
		return leftChild;
	}

	public BinaryTree2<T> getRightChild() {
		return rightChild;
	}

	public void addLeftChild(BinaryTree2<T> child) {
		this.leftChild = child;
	}
	
	public void addRightChild(BinaryTree2<T> child) {
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
	
	public BinaryTree2<T> espejo() {
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
		BinaryTree2<Integer> ab = new BinaryTree2<Integer>(40);
		BinaryTree2<Integer> hijoIzquierdo = new BinaryTree2<Integer>(25);
		hijoIzquierdo.addLeftChild(new BinaryTree2<Integer>(10));
		hijoIzquierdo.addRightChild(new BinaryTree2<Integer>(32));
		BinaryTree2<Integer> hijoDerecho = new BinaryTree2<Integer>(78);
		ab.addLeftChild(hijoIzquierdo);
		ab.addRightChild(hijoDerecho);
		ab.printPreOrden();
	}
	
}
