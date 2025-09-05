package tp1.Ej1;

public class Clase1 {
	
	public static void conFor(int a, int b) {
		for (int i = a; i < b+1; i++)
			System.out.println(i);
	}
	
	public static void conWhile(int a, int b) {
		int i = a;
		while (i <= b) {
			System.out.println(i);
			i++;
		}
	}
	
	public static void conRecursion(int a, int b) {
		if (a <= b) {
			System.out.println(a);
			conRecursion(a+1, b);
		}
	}
}
