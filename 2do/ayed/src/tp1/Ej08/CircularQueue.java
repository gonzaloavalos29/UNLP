package tp1.Ej08;

public class CircularQueue<T> extends Queue<T> {
	public T shift() {
		T data = dequeue();
		enqueue(data);
		return data;
	}
}
