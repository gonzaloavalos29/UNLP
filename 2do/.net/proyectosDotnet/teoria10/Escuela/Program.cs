using Microsoft.EntityFrameworkCore;
using Escuela;

EscuelaSqlite.Inicializar(); //solo tiene efecto si
                            // la base de datos no existe

using var context = new EscuelaContext();

Alumno nuevo = new Alumno("Andrés");
nuevo.Examenes = new List<Examen>() { //dejamos en 0 el AlumnoId porque va a ser ignorado
       new Examen(0,"Lengua",7,DateTime.Parse("5/5/2022")),
       new Examen(0,"Matemática",6,DateTime.Parse("6/5/2022"))
   };
context.Add(nuevo);
context.SaveChanges();

foreach (Alumno a in context.Alumnos.Include(a => a.Examenes))
{
   Console.WriteLine(a.Nombre);
   a.Examenes?.ToList()
       .ForEach(ex => Console.WriteLine($" - {ex.Materia} {ex.Nota}"));
}