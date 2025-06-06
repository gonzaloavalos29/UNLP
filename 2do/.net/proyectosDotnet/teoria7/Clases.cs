class Persona : IAtendible
{
    public void Atender()
    {
        Console.WriteLine("Atendiendo persona");
    }

    public override string ToString() => "persona";
}

class Auto : IVendible, ILavable, IReciclable
{
    public void SeVendeA(Persona p)
    {
        Console.WriteLine($"Vendiendo auto a {p}");
    }

    public void Lavar()
    {
        Console.WriteLine("Lavando auto");
    }

    public void Secar()
    {
        Console.WriteLine("Secando auto");
    }

    public void Reciclar()
    {
        Console.WriteLine("Reciclando auto");
    }
}

class Libro : IAlquilable, IReciclable
{
    public void SeAlquilaA(Persona p)
    {
        Console.WriteLine($"Alquilando libro a {p}");
    }

    public void EsDevueltaPor(Persona p)
    {
        Console.WriteLine($"Libro devuelto por {p}");
    }

    public void Reciclar()
    {
        Console.WriteLine("Reciclando libro");
    }
}

class Pelicula : IAlquilable
{
    public void SeAlquilaA(Persona p)
    {
        Console.WriteLine($"Alquilando película a {p}");
    }

    public void EsDevueltaPor(Persona p)
    {
        Console.WriteLine($"Película devuelta por {p}");
    }
}

class PeliculaClasica : Pelicula, IVendible
{
    public void SeVendeA(Persona p)
    {
        Console.WriteLine($"Vendiendo película a {p}");
    }
}

class Perro : IVendible, IAtendible, ILavable
{
    public void SeVendeA(Persona p)
    {
        Console.WriteLine($"Vendiendo perro a {p}");
    }

    public void Atender()
    {
        Console.WriteLine("Atendiendo perro");
    }

    public void Lavar()
    {
        Console.WriteLine("Lavando perro");
    }

    public void Secar()
    {
        Console.WriteLine("Secando perro");
    }
}
