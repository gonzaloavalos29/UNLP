using System;

class Cuenta {
    private double _monto;
    private int _titularDNI;
    private string? _titularNombre;

    // Constructor por defecto
    public Cuenta() : this("No especificado", 0) {
    }

    // Constructor con solo DNI
    public Cuenta(int dni) : this("No especificado", dni) {
    }

    // Constructor con solo nombre
    public Cuenta(string nombre) : this(nombre, 0) {
    }

    // Constructor completo
    public Cuenta(string nombre, int dni) {
        _titularNombre = nombre;
        _titularDNI = dni;
        _monto = 0;
    }

    public void Depositar(double monto) {
        _monto += monto;
    }

    public void Extraer(double monto) {
        if (monto <= _monto) {
            _monto -= monto;
        } else {
            Console.WriteLine("Operación cancelada, monto insuficiente");
        }
    }

    public void Imprimir() {
        Console.WriteLine($"Nombre: {_titularNombre}, DNI: {(_titularDNI == 0 ? "No especificado" : _titularDNI.ToString())}, Monto: {_monto}");
    }
}
