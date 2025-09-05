namespace DiContainer;

class ProveedorServicios
{
    public ILogger GetLogger()
        => new LoggerConsola();
    public IServicioX GetServicioX()
        => new ServicioX(this.GetLogger()); // area concentrada del codigo donde se configuran todas las dependencias
// para crear un ServicioX se necesita un Logger. Esto no es problema para ProveedorServicios pues también puede autoproporcionárselo.
}