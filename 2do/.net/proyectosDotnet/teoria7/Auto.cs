namespace teoria7;
using System;

public class Auto : Ivendible, Ilavable, Ireciclable {
    // Ivendible
    public void SeVendeA(Persona p) {
        Console.WriteLine("Vendiendo auto a persona");
    }

    // ILavable
    public void SeLava() {
        Console.WriteLine("Lavando auto");
    }

    public void SeSeca() {
        Console.WriteLine("Secando auto");
    }

    // IReciclable
    public void SeRecicla() {
        Console.WriteLine("Reciclando auto");
    }
}