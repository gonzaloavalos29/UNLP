using CentroEventos.Aplicacion.Servicios;
namespace CentroEventos.Aplicacion.Entidades;

public class Usuario
{
    public Guid Id { get; set; } = Guid.NewGuid();
    public string Nombre { get; set; } = null!;
    public string Apellido { get; set; } = null!;
    public string Email { get; set; } = null!;
    public string HashPassword { get; set; } = null!;
    public List<Permiso> Permisos { get; set; } = new();
}
