using DiContainer;
using Microsoft.Extensions.DependencyInjection;

var servicios = new ServiceCollection();
servicios.AddSingleton<ILogger, LoggerNum>();
servicios.AddTransient<IServicioX, ServicioX>();
var proveedor = servicios.BuildServiceProvider();
// se obtiene el proveedor de servicios a partir de la colección de servicios.

var servicioX = proveedor.GetService<IServicioX>();
// se instancia y se devuelve un objeto de la clase ServicioX. No debemos preocuparnos por las dependencias que requiere ServicioX, serán provistas por el contenedor.
servicioX?.Ejecutar();

var logger = proveedor.GetService<ILogger>();
logger?.Log("Fin del programa");