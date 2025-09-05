using System;

public class Hora {
    private int Horas;
    private int Minutos;
    private double Segundos;

    // Constructor tradicional
    public Hora(int Horas, int Minutos, double Segundos) {
        this.Horas = Horas;
        this.Minutos = Minutos;
        this.Segundos = Segundos;
    }

    // Constructor con valor decimal
    public Hora(double tm) {
        this.Horas = (int)Math.Floor(tm);
        double minutosTotales = (tm - this.Horas) * 60;
        this.Minutos = (int)Math.Floor(minutosTotales);
        this.Segundos = (minutosTotales - this.Minutos) * 60;
    }

    // Método Imprimir
    public void Imprimir() {
        if (Math.Floor(this.Segundos) == this.Segundos) {
            Console.WriteLine($"{this.Horas} horas, {this.Minutos} minutos y {(int)this.Segundos} segundos");
        } else {
            Console.WriteLine($"{this.Horas} horas, {this.Minutos} minutos y {this.Segundos:0.000} segundos");
        }
    }
}
