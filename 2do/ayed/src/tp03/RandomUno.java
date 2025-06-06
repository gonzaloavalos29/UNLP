package tp3;

public class RandomUno {
	public static int[] randomUno(int n) {
		int i, x = 0, k;
		int[] a = new int[n];
		for (i = 0; i < n; i++) {
			boolean seguirBuscando = true;
			while (seguirBuscando) {
				x = ran_int(0, n - 1);
				seguirBuscando = false;
				for (k = 0; k < i && !seguirBuscando; k++) {
					if (x == a[k]) {
						seguirBuscando = true;
					}
				}
			}
			a[i] = x;
		}
		return a;
	}

	private static int ran_int(int i, int j) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
