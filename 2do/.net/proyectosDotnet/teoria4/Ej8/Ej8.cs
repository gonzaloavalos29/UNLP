 
// CASO 1
/* Foo f = new Foo();
f.Imprimir();
class Foo {
    string? _bar;
    public void Imprimir() {
        Console.WriteLine(_bar.Length);
    }
} */
// _bar es un campo de instancia (miembro de clase).
// en C#, los campos de instancia de tipo referencia se inicializan automáticamente a null si no se les asigna un valor explícito
// como _bar es null, cuando hacés _bar.Length estás intentando acceder a una propiedad de un objeto nulo ->
// lanza una excepción NullReferenceException.

// CASO 2
/* class Foo2 {
    public void Imprimir() {
        string? bar;
        Console.WriteLine(bar.Length);
    }
}
Foo2 f2 = new Foo2();
f2.Imprimir(); */
// bar es una variable local dentro del método Imprimir().
// a diferencia de los campos, las variables locales no se inicializan automáticamente en C#.
// El compilador no te permite usar una variable local no inicializada, así que esto ni siquiera compila.