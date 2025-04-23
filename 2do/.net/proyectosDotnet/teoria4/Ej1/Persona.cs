class Persona {
    // atributos
    public String? Nombre;
    public int Edad;
    public String? DNI;

    // Comportamiento - Métodos de instancia
    // punto 2
    public void Imprimir() {
        Console.Write(this.Nombre + " ");
        Console.Write(this.Edad + " ");
        Console.WriteLine(this.DNI);
    }

    // punto 3
    public bool esMayorQue(Persona p) {
        return (this.Edad > p.Edad); 
    }
}