public class Ej7 {

    public static void Ejecutar(){ 
        Impresor.Imprimir(new A(), new B(), new C(), new D());
    }    
    class A : Letra {
        public override void Imprimir() {
            Console.WriteLine("Soy una instancia A");
        }
    }

    class B : Letra {
        public override void Imprimir() {
            Console.WriteLine("Soy una instancia B");
        }
    }

    class C : Letra {
        public override void Imprimir() {
            Console.WriteLine("Soy una instancia C");
        }
    }

    class D : Letra {
        public override void Imprimir() {
            Console.WriteLine("Soy una instancia D");
        }
    }

    abstract class Letra { // declarar clase abstracta para todas las clases de letras
        public abstract void Imprimir();
    }

    static class Impresor {
        public static void Imprimir(params object[] vector) {
            foreach (Letra l in vector) {
                l.Imprimir();
            }
        }
    }
}