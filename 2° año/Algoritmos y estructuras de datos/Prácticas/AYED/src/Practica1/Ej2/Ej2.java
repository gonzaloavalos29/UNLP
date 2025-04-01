package Practica1.Ej2;

import java.util.Scanner;

public class Ej2 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		System.out.println("Ingrese el numero");
		int num = s.nextInt();
		int arreglo[] = ClaseEj2.multiplosVector(num);
		for (int i = 0; i < num; i++) {
			System.out.print(arreglo[i] + " | ");
		}
	}
	
}
