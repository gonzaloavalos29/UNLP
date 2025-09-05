using System;

class Ej2 {
    public static void Ejecutar()
    {
        A[] vector1 = [new C(1), new D(2), new B(3), new D(4), new B(5)];
        Console.WriteLine("Solo los que NO son C:");
        foreach (A a in vector1)
        {
            if (!(a is C))
                a.Imprimir();
        }

        A[] vector2 = [new C(1), new D(2), new B(3), new D(4), new B(5)];
        Console.WriteLine("Solo los que son exactamente B:");
        foreach (A a in vector2)
        {
            if (a.GetType() == typeof(B))
                a.Imprimir();
        }
    }
}
