/* public class Ej1 {
    public static void Main() {
        string? userInput = "";
        string[] datos;
        List<Persona> listaPersonas = new List<Persona>();
        Persona gente;

        while (userInput != " ") {
            try {
                userInput = Console.ReadLine();
                datos = userInput.Split(",");
                if (datos.Length != 3) {
                    Console.WriteLine("Ingrese NOMBRE EDAD DNI por favor" + datos.Length);
                } else {
                    gente = new Persona();
                    gente.Nombre = datos[0];
                    gente.Edad = int.Parse(datos[1]);
                    gente.DNI = datos[2];
                    listaPersonas.Add(gente);
                }
            }
            catch (Exception e) {
                Console.WriteLine("ERROR: " + e.Message);
            };
        };
        Console.WriteLine("Nro)   Nombre   Edad    DNI.   ");
        for (int i = 0; i < listaPersonas.Count; i++) {
            Console.WriteLine(i + "      " + 
                            listaPersonas[i].Nombre + "  " + 
                            listaPersonas[i].Edad + "   " + 
                            listaPersonas[i].DNI);
        }
        // Se puede utilizar: Console.SetIn(new System.IO.StreamReader(nombreDeArchivo));
        // para cambiar la entrada estándar de la consola y poder leer directamente desde un archivo de texto.
    }
}
 */