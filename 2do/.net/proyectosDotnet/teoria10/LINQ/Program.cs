/* int[] vector = [1, 2, 3, 4, 5];
IEnumerable<int> secuencia = vector.Select(n => n * 3);
Mostrar(secuencia);


void Mostrar<T>(IEnumerable<T> secuencia)
{
   foreach (T elemento in secuencia)
   {
       Console.Write(elemento + " ");
   }
   Console.WriteLine();
} */

/* List<string> lista = ["uno", "dos", "tres"];
IEnumerable<string> secuencia = lista.Select(st => $"({st})".ToUpper());
Mostrar(secuencia);

void Mostrar<T>(IEnumerable<T> secuencia)
{
    foreach (T elemento in secuencia)
    {
        Console.Write(elemento + " ");
    }
    Console.WriteLine();
} */
/* var personas = Persona.GetLista();
personas.ForEach(p => Console.WriteLine(p)); // lista todas las personas
Console.WriteLine();
personas.Where(p => p.Edad >= 18) // un IEnumerable<Persona> no tiene método Foreach
    .ToList() // lo convierte en un List<Persona> para usar método Foreach
    .ForEach(p => Console.WriteLine(p)); // lista personas mayores de edad */

var alumnos = new List<Alumno>()
{
    new Alumno(1, "Juan"),
    new Alumno(2, "Ana"),
    new Alumno(3, "Laura")
};
var examenes = new List<Examen>()
{
    new Examen(2, "Inglés", 9),
    new Examen(1, "Inglés", 5),
    new Examen(1, "Álgebra", 10)
};
var listado = alumnos.GroupJoin(examenes,
    a => a.Id, // clave de matching en alumnos
    e => e.AlumnoId, // clave de matching en notas
    (a, susExamenes) => new
    {
        NombreAlumno = a.Nombre,
        Examenes = susExamenes
    });
foreach (var grup in listado)
{
    Console.Write($"Alumno: {grup.NombreAlumno}");
    Console.WriteLine($", Cant. exams.: {grup.Examenes.Count()}");
    foreach (var e in grup.Examenes)
    {
        Console.WriteLine($" {e.Materia} Nota:{e.Nota}");
    }
}